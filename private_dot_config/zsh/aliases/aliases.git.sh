alias g='git'
alias ggraph='git log --oneline --all --graph --decorate'
# git logs cool-looking tree of every commit with metadata (author and stuff)
alias ggraph-w-authors='git log --all --graph --decorate'
alias gfetch='git fetch --all --tags'
alias greset='git reset --hard'
alias gclean='git clean -fdx'

alias gsd='git diff --submodule=log'
alias glog='git log --oneline --decorate --graph'
alias glog-self='git log --author="$(git config user.name)"'

alias gsu='git submodule update'
alias gsf='git submodule update --force --rebase'
