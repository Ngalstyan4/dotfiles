#!/bin/bash
# sudo apt-get install tmux
ln -s "$(pwd)"/src/.vimrc ~/.vimrc
ln -s "$(pwd)"/src/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload
cp src/.vim/autoload/* ~/.vim/autoload/
