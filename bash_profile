# Genesis
PATH="${PATH}:${HOME}/.genesis/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add /usr/local/bin first in path
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Git autocompletion + rep status in prompt
source /usr/local/Cellar/git/1.7.12/etc/bash_completion.d/git-completion.bash
source /usr/local/Cellar/git/1.7.12/etc/bash_completion.d/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
export CLICOLOR=1

. /usr/local/etc/bash_completion

export TERM=xterm-256color
export EDITOR=vim
export VISUAL=vim

stty stop undef
PS1='\[\033[0;32m\]\W\[\033[0m\]$(__git_ps1 " \[\033[0;35m\]%s\[\033[0m\]")\[\033[0;34m\]\$\[\033[0m\] '

alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
alias webserver="python -m SimpleHTTPServer"
alias emacs="open -a emacs"
alias rrspec="rr rspec"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

source ~/.base16-default.dark.sh

export PATH=$PATH:/usr/local/opt/go/libexec/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home/

source ~/.nvm/nvm.sh
