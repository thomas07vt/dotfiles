cur_dir=`pwd`

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

#####
# Restore original ~/.profile
#####
if [[ -e ~/.profile_vimp ]]
then
  rm ~/.profile
  mv ~/.profile_vimp ~/.profile
fi

#####
# Restore original ~/.bashrc
#####
if [[ -e ~/.bashrc_vimp ]]
then
  rm ~/.bashrc
  mv ~/.bashrc_vimp ~/.bashrc
fi
