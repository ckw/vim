#! /bin/sh

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cp -r after ~/.vim

cd ~/.vim/bundle

git clone git://github.com/tpope/vim-fugitive.git
git clone https://github.com/vim-scripts/LustyJuggler.git
echo "remember to change default LustyJuggler invoker to <Leader><Leader>"
echo "note: you actually have to change the script"
echo ""

git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/Lokaltog/vim-powerline.git
echo "might need to export TERM=xterm-256color in .bashrc"

git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/mileszs/ack.vim.git
git clone https://github.com/Lokaltog/vim-easymotion/

git clone https://github.com/flazz/vim-colorschemes.git
ln -s ~/.vim/bundle/colorschemes/colors ~/.vim/colors

git clone https://github.com/Lokaltog/vim-easymotion.git

git clone https://github.com/pdf/ubuntu-mono-powerline-ttf.git ~/.fonts/ubuntu-mono-powerline-ttf
fc-cache -vf


