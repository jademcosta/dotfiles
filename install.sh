#!/bin/bash

sudo apt-get update -q
sudo apt-get upgrade -qy

echo "Remove thunderbird..."
sudo apt-get purge thunderbird* -qy

echo "Installing desktop packages..."
sudo apt-get install gimp vlc inkscape libreoffice firefox simple-scan \
shutter -qy

echo "Installing utility packages..."
sudo apt-get install unzip unrar gdebi xclip cryptsetup conky pngquant \
usb-creator-gtk -qy

echo "Installing dev packages..."
sudo apt-get install openjdk-8-jdk wget build-essential curl git subversion vim-gtk \
 terminator meld gitg gitk patch ruby-dev autoconf bison libssl-dev \
 libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libffi-dev \
 libgdbm-dev liblzma-dev libsqlite3-dev cmake make htop iotop libpq-dev \
 libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 openssl \
 readline-common bzip2 libbz2-dev libreadline-dev llvm libncurses5-dev \
 libncursesw5-dev xz-utils tk-dev silversearcher-ag apt-transport-https \
 ca-certificates software-properties-common m4 libwxgtk3.0-dev \
 libgl1-mesa-dev libglu1-mesa-dev libssh-dev unixodbc-dev libpng-dev -qy

echo "Copying config files..."
cp ./files/gitconfig ~/.gitconfig
cp ./files/git_commit_message_template ~/.git_commit_message_template
cp ./files/conkyrc ~/.conkyrc
cp ./files/gemrc ~/.gemrc
cp ./files/vimrc ~/.vimrc
cp ./files/pryrc ~/.pryrc
cp ./files/bash_prompt ~/.bash_prompt
mkdir -p ~/.fonts
cp -r ./files/fonts ~/.fonts
mkdir -p ~/scripts
cp -r files/scripts ~/scripts

echo "Copying sysctl files"
sudo cp ./files/60* /etc/sysctl.d/

echo "Reloading system fonts..."
fc-cache -fv

echo "Installing vim vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Add config lines to bashrc..."
echo -e '\nsource $HOME/.bash_prompt\n' >> ~/.bashrc

echo "Install docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -qy
sudo apt-get install docker-ce -qy

echo "Consider adding your user to the docker group, so you do not need sudo:"
echo "sudo usermod -aG docker your-user"

echo "Install docker-composer..."
sudo curl -L \
https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` \
-o /usr/local/bin/docker-compose

echo "Install asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.0
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
source ~/.bashrc
asdf update

echo "Install icon sets..."
mkdir ~/.icons
git clone https://github.com/rudrab/Shadow.git ~/.icons/shadow
git clone https://github.com/madmaxms/iconpack-obsidian.git ~/.icons/obs-git
mv ~/.icons/obs-git/* ~/.icons/
rm -rf ~/.icons/.git
rm -rf ~/.icons/obs-git
sudo add-apt-repository ppa:papirus/papirus -qy
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update -q
sudo apt-get install papirus-icon-theme moka-icon-theme faba-icon-theme \
 pocillo-icon-theme numix-icon-theme-circle -qy
