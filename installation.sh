# Updating the system
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

# Installing the necessary packages for development 
sudo apt-get install build-essential ubuntu-restricted-extras -y

# Few useful applications
sudo apt-get install vim cmake terminator -y

# Modifying the username & path appearance in bash
echo 'export PS1="\[\033[38;5;190m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;45m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;190m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"' >> ~/.bashrc
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

# NVIDIA driver repository
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
