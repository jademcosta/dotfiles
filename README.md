# My dotfiles and provision script to setup my dev computer each time I format it ;)


Run: `sudo apt-get install ansible git`

Configure ansible hosts by copying the file "hosts" to /etc/ansible/hosts

After cloning this repo, run with: `ansible-playbook dev-machine.yml -K`


#### Don't forget to:
* add Conky to some OS initializer.
* run :PluginInstall on gvim.
* Install [asdf](https://github.com/asdf-vm/asdf):
```shell
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
```

### Sublime
* Install it :)
* Install the packages (from [Package control](https://packagecontrol.io/), ctrl+shift+p will show the package controller, type "install" and hit enter):
  * PackageSync
Then, load the zip file inside sublime text folder in files folder.

### Remember to always put ssh key mode on a new server:
* If the directory doesn't exists, create: ~/.ssh with permission 700,
and after, create a file named authorized_keys with permission 600
* Add your pub key on ~/.ssh/authorized_keys on the server
* edit /etc/ssh/sshd_config and add the line: `PasswordAuthentication no` to disable ssh using password
* Maybe, enable the "login group" to be the users that belong to a
specific group: `addgroup sshlogin && adduser root sshlogin`. After, write
`AllowGroups sshlogin` on the /etc/ssh/sshd_config file

### TODOs:
* RVM is not setting the ruby version correctly (some problem with the terminal login?) with `rvm --default use 2.x.x`
