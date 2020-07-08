#!/bin/bash

sudo apt-get update -q
sudo apt-get upgrade -qy

echo "Remove thunderbird..."
sudo apt-get purge thunderbird* -qy

echo "Installing desktop packages..."
sudo apt-get install gimp vlc inkscape libreoffice firefox simple-scan ubuntu-restricted-extras gnome-tweaks safeeyes -qy

echo "Installing utility packages..."
sudo apt-get install unzip unrar gdebi xclip cryptsetup conky pngquant usb-creator-gtk -qy

echo "Installing dev packages..."
sudo apt-get install wget build-essential curl git vim-gtk terminator meld gitg gitk patch \
zsh

echo "Setting ZSH as main shell..."
chsh -s $(which zsh)

echo "Copying config files..."
cp ./files/gitconfig ~/.gitconfig
cp ./files/git_commit_message_template ~/.git_commit_message_template
# cp ./files/conkyrc ~/.conkyrc
cp ./files/gemrc ~/.gemrc
cp ./files/vimrc ~/.vimrc
cp ./files/pryrc ~/.pryrc
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

echo "Installing docker dependencies..."
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -qy

echo "Add Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "Add Docker's apt repository..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -q

echo "Install Docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl enable docker

echo "Install docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Consider adding your user to the docker group, so you do not need sudo:"
echo "sudo usermod -aG docker your-user"

echo "Install icon sets..."
mkdir ~/.icons
sudo apt install papirus-icon-theme numix-icon-theme numix-icon-theme-circle -qy
# Alternative:
# sudo add-apt-repository ppa:papirus/papirus -qy
# sudo add-apt-repository ppa:numix/ppa

echo "Tweaks..."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Create ssh dir..."
mkdir ~/.ssh
chmod 700 ~/.ssh

echo "Add Conky to some OS initializer"
echo "Run :PluginInstall on gvim"
echo "Manually move your ssh keys to ~/.ssh"
echo "close your terminal and open it again, then run post-install.sh"