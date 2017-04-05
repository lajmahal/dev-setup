#!/bin/bash

#set -x

echo "Installing vim" 
sudo apt-get install vim 

echo "Installing tmux" 
sudo apt-get install tmux

echo "Setting up symlinks"
cd ~ 
rm -rf .profile && ln -snf ~/dev/dev-setup/profile .profile 
rm -rf .bashrc && ln -snf ~/dev/dev-setup/bashrc .bashrc 
rm -rf .bash_aliases && ln -snf ~/dev/dev-setup/bash_aliases .bash_aliases 
rm -rf .tmux.conf && ln -snf ~/dev/dev-setup/tmux.conf .tmux.conf

