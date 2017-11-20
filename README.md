# My dotfiles and provision script to setup my dev computer each time I format it ;)

Run: `sudo bash install.sh`

After it, do the following:

* Edit /etc/fstab and on the line you have your ssd driver, add the `noatime` option, like this:
```
UUID=1eb5c20a-c497-431d-9744-876959617c44 /               ext4    noatime,errors=remount-ro 0       1
UUID=609D-BDC2  /boot/efi       vfat    umask=0077      0       1
UUID=b88946a1-94a9-4e34-9383-ad6824af9322 none            swap    sw              0       0
```

* Restore the ssh key that you saved (you saved it, right?).
* add Conky to some OS initializer.
* run :PluginInstall on gvim.
* Install [asdf](https://github.com/asdf-vm/asdf) plugins

* Install Google Chrome
* Install Postman
* Install Android Studio

* Install atom.io . Don't forget to add your sync-settings id to sync your packages (you need to install it on atom).

* If you want to use sublime text 3
  * Install the packages (from [Package control](https://packagecontrol.io/), ctrl+shift+p will show the package controller, type "install" and hit enter):
  * PackageSync. Then, load the zip file inside sublime text folder in files folder.

Run: `sudo bash post-language-install.sh`


### Remember to always put ssh key mode on a new server:
* If the directory doesn't exists, create: ~/.ssh with permission 700,
and after, create a file named authorized_keys with permission 600
* Add your pub key on ~/.ssh/authorized_keys on the server
* edit /etc/ssh/sshd_config and add the line: `PasswordAuthentication no` to disable ssh using password
* Maybe, enable the "login group" to be the users that belong to a
specific group: `addgroup sshlogin && adduser root sshlogin`. After, write
`AllowGroups sshlogin` on the /etc/ssh/sshd_config file
