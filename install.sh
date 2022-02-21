#!/bin/bash

sudo apt update -q
sudo apt upgrade -qy

echo "Remove thunderbird..."
sudo apt purge thunderbird* -qy

echo "Installing desktop packages..."
sudo apt install gimp vlc inkscape libreoffice firefox simple-scan ubuntu-restricted-extras gnome-tweaks safeeyes -qy

echo "Installing utility packages..."
sudo apt install unzip unrar gdebi xclip cryptsetup conky pngquant usb-creator-gtk psensor -qy

echo "Installing dev packages..."
sudo apt install wget build-essential curl git vim-gtk terminator meld gitg gitk patch ripgrep \
zsh git-extras bat -qy

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

# echo "Copying sysctl files"
# sudo cp ./files/60* /etc/sysctl.d/

echo "Reloading system fonts..."
fc-cache -fv

# echo "Installing vim vundle..."
# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing docker dependencies..."
sudo apt remove docker docker-engine docker.io containerd runc -y
sudo apt install ca-certificates curl gnupg lsb-release

echo "Add Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Add Docker's apt repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -q

echo "Install Docker..."
sudo apt install docker-ce docker-ce-cli containerd.io -qy
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

echo "Install docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Add your user to the docker group, so you do not need sudo..."
sudo usermod -aG docker $USER

echo "Install icon sets..."
mkdir ~/.icons
sudo apt install papirus-icon-theme numix-icon-theme numix-icon-theme-circle -qy
# Alternative:
# sudo add-apt-repository ppa:papirus/papirus -qy
# sudo add-apt-repository ppa:numix/ppa

echo "Tweaks..."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'


echo "Create ssh dir..."
mkdir ~/.ssh
chmod 700 ~/.ssh

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Add Conky to some OS initializer"
echo "Run :PluginInstall on gvim"
echo "Manually move your ssh keys to ~/.ssh"
echo "close your terminal and open it again, then run post-install.sh"
echo "Download lsd from https://github.com/Peltoche/lsd/releases and then run sudo dpkg -i lsd_0.20.1_amd64.deb"
echo "Same thing for https://github.com/dandavison/delta/releases"
