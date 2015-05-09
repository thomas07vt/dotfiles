cur_dir=`pwd`

# Symbolic link for .vimrc
ln -s "$cur_dir/.vimrc" ~/.vimrc

# Set up the  molokai vim color scheme 
mkdir -p ~/.vim/colors
ln -s "$cur_dir/colors/monokai.vim" ~/.vim/colors/monokai.vim

# Install pathogen.vim for plugins and runtime files
mkdir -p ~/.vim/autoload ~/.vim/bundle
ln -s "$cur_dir/autoload/pathogen.vim" ~/.vim/autoload/pathogen.vim

# Install NERDTree
ln -s "$cur_dir/bundle/nerdtree" ~/.vim/bundle/nerdtree

# Adding custom gnome-terminal settings
# Let's backup the original gnome-settings...
# I should probably just do a cp -r instead...
mv ~/.gconf/apps/gnome-terminal ~/.gconf/apps/gnome-terminal-bak
ln -s "$cur_dir/gnome-terminal" ~/.gconf/apps/gnome-terminal
