This folder contains scripts for configurations in various distributions.

IF lxde:
mv ~/scripts/.asoundrc ~/.asoundrc
mv ~/scripts/.brightness.desktop ~/.config/autostart/brightness.desktop
mv ~/scripts/.conky.desktop ~/.config/autostart/conky.desktop
mv ~/scripts/50-cros-touchpad.conf /etc/X11/xorg.conf.d/50-cros-touchpad.conf

IF using chromebook c720, after every kernel upgrade, run:
bash touchpad-module-instaler


