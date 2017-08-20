# Updating the system
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

# Installing the necessary packages for development 
sudo apt-get install build-essential ubuntu-restricted-extras -y

# Few useful applications
sudo apt-get install vim cmake terminator -y

# OpenGL related packages
sudo apt-get install mesa-utils libxmu-dev libxi-dev libgl-dev libosmesa-dev -y

# Modifying the username & path appearance in bash
echo 'export PS1="\[\033[38;5;190m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;190m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> ~/.bashrc
source ~/.bashrc

# Google chrome repository
1. wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
2. sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/googlechrome.list'
3. sudo apt-get update
4. sudo apt-get install google-chrome-stable

# Visual studio code repository
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code

# NVIDIA driver repository
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update

# Glew - The OpenGL Extension Wrangler Library
cd ~/Downloads
git clone https://github.com/nigels-com/glew.git glew
cd glew
make extensions
make
sudo make install
cd && rm -rf ~/Downloads/glew

# GLM - OpenGL Mathematics
cd ~/Downloads
git clone https://github.com/g-truc/glm.git glm
cd glm
cmake .
make
sudo make install
cd && rm -rf ~/Downloads/glm

# SDL - Simple DirectMedia Layer
cd ~/Downloads
git clone https://github.com/SDL-mirror/SDL.git sdl
cd sdl
./configure
make
sudo make install
cd && rm -rf ~/Downloads/sdl

# Install Anaconda continume
1. cd ~/Downloads
2. wget -O Anaconda.sh https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh
3. bash Anaconda.sh -b -p ~/anaconda
4. rm Anaconda.sh
5. echo 'export PATH="~/anaconda/bin:$PATH"' >> ~/.bashrc 
source .bashrc
conda update conda

