#!/bin/bash
# sudo apt-get install tmux git-absorb
# bash strict mode
set -euo pipefail
IFS=$'\n\t'

SCRIPT=$(realpath "$0")
DIR=$(dirname "$SCRIPT")

ln -s "$DIR"/src/.vimrc ~/.vimrc
ln -s "$DIR"/src/.clang-format ~/.clang-format
ln -s "$DIR"/src/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload
cp src/.vim/autoload/* ~/.vim/autoload/

#################################################################################################################
# Install and configure nvim
#################################################################################################################
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

## Optional: exposing nvim globally.
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

## Install astronvim
mkdir -p ~/.config
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

## Add personal astronvim config
mkdir -p $HOME/.config/nvim/lua/user
git clone https://github.com/Ngalstyan4/astronvim_config.git $HOME/.config/nvim/lua/user

#################################################################################################################
# Configure git
#################################################################################################################
git config --global user.email "narekg@berkeley.edu"
git config --global user.name "Narek Galstyan"
git config --global core.editor vim
git config --global pull.ff only
echo 'export EDITOR=nvim' >> ~/.bashrc

# Install a compiler (needed for python installation)
sudo apt install -y make build-essential
## more libs needed for python build
sudo apt-get install -y make libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl

#################################################################################################################
# Install python
#################################################################################################################
##  Step 1: Install pyenv
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

## Step 2: Install Python 3.10
echo "Installing Python 3.10..."
pyenv install 3.10.0
pyenv global 3.10.0


#################################################################################################################
# install node nvm
#################################################################################################################
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
### source the nvm bash function
. ~/.nvm/nvm.sh
nvm install node

#################################################################################################################
# Install lazygit
#################################################################################################################
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
ln -s /usr/local/bin/lazygit /usr/local/bin/lg


#################################################################################################################
# Install command line niceties
#################################################################################################################
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
sudo apt-get install ripgrep tmux 
