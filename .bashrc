export EDITOR="vim"
alias gemset="rvm gemset list"
alias gs="git status"
alias gb="git branch -a"
alias gps="git push"
alias gpf="git push --force"
alias gpl="git pull"
alias gco='git checkout'
alias gcb="git checkout -b"
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'

historySearch() {
  if [ $1 = "run" ]
  then
    cmd=$(history | grep "^  $2  " | sed s/"  $2  "/""/)
    $cmd
  else
    history | grep "$@"
  fi
}
alias hs=historySearch

export NVM_DIR="/home/jthomas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PORT="9999"
alias mygo="cd ~/code/go/src/github.com/thomas07vt/"
alias cinch="cd ~/code/go/src/github.com/thomas07vt/cinch"
alias gin="gin -p 9991 -a 9999"

alias vimclean="vim -u NONE"

# RVM
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
if [ -f '.ruby-gemset' ]; then cd .; fi

# Xmodmap
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

export PATH="$GEM_HOME/bin:$PATH"

