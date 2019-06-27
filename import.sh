cur_dir=`pwd`

#####
# Check to see if a .vimrc exists. If so, take a backup
#####
if [[ -e ~/.vimrc ]]
then
  mv ~/.vimrc ~/.vimrc_vimp
fi
# Link the downloaded .vimrc to the users home directory
ln -s "$cur_dir/.vimrc" ~/.vimrc

#####
# Let's backup the ~/.vim folder
#####
if [[ -e ~/.vim ]]
then
  mv ~/.vim ~/.vim_vimp
fi

######
# Now we can move our own stuff into the ~/.vim folder
######
mkdir -p ~/.vim/

ln -s "$cur_dir/colors" ~/.vim/colors
ln -s "$cur_dir/autoload/" ~/.vim/autoload
ln -s "$cur_dir/templates/" ~/.vim/templates

#####
# Import .Xmodmap
#####
ln -s "$cur_dir/.Xmodmap" ~/.Xmodmap

echo -e "\nsource $cur_dir/.bashrc" >> ~/.bashrc

echo 'done'
echo 'run :PlugInstall to install vim plugins'
