#####
# Misc utils
alias sp='nohup sleep 1500 && for i in {1..3}; do say "Pomodoro is over"; done &'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias be='bundle exec'
alias sr='spring rspec'
alias bo='bundle open'
alias ber="bundle exec rake"
alias cuke="be cucumber"
alias reload_bash='source ~/.bash_profile'
alias f='be foreman'
alias fs='be foreman start'

#####
# Git http://library.edgecase.com/git_immersion/lab_11.html
alias gst='git status '
alias gaa='git add '
alias gb='git branch '
alias gci='git commit'
alias gdf='git diff'
alias gco='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias grv='git remote -v'

# database migrate
alias rdbm='rake db:migrate'

# heroku
alias h='heroku'

# tests
alias rspec='rake spec'

# rails logs, tailing and cleaning
alias rails_log='tail -f ./log/development.log'
alias rails_test_log='tail -f ./log/test.log'
alias pow_log='tail -f ~/Library/Logs/Pow/access.log'

alias ctl='> ./log/test.log'
alias cdl='> ./log/development.log'

# bare vim stuff
alias myvim='vim -u ~/.vimrc.mine'

# billfloat
alias qa-getcash-log="ssh -t hrbbqa 'tail -f /var/log/rails/getcash/qa.log'"
alias qa-platform-log="ssh -t hrbbqa 'tail -f /var/log/rails/platform/qa.log'"
alias ccat=pygmentize -g
alias tmux="TERM=screen-256color-bce tmux"
