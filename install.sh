#!/bin/bash

git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim --depth=1

mkdir ~/.vim/undo

echo "open vim and run ':call dein#install()'"
