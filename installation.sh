# Updating the system
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade -y

# Installing the necessary packages for development 
sudo apt-get install build-essential ubuntu-restricted-extras -y

# Few useful applications
sudo apt-get install wget curl vim cmake git git-core terminator mercurial libtool pkg-config autoconf automake -y

# OpenGL related packages
sudo apt-get install mesa-utils libxmu-dev libxi-dev libgl-dev libosmesa-dev -y

# Customizing the username & path appearance in bash
echo 'export PS1="\[\e[38;5;184m\]\u\[\e[38;5;44m\]@\[\e[38;5;184m\]\h \[\e[38;5;44m\]\w \[\e[38;5;255m\]>\[\e[00m\] "' >> ~/.bashrc
source ~/.bashrc

# Latest GCC compiler
sudo apt-get install software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update && sudo apt-get upgrade -y && \
sudo apt-get install gcc-7 g++-7 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7

# Python 3.x (Anaconda continum)
cd ~/Downloads && \
latest=$(curl -L http://repo.continuum.io/archive/index.html | grep Linux-x86_64.sh | perl -nl -e 'm@<a.*? href="(.+)">(.+)</a@ig; print "$2\0$1"' | sort -nr | head -n 1 | cut -d '' -f2 | sed 's@./@@') && \
wget http://repo.continuum.io/archive/$latest && bash $latest && cd && rm -rf $latest

# Visual studio code
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
sudo apt-get update && \
sudo apt-get install code

# Glew (The OpenGL Extension Wrangler Library)
cd ~/Downloads && git clone https://github.com/nigels-com/glew.git glew && \
cd glew && make extensions &&  make &&  sudo make install && \
sudo ln -s /usr/lib64/libGLEW.so.2.1 /usr/local/lib/libGLEW.so.2.1 && \
cd && rm -rf ~/Downloads/glew

# GLM (OpenGL Mathematics)
cd ~/Downloads && \
git clone https://github.com/g-truc/glm.git glm &&  cd glm &&  cmake . && \
make &&  sudo make install &&  cd && rm -rf ~/Downloads/glm

# SDL (Simple DirectMedia Layer)
cd ~/Downloads && \
git clone https://github.com/SDL-mirror/SDL.git sdl &&  cd sdl && \
./configure &&  make &&  sudo make install &&  cd && rm -rf ~/Downloads/sdl

# ZeroMQ (Distributed Messaging)
cd ~/Downloads && \
git clone https://github.com/zeromq/libzmq.git libzmq  && \
cd libzmq && ./autogen.sh && ./configure && make && sudo make install && sudo ldconfig && \
cd .. && rm -rf libzmq  &&  git clone https://github.com/zeromq/cppzmq.git cppzmq && \
cd cppzmq && mkdir build && cd build && cmake .. && sudo make -j4 install &&  cd && rm -rf ~/Downloads/cppzmq

# TBB (Threading Building Blocks)
sudo apt-get install libtbb-dev

# Google chrome stable
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/googlechrome.list' && \
sudo apt-get update &&  sudo apt-get install google-chrome-stable
