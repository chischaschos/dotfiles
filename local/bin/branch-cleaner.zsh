#!/bin/zsh

# A script to safely prune local Git branches and worktrees whose remote
# counterparts have been deleted.

# Exit immediately if a command exits with a non-zero status.
set -e

echo "=> Fetching the latest changes from the remote and pruning stale remote-tracking branches..."
# The --prune (-p) flag is essential. It removes remote-tracking refs
# that no longer exist on the remote, which allows the next command to
# identify them as "[gone]".
git fetch --prune

echo "=> Searching for local branches with a deleted upstream..."

# Use a while-read loop for safety and readability.
# 1. `git for-each-ref`: Iterates through all local branches.
# 2. `--format='%(refname:short) %(upstream:track)'`: Prints the branch name and its upstream status.
# 3. `awk '$2 == "[gone]" {print $1}'`: Filters for lines where the status is "[gone]" and prints the name.
git for-each-ref --format='%(refname:short) %(upstream:track)' refs/heads | \
awk '$2 == "[gone]" {print $1}' | \
while read -r branch; do
  # Check if the stale branch is being used by a worktree.
  # We search for the exact branch name in brackets, e.g., "[my-branch]".
  worktree_info=$(git worktree list | grep "\[$branch\]")

  if [[ -n "$worktree_info" ]]; then
    # This branch is a worktree. We must remove the worktree, not just the branch.
    worktree_path=$(echo "$worktree_info" | awk '{print $1}')

    echo -n "  - Stale branch '$branch' is an active worktree at '$worktree_path'. Remove worktree? [y/N] "
    read -q
    echo # Move to the next line after user input

    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      # Use `git worktree remove` which cleans up both the directory and Git's internal records.
      # The --force flag is needed if there are untracked or modified files in the worktree.
      git worktree remove --force "$worktree_path"
      echo "    Worktree for '$branch' removed."
    else
      echo "    Skipping worktree '$branch'."
    fi
  else
    # This is a regular local branch, not associated with a worktree.
    echo -n "  - Delete stale local branch '$branch'? [y/N] "
    read -q
    echo # Move to the next line after user input

    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
      git branch -D "$branch"
      echo "    Branch '$branch' deleted."
    else
      echo "    Skipping branch '$branch'."
    fi
  fi
done

echo "=> Pruning complete."

