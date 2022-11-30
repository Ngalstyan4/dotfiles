#!/bin/bash
# sudo apt-get install tmux

SCRIPT=$(realpath "$0")
DIR=$(dirname "$SCRIPT")

ln -s "$DIR"/src/.vimrc ~/.vimrc
ln -s "$DIR"/src/.clang-format ~/.clang-format
ln -s "$DIR"/src/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload
cp src/.vim/autoload/* ~/.vim/autoload/

git config --global user.email "narekg@berkeley.edu"
git config --global user.name "Narek Galstyan"
git config --global core.editor vim
echo 'export EDITOR=vim' >> ~/.bashrc


git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
