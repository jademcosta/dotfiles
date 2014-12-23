My dotfiles, and provision script to setup my dev computer each time I format it ;)


Run: sudo apt-get install ansible git


After, run with: ansible-playbook dev-machine.yml -K


Don't forget to:
* add Conky to some OS initializer.
* run :PluginInstall on gvim.

TODOs:
* RVM is not setting the ruby version correctly (some problem with the terminal login?)
* Download and install subl3, and put my profile files here.
