#!/bin/bash
# sudo apt-get install tmux
ln -s "$(pwd)"/src/.vimrc ~/.vimrc
ln -s "$(pwd)"/src/.clang-format ~/.clang-format
ln -s "$(pwd)"/src/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload
cp src/.vim/autoload/* ~/.vim/autoload/

git config --global user.email "narekg@berkeley.edu"
git config --global user.name "Narek Galstyan"
