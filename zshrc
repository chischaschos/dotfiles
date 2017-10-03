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
plugins=(git osx ruby autoenv docker vim nvm)

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
export GOPATH=~/Projects/GOPATH17

PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
PATH="/usr/local/opt/qt5/bin:$PATH"
PATH="$HOME/usr/local/bin:$GOPATH/bin:$PATH"
export -U PATH

export CDPATH=.:~:~/Projects

source ~/.aliases

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

source /usr/local/opt/autoenv/activate.sh

# added by travis gem
[ -f /Users/ed/.travis/travis.sh ] && source /Users/ed/.travis/travis.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

