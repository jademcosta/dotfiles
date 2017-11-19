#!/bin/bash

echo "Installing ruby libs"
gem update --system
gem install rubocop

echo "Add golang conf to bashrc"
echo -e '\nexport GOPATH=/home/jade/dev/go' >> ~/.bashrc
echo -e '\nexport GOROOT=/home/jade/.asdf/installs/golang/1.8.4/go' >> ~/.bashrc
echo -e '\nexport PATH=$PATH:$GOPATH/bin\n' >> ~/.bashrc

echo "Installing local hex and rebar (Elixir)"
mix local.hex
mix local.rebar

echo "Installing pip packages"
pip install pylama pyflakes flake8 jedi
