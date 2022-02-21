#!/bin/bash

# echo "Set correct access on ssh keys..."
# chmod 644 ~/.ssh/authorized_keys
# chmod 644 ~/.ssh/known_hosts
# chmod 644 ~/.ssh/config
# chmod 600 ~/.ssh/id_rsa
# chmod 644 ~/.ssh/id_rsa.pub

echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n# append completions to fpath' >> ~/.zshrc
echo -e '\nfpath=(${ASDF_DIR}/completions $fpath)' >> ~/.zshrc
echo -e '\n# initialise completions with ZSHs compinit' >> ~/.zshrc
echo -e '\nautoload -Uz compinit && compinit' >> ~/.zshrc
source ~/.zshrc
asdf update

asdf plugin-add ruby
asdf plugin-add python
asdf plugin-add nodejs
asdf plugin-add golang
asdf plugin-add terraform
asdf plugin-add elixir
asdf plugin-add erlang
asdf plugin-add clojure

echo "Copy default lib files..."
cp ./files/default-gems ~/.default-gems
cp ./files/default-npm-packages ~/.default-npm-packages
cp ./files/default-python-packages ~/.default-python-packages
cp ./files/default-golang-pkgs ~/.default-golang-pkgs

echo "Install programming language dependencies..."
# Ruby dependencies
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev -qy
# Node dependencies
sudo apt install dirmngr gpg curl -qy
# Python dependencies
sudo apt install make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -qy
#Erlang dependencies
sudo apt install build-essential autoconf m4 libncurses5-dev libwxgtk3.0-gtk3-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop libxml2-utils libncurses-dev openjdk-11-jdk -qy
#Golang dependencies
sudo apt install coreutils curl -qy
#Clojure dependencies
sudo apt install rlwrap -qy

exit 0

echo "Install ruby..."
asdf list-all ruby > /dev/null
asdf install ruby 2.7.1
asdf global ruby 2.7.1
gem update --system

echo "Install nodejs..."
asdf list-all nodejs > /dev/null
asdf install nodejs 14.5.0
asdf global nodejs 14.5.0

echo "Install python..."
asdf list-all python > /dev/null
asdf install python 3.8.3
asdf global python 3.8.3
pip install --upgrade pip

echo "Install erlang..."
asdf list-all erlang > /dev/null
asdf install erlang 23.0.2
asdf global erlang 23.0.2

echo "Install elixir..."
asdf list-all elixir > /dev/null
asdf install elixir 1.10.4-otp-23
asdf global elixir 1.10.4-otp-23
mix local.hex
mix local.rebar

echo "Install golang..."
mkdir -p ~/dev/go
echo -e '\nexport GOPATH=/home/jade/dev/go' >> ~/.zshrc
echo -e '\nexport PATH=$PATH:$GOPATH/bin\n' >> ~/.zshrc
asdf list-all golang > /dev/null
asdf install golang 1.14.4
asdf global golang 1.14.4


echo "Add to your zshrc (I'm lazy right now and will make it automatic later)"
echo "plugins=(git lein kubectl docker docker-compose bundler golang mix)"
echo "ZSH_THEME=\"avit\""
