# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby vim)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt correct

export TERM=xterm-256color

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt hist_ignore_all_dups inc_append_history hist_find_no_dups
HISTSIZE=20000
SAVEHIST=10000

export EDITOR=/usr/local/bin/nvim
export GOPATH=~/Projects/GOPATH19

PATH=/usr/local/bin:/usr/local/sbin:$GOPATH/bin:$PATH

export -U PATH

export CDPATH=.:~:~/Projects

source ~/.aliases

# ruby
eval "$(rbenv init -)"

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
