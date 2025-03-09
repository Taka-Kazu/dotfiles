#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

sh -c "$(wget -O- https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
echo "source $SCRIPT_DIR/vimrc" >> ~/.vimrc

mkdir -p ~/.vim/undo

echo "installing powerline font"
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/powerline_fonts \
&& cd /tmp/powerline_fonts \
&& ./install.sh

echo "==="
echo "please set your terminal font as 'Ubuntu Mono derivative Powerline Regular'"
echo "==="

echo "open vim and run ':call dein#install()'"
echo "setting vim end"

echo "setting screen"
echo "setting screen end"

echo "setting tmux"
echo "source $SCRIPT_DIR/tmux.conf" >> ~/.tmux.conf
echo "setting tmux end"

echo "setting inputrc"
cat $SCRIPT_DIR/inputrc >> ~/.inputrc
echo "setting inputrc end"

echo "setting bash_aliases"
echo "source $SCRIPT_DIR/bash_aliases" >> ~/.bash_aliases
echo "setting bash_aliases end"
