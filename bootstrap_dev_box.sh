#!/bin/bash 

set -x

# Install git! 
sudo apt-get install git

# Clone the dev-setup repo 
git clone https://github.com/lajmahal/dev-setup.git ~/dev/dev-setup 

# Make the rest of the dev-box 
chmod u+x ~/dev/dev-setup/make_my_dev_box.sh
exec ~/dev/dev-setup/make_my_dev_box.sh 
