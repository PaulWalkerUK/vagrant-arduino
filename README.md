# vagrant-base_arch

This Vagrant file sets up a minimal Arch Linux with a GUI desktop. It is very 
minimal and provides a base for more useful variations.

More specifically, it sets up:
* Arch Linux
* VirtualBox Guest Additions with X support
* Xorg Server
* LightDM
* XFCE

## Note ##
A proxy is currently defined in two places - this will almost certainly need 
removing for anyone else (I'll look to improve this in the future). It needs
removing from:
* `shell/set_proxy.sh`
* `puppet/data/common.yaml`