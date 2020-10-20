#!/bin/bash
ln -s "$(pwd)"/src/.vimrc ~/.vimrc

mkdir -p ~/.vim/autoload
cp src/.vim/autoload/* ~/.vim/autoload/
