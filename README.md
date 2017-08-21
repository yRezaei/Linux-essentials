# Updating the system
sudo apt-get update

sudo apt-get upgrade -y

sudo apt-get dist-upgrade -y

# Installing the necessary packages for development 
sudo apt-get install build-essential ubuntu-restricted-extras -y

# Few useful applications
sudo apt-get install vim cmake git git-core terminator mercurial -y

# OpenGL related packages
sudo apt-get install mesa-utils libxmu-dev libxi-dev libgl-dev libosmesa-dev -y

# Customizing the username & path appearance in bash
echo 'export PS1="\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;45m\]@\[$(tput sgr0)\]\[\033[38;5;226m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;39m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n \[$(tput sgr0)\]\[\033[38;5;226m\]->\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> ~/.bashrc

source ~/.bashrc

# Google chrome repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/googlechrome.list'

sudo apt-get update

sudo apt-get install google-chrome-stable

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

sudo ln -s /usr/lib64/libGLEW.so.2.1 /usr/local/lib/libGLEW.so.2.1

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
cd ~/Downloadsgit clone https://github.com/SDL-mirror/SDL.git sdl

cd sdl

./configure

make

sudo make install

cd && rm -rf ~/Downloads/sdl

# Install Anaconda continume

cd ~/Downloads

wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh

bash Anaconda3-4.4.0-Linux-x86_64.sh

rm Anaconda3-4.4.0-Linux-x86_64.sh 

source ~/.bashrc

conda update conda


# Latex
sudo apt-get install texlive-full -y

sudo apt-get install texstudio -y

# Eigen - C++ template library for linear algebra
cd ~/Downloads

hg clone https://bitbucket.org/eigen/eigen/

cd eigen && mkdir build && cd build && cmake ..

sudo make install

cd && rm -rf ~/Downloads/eigen
