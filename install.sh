#!/bin/bash


#apt-get update -q
#apt-get upgrade -qy

echo "Installing media packages"
apt-get install gimp vlc inkscape -qy

echo "Installing utility packages"
apt-get install unzip unrar gdebi libreoffice xclip cryptsetup conky -qy

echo "Installing dev packages"
apt-get install openjdk-9-jdk wget build-essential curl git subversion vim-gtk \
 terminator meld gitg gitk patch ruby-dev autoconf bison libssl-dev \
 libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libffi-dev \
 libgdbm-dev liblzma-dev libsqlite3-dev cmake make htop iotop libpq-dev \
 libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386 openssl \
 readline-common bzip2 libbz2-dev libreadline-dev llvm libncurses5-dev \
 libncursesw5-dev xz-utils tk-dev -qy

 
