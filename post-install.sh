#!/bin/bash

echo "Set correct access on ssh keys..."
chmod 644 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/known_hosts
chmod 644 ~/.ssh/config
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub


# ruby-dev autoconf bison libssl-dev \
#  libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libffi-dev \
#  libgdbm-dev liblzma-dev libsqlite3-dev cmake make htop iotop libpq-dev \
#  libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 openssl \
#  readline-common bzip2 libbz2-dev libreadline-dev llvm libncurses5-dev \
#  libncursesw5-dev xz-utils tk-dev silversearcher-ag apt-transport-https \
#  ca-certificates software-properties-common m4 libwxgtk3.0-dev \
#  libgl1-mesa-dev libglu1-mesa-dev libssh-dev unixodbc-dev libpng-dev \
#  zlib1g:i386 postgresql-client-common postgresql-client -qy


echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc
source ~/.zshrc
asdf update

echo "Installing ruby libs"
gem update --system
gem install rubocop

echo "Add golang conf to zshrc"
echo -e '\nexport GOPATH=/home/jade/dev/go' >> ~/.zshrc
echo -e '\nexport PATH=$PATH:$GOPATH/bin\n' >> ~/.zshrc

echo "Installing local hex and rebar (Elixir)"
mix local.hex
mix local.rebar

echo "Installing pip packages"
pip install pylama pyflakes flake8 jedi


