#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
vim_version=`vim --version | grep -o '[0-9]*'`
vim_version=${vim_version:0:1}

if [ $((${vim_version})) -lt 8 ]; then
    echo "installed vim version < 8"
    cd ~/.vim/dein/repos/github.com/Shougo/dein.vim
    git checkout 1.5
    cd $SCRIPT_DIR
else
    echo "installed vim version >= 8"
fi

mkdir ~/.vim/undo

echo "source $SCRIPT_DIR/vimrc" >> ~/.vimrc

echo "open vim and run ':call dein#install()'"
