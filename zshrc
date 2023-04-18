[ -f ~/.local.zshrc ] && source ~/.local.zshrc

bindkey -e

unsetopt correct
setopt extended_glob

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
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export CDPATH=.:~:~/Projects

source ~/.aliases

# >>> fzf
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'
# <<< fzf

BASE16_SHELL_PATH="$HOME/.config/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"

# export BAT_THEME="Solarized (dark)"
export BAT_THEME="Solarized (light)"
# export BAT_THEME="Monokai Extended Light"

# >>> chruby
[[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
# <<< chruby

[[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)

# >>> Visual Studio
# export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# <<< Visual Studio

# >>> NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# <<< NVM

# >>> GO
export GOPATH=~/Projects/GOPATH19
# <<< GO

PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$(pwd)/bin:$HOME/.local/bin:$PATH

export -U PATH

eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
