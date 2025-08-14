#!/bin/bash - 
cp vimrc ~/.vimrc
cp -r .vim ~/
mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula

