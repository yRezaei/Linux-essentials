No_color='\033[0m'        # No color
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan

CurrentDir="$(pwd)"    # Get current directory

# Performing complete system update
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Performing complete system update"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
sudo apt update && sudo apt upgrade && sudo apt dist-upgrade -y
sudo apt-get install build-essential ubuntu-restricted-extras -y
printf "${Green}Donn.\n${No_color}"

# Few useful applications
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Few useful applications"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
sudo apt-get install wget curl vim cmake git git-core terminator mercurial libtool pkg-config autoconf automake -y
printf "${Green}Donn.\n${No_color}"

# OpenGL related packages
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       OpenGL related packages"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
sudo apt-get install mesa-utils libxmu-dev libxi-dev libgl-dev libosmesa-dev -y
printf "${Green}Donn.\n${No_color}"

# Customizing the username & path appearance in bash
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Customizing the profile appearance in bash"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
echo 'export PS1="\[\e[38;5;184m\]\u\[\e[38;5;44m\]@\[\e[38;5;184m\]\h \[\e[38;5;44m\]\w \[\e[38;5;255m\]>\[\e[00m\] "' >> ~/.bashrc
source ~/.bashrc
printf "${Green}Donn.\n${No_color}"

# Latest GCC compiler
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Latest GCC compiler"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
sudo apt-get install software-properties-common -y && \
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y && \
sudo apt-get update && sudo apt-get upgrade -y && \
sudo apt-get install gcc-7 g++-7 -y && \
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 60 --slave /usr/bin/g++ g++ /usr/bin/g++-7
printf "${Green}Donn.\n${No_color}"

# Python 3.x (Anaconda continum)
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Python 3.x (Anaconda continum)"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
cd ~/Downloads && \
latest=$(curl -L http://repo.continuum.io/archive/index.html | grep Linux-x86_64.sh | perl -nl -e 'm@<a.*? href="(.+)">(.+)</a@ig; print "$2\0$1"' | sort -nr | head -n 1 | cut -d '' -f2 | sed 's@./@@') && \
wget http://repo.continuum.io/archive/$latest && bash $latest && cd && rm -rf ~Downloads/$latest
printf "${Green}Donn.\n${No_color}"

# Visual studio code
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Visual studio code"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
sudo apt-get update && \
sudo apt-get install code
printf "${Green}Donn.\n${No_color}"

# Glew (The OpenGL Extension Wrangler Library)
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Glew (The OpenGL Extension Wrangler Library)"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
cd ~/Downloads && git clone https://github.com/nigels-com/glew.git glew && \
cd glew && make extensions &&  make &&  sudo make install && \
sudo ln -s /usr/lib64/libGLEW.so.2.1 /usr/local/lib/libGLEW.so.2.1 && \
cd && rm -rf ~/Downloads/glew
printf "${Green}Donn.\n${No_color}"

# GLM (OpenGL Mathematics)
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       GLM (OpenGL Mathematics)"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
cd ~/Downloads && \
git clone https://github.com/g-truc/glm.git glm &&  cd glm &&  cmake . && \
make &&  sudo make install &&  cd && rm -rf ~/Downloads/glm
printf "${Green}Donn.\n${No_color}"

# SDL (Simple DirectMedia Layer)
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       SDL (Simple DirectMedia Layer)"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
cd ~/Downloads && \
git clone https://github.com/SDL-mirror/SDL.git sdl &&  cd sdl && \
./configure &&  make &&  sudo make install &&  cd && rm -rf ~/Downloads/sdl
printf "${Green}Donn.\n${No_color}"

# ZeroMQ (Distributed Messaging)
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       ZeroMQ (Distributed Messaging)"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
git clone https://github.com/zeromq/libzmq.git libzmq  && \
cd libzmq && ./autogen.sh && ./configure && make && sudo make install && sudo ldconfig && \
cd .. && rm -rf libzmq \
&&  git clone https://github.com/zeromq/cppzmq.git cppzmq && \
cd cppzmq && mkdir build && cd build && cmake .. && sudo make -j4 install && cd .. && rm -rf cppzmq
printf "${Green}Donn.\n${No_color}"

# TBB (Threading Building Blocks)
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       TBB (Threading Building Blocks)"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
sudo apt-get install libtbb-dev
printf "${Green}Donn.\n${No_color}"

# Google chrome stable
printf "${Yellow}\n#########################################################################\n"
printf "${Green}                       Google chrome stable"
printf "${Yellow}\n#########################################################################"
printf "${No_color}\n" && sleep 1
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/googlechrome.list' && \
sudo apt-get update &&  sudo apt-get install google-chrome-stable
printf "${Green}Donn.\n${No_color}"
