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

# xclip - for copying ssh keys to clipboard and stuff 
echo "Installing xclip" 
sudo apt-get install xclip

echo "Installing java" 
sudo apt-get install openjdk-8-jdk

echo "Installing IntelliJ IDEA" 
cd ~/Downloads 
wget 'https://download.jetbrains.com/idea/ideaIC-2017.1-no-jdk.tar.gz'
mkdir -p ~/tools 
cd ~/tools 
tar xzvf ../Downloads/ideaIC-2017.1-no-jdk.tar.gz

echo "Setting up symlinks"
cd ~ 
rm -rf .profile && ln -snf ~/dev/dev-setup/profile .profile 
rm -rf .bashrc && ln -snf ~/dev/dev-setup/bashrc .bashrc 
rm -rf .bash_aliases && ln -snf ~/dev/dev-setup/bash_aliases .bash_aliases 
rm -rf .tmux.conf && ln -snf ~/dev/dev-setup/tmux.conf .tmux.conf
rm -rf .vimrc && ln -snf ~/dev/dev-setup/vimrc .vimrc 
rm -rf ~/tools/idea && ln -snf ~/tools/idea-IC-171.3780.107 ~/tools/idea 

