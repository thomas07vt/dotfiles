# Symbolic link for .vimrc
ln -s "`pwd`/.vimrc" ~/.vimrc

# Set up the  molokai vim color scheme 
mkdir -p ~/.vim/colors
ln -s "`pwd`/colors/monokai.vim" ~/.vim/colors/monokai.vim
