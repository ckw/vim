#! /bin/sh

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle

git clone git://github.com/tpope/vim-fugitive.git
git clone https://github.com/vim-scripts/LustyJuggler.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/Lokaltog/vim-powerline.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/mileszs/ack.vim.git
