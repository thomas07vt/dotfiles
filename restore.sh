cur_dir=`pwd`

#####
# Restore gnome-terminal settings
#####
if [[ -e ~/.gconf/apps/gnome-terminal_vimp ]]
then
  rm -rf ~/.gconf/apps/gnome-terminal
  mv ~/.gconf/apps/gnome-terminal_vimp ~/.gconf/apps/gnome-terminal
fi

#####
# Restore the original ~/.vim folder
#####
if [[ -e ~/.vim_vimp ]]
then
  rm -rf ~/.vim
  mv ~/.vim_vimp ~/.vim
fi

#####
# Restore original ~/.vimrc
#####
if [[ -e ~/.vimrc_vimp ]]
then
  rm ~/.vimrc
  mv ~/.vimrc_vimp ~/.vimrc
fi

