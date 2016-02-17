export HISTCONTROL="ignoreboth"
export HISTFILESIZE=1000
#export PATH="$HOME/.rbenv/bin:/usr/local/bin:$PATH"
#eval "$(rbenv init -)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

# Colorize the Terminal
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Alias definitions.
. ~/.bash_aliases

# Git autocomplete
. ~/.git-prompt.bash
. ~/.git-completion.bash

if [ "$color_prompt" = yes ]; then
  # Two lines:
  git_prompt='$(__git_ps1 " (%s)")'
  line1="\[\e[0;34m\]\T$git_prompt \[\e[0;34m\]\w\n"
  line2="\\[->\\] \[\e[0;33m\] "
  PS1="$line1$line2"
else
  line1="\T \w\n"
  line2='$(rvm_version)$(git_status)$ \\[➜\\]'
  PS1="$line1$line2"
fi
unset color_prompt force_color_prompt

# MacPorts Installer addition on 2011-06-16_at_22:14:47: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:$EC2_HOME/bin
export PATH="/usr/local/share/aclocal:${PATH}"
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"

# Finished adapting your PATH environment variable for use with MacPorts.

test -r /sw/bin/init.sh && . /sw/bin/init.sh

#set -o vi

export EDITOR=mvim
export RBX_ROOT=$HOME/.rbenv/versions/rubinius
export PATH=$PATH:$RBX_ROOT/gems/1.9/bin
export RBXOPT=-X19

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"

[[ -s /Users/emmanueldelgado/.nvm/nvm.sh ]] && . /Users/emmanueldelgado/.nvm/nvm.sh # This loads NVM

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
