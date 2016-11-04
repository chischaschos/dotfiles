# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx ruby rbenv autoenv docker vim nvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt correct

export TERM=xterm-256color

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=/usr/local/bin/vim

PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
export -U PATH

export CDPATH=.:~:~/Projects

source ~/.aliases
