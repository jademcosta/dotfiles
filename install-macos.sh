#!/bin/bash

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing devtools"
brew install bat lsd zoxide git-delta choose-rust ag vim

echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Copying config files..."
cp ./files/gitconfig ~/.gitconfig
cp ./files/git_commit_message_template ~/.git_commit_message_template
cp ./files/gemrc ~/.gemrc
cp ./files/pryrc ~/.pryrc

echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.1
echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
echo "fpath=(${ASDF_DIR}/completions $fpath)" >> ~/.zshrc
echo "autoload -Uz compinit && compinit" >> ~/.zshrc
source ~/.zshrc
asdf update


echo "Installing asdf plugins..."
# update list of plugins
asdf plugin list all > /dev/null
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add ruby
asdf plugin-add python
asdf plugin-add golang
asdf plugin-add erlang
asdf plugin-add elixir
asdf plugin-add terraform

echo "Installing programming language dependencies..."
brew install coreutils gpg gawk autoconf libxslt fop wxwidgets openssl@1.1 readline sqlite3 xz zlib

# echo "Installing languages..."
# KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl@1.1)" asdf install erlang 24.0.5
# RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)" asdf install ruby 3.0.3
# asdf install python 3.6.2

echo "Download Xcode and then run xcode-select --install"
