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

echo "Installing JDK8" 
sudo apt-get install openjdk-8-jdk

DOWNLOAD_DIR="~/Downloads"
TOOLS_DIR="~/tools"

echo "Installing IntelliJ IDEA" 
cd $DOWNLOAD_DIR 
wget 'https://download.jetbrains.com/idea/ideaIC-2017.1-no-jdk.tar.gz'
mkdir -p $TOOLS_DIR 
cd $TOOLS_DIR 
tar xzvf "$DOWNLOAD_DIR/ideaIC-2017.1-no-jdk.tar.gz"

echo "Installing PyCharm"
cd $DOWNLOAD_DIR
wget 'https://download.jetbrains.com/python/pycharm-community-2017.1.tar.gz'
mkdir -p $TOOLS_DIR
cd $TOOLS_DIR
tar xzvf "$DOWNLOAD_DIR/pycharm-community-2017.1.tar.gz"

DEV_SETUP="~/dev/dev-setup"
echo "Setting up symlinks"
cd ~ 
rm -rf .profile && ln -snf $DEV_SETUP/profile .profile 
rm -rf .bashrc && ln -snf $DEV_SETUP/bashrc .bashrc 
rm -rf .bash_aliases && ln -snf $DEV_SETUP/bash_aliases .bash_aliases 
rm -rf .tmux.conf && ln -snf $DEV_SETUP/tmux.conf .tmux.conf
rm -rf .vimrc && ln -snf $DEV_SETUP/vimrc .vimrc 
rm -rf "$TOOLS_DIR/idea" && ln -snf "$TOOLS_DIR/idea-IC-171.3780.107/" ~/tools/idea
rm -rf "$TOOLS_DIR/pycharm" && ln -snf "$TOOLS_DIR/pycharm-community-2017.1/" ~/tools/pycharm
