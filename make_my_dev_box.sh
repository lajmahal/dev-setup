#!/bin/bash

#set -x

echo "Installing vim" 
sudo apt-get install vim 

echo "Installing tmux" 
sudo apt-get install tmux

echo "Installing pip" 
sudo apt-get install python-pip
pip install --upgrade pip

# Powerline - http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
echo "Installing powerline" 
pip install --user git+git://github.com/Lokaltog/powerline
wget 'https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf' 'https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf'
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo "Setting up symlinks"
cd ~ 
rm -rf .profile && ln -snf ~/dev/dev-setup/profile .profile 
rm -rf .bashrc && ln -snf ~/dev/dev-setup/bashrc .bashrc 
rm -rf .bash_aliases && ln -snf ~/dev/dev-setup/bash_aliases .bash_aliases 
rm -rf .tmux.conf && ln -snf ~/dev/dev-setup/tmux.conf .tmux.conf
rm -rf .vimrc && ln -snf ~/dev/dev-setup/vimrc .vimrc 


