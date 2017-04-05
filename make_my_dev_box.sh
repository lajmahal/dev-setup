#!/bin/bash

#set -x

echo "Installing vim" 
sudo apt-get install vim 

echo "Setting up symlinks"
cd ~ 
rm -rf .profile && ln -snf ~/dev/dev-setup/profile .profile 
rm -rf .bashrc && ln -snf ~/dev/dev-setup/bashrc .bashrc 

