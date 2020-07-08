# My dotfiles and provision script to setup my dev computer each time I format it ;)

Run: `bash install.sh`

After it, do the following:

* Edit /etc/fstab and on the line you have your ssd driver, add the `noatime` option, like this:
```
UUID=1eb5c20a-c497-431d-9744-876959617c44 /               ext4    noatime,errors=remount-ro 0       1
UUID=609D-BDC2  /boot/efi       vfat    umask=0077      0       1
UUID=b88946a1-94a9-4e34-9383-ad6824af9322 none            swap    sw              0       0
```


* Install [asdf](https://github.com/asdf-vm/asdf) plugins
* More icons themes?
Uniform: https://drive.google.com/uc?id=0B0Mp-ooor4g5Rk00aThWOGdzM1U&export=download  
A lot of icon themes: https://www.gnome-look.org/browse/cat/132/ord/top/