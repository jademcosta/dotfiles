#!/bin/bash


#apt-get update -q
#apt-get upgrade -qy

echo "Remove thunderbird..."
apt-get purge thunderbird* -qy

echo "Installing desktop packages..."
apt-get install gimp vlc inkscape libreoffice firefox -qy

echo "Installing utility packages..."
apt-get install unzip unrar gdebi xclip cryptsetup conky -qy

echo "Installing dev packages..."
apt-get install openjdk-9-jdk wget build-essential curl git subversion vim-gtk \
 terminator meld gitg gitk patch ruby-dev autoconf bison libssl-dev \
 libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libffi-dev \
 libgdbm-dev liblzma-dev libsqlite3-dev cmake make htop iotop libpq-dev \
 libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 openssl \
 readline-common bzip2 libbz2-dev libreadline-dev llvm libncurses5-dev \
 libncursesw5-dev xz-utils tk-dev silversearcher-ag apt-transport-https \
 ca-certificates software-properties-common -qy

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
cp ./files/60* /etc/sysctl.d/

echo "Reloading system fonts..."
fc-cache -fv

echo "Installing vim vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Add some lines to bashrc..."
echo -e '\nexport GOPATH=/home/jade/dev/go' >> ~/.bashrc
echo -e '\nexport GOROOT=/home/jade/.asdf/installs/golang/1.8.1/go' >> ~/.bashrc
echo -e '\nexport PATH=$PATH:$GOPATH/bin\n' >> ~/.bashrc
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

echo "Install docker-composer"
sudo curl -L \
https://github.com/docker/compose/releases/download/1.17.0/docker-compose-`uname -s`-`uname -m` \
-o /usr/local/bin/docker-compose
