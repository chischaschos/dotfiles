eval "$(starship init zsh)"

bindkey -e

unsetopt correct
setopt extended_glob

export TERM=xterm-256color

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt hist_ignore_all_dups inc_append_history hist_find_no_dups
HISTSIZE=20000
SAVEHIST=10000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

export EDITOR=nvim
export GOPATH=~/Projects/GOPATH19

PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export -U PATH

export CDPATH=.:~:~/Projects

source ~/.aliases

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# base16 coloring
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

# node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

# hook https://direnv.net/
eval "$(direnv hook zsh)"

[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
export BAT_THEME="OneHalfLight"

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/emmanueldelgado/.kube/config:/Users/emmanueldelgado/.kube/config.shopify.cloudplatform

if [ -e /Users/emmanueldelgado/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/emmanueldelgado/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
