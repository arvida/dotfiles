export CLICOLOR=1

export TERM=xterm-256color
export LSCOLORS=ExFxCxDxBxegedabagacad

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}
parse_git_modified() {
  [[ $(git status 2> /dev/null | grep modified:) != "" ]] && echo " •"
}
export PS1="\[\033[0;32m\]\[\033[0;36m\]\w\[\033[0;33m\]\$(parse_git_branch)\[\033[0;31m\]\$(parse_git_modified)\[\033[0;34m\] $\[\033[0m\] "

YELLOW="\[\033[0;33m\]"

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim

PATH="~/bin:/usr/local/bin:${PATH}:/usr/local/sbin:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export PATH

PATH="${PATH}:${HOME}/bin"
export PATH
PATH="${PATH}:${AWS_IAM_HOME}/bin"
export PATH

source ~/.git-completion.bash

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

stty stop undef

export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
