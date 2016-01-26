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

# Set up the  molokai vim color scheme
mkdir -p ~/.vim/colors
ln -s "$cur_dir/colors/monokai.vim" ~/.vim/colors/monokai.vim

# Install pathogen.vim for plugins and runtime files
mkdir -p ~/.vim/autoload ~/.vim/bundle
ln -s "$cur_dir/autoload/pathogen.vim" ~/.vim/autoload/pathogen.vim

# Install NERDTree
mkdir -p ~/.vim/bundle
ln -s "$cur_dir/bundle/nerdtree" ~/.vim/bundle/nerdtree

# Install ag.vim
ln -s "$cur_dir/bundle/ag.vim" ~/.vim/bundle/ag.vim

# Install Rust vim
ln -s "$cur_dir/bundle/rust.vim" ~/.vim/bundle/rust.vim

# Install nerd commenter
ln -s "$cur_dir/bundle/nerdcommenter" ~/.vim/bundle/nerdcommenter

# Adding custom gnome-terminal settings
# Let's backup the original gnome-settings...
if [[ -e ~/.gconf/apps/gnome-terminal ]]
then
  mv ~/.gconf/apps/gnome-terminal ~/.gconf/apps/gnome-terminal_vimp
  mkdir -p ~/.gconf/apps/gnome-terminal
  cp -r ./gnome-terminal/* ~/.gconf/apps/gnome-terminal/
fi

