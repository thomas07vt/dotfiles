# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:/home/jthomas/.local/share/umake/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/heroku/bin"
export PATH="$PATH:$HOME/bin"

export GOPATH=$HOME/code/go
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin" # Adding Go to the path

source "$HOME/.sensitive"

