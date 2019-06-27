export EDITOR="vim"
export PORT="9999"
export GOPATH=$HOME/code/go

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
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
alias vi='vim'
alias vimclean="vim -u NONE"
alias dokku='$HOME/.dokku/contrib/dokku_client.sh'
alias qq="exit"
alias xmod="xmodmap ~/.Xmodmap"

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

# User specific aliases and functions
complete -cf sudo

# including this ensures that new gnome-terminal tabs keep the parent `pwd` !
if [ -e /etc/profile.d/vte.sh ]; then
    . /etc/profile.d/vte.sh
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/home/jthomas/.local/share/umake/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/heroku/bin"
export PATH="$GEM_HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/home/jthomas/.local/share/umake/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/heroku/bin"
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin" # Adding Go to the path

# RVM
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source "$HOME/.sensitive"
