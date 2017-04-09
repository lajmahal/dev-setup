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

DOWNLOAD_DIR="$HOME/Downloads"
TOOLS_DIR="$HOME/tools"

echo "Installing IntelliJ IDEA" 
ARCHIVE_NAME="ideaIC-2017.1-no-jdk.tar.gz"
cd $DOWNLOAD_DIR 
rm -rf $ARCHIVE_NAME
wget "https://download.jetbrains.com/idea/$ARCHIVE_NAME"
mkdir -p $TOOLS_DIR 
cd $TOOLS_DIR 
tar xzvf "$DOWNLOAD_DIR/$ARCHIVE_NAME"

echo "Installing PyCharm"
ARCHIVE_NAME="pycharm-community-2017.1.tar.gz"
cd $DOWNLOAD_DIR
rm -rf $ARCHIVE_NAME
wget "https://download.jetbrains.com/python/$ARCHIVE_NAME"
mkdir -p $TOOLS_DIR
cd $TOOLS_DIR
tar xzvf "$DOWNLOAD_DIR/$ARCHIVE_NAME"

DEV_SETUP="dev/dev-setup"
echo "Setting up symlinks"
cd ~ 
rm -rf .profile && ln -snf $DEV_SETUP/profile .profile 
rm -rf .bashrc && ln -snf $DEV_SETUP/bashrc .bashrc 
rm -rf .bash_aliases && ln -snf $DEV_SETUP/bash_aliases .bash_aliases 
rm -rf .tmux.conf && ln -snf $DEV_SETUP/tmux.conf .tmux.conf
rm -rf .vimrc && ln -snf $DEV_SETUP/vimrc .vimrc
cd $TOOLS_DIR
rm -rf idea && ln -snf idea-IC-171.3780.107 idea
rm -rf pycharm && ln -snf pycharm-community-2017.1 pycharm
