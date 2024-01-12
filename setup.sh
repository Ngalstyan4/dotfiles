#!/bin/bash
# sudo apt-get install tmux git-absorb

SCRIPT=$(realpath "$0")
DIR=$(dirname "$SCRIPT")

ln -s "$DIR"/src/.vimrc ~/.vimrc
ln -s "$DIR"/src/.clang-format ~/.clang-format
ln -s "$DIR"/src/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload
cp src/.vim/autoload/* ~/.vim/autoload/

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# add nvim config
mkdir -p $HOME/.config/nvim/lua/user
git clone https://github.com/Ngalstyan4/astronvim_config.git $HOME/.config/nvim/lua/user

git config --global user.email "narekg@berkeley.edu"
git config --global user.name "Narek Galstyan"
git config --global core.editor vim
git config --global pull.ff only
echo 'export EDITOR=nvim' >> ~/.bashrc

# install python
# Step 1: Install pyenv
# Check if pyenv is already installed
if ! command -v pyenv &> /dev/null
then
    echo "Installing pyenv..."
    # The installation commands can vary depending on the operating system.
    # Below are the commands for Ubuntu. 
    # You might need to adjust these commands for other operating systems.
    curl https://pyenv.run | bash

    # Add pyenv to path
    echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init --path)"' >> ~/.bashrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc

    # Apply changes to current shell
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init --path)"
    eval "$(pyenv virtualenv-init -)"
else
    echo "pyenv already installed."
fi

# Step 2: Install Python 3.10
echo "Installing Python 3.10..."
pyenv install 3.10.0
pyenv global 3.10.0



git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
