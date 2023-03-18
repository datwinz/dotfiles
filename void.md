# Void Linux op Macbook Pro Late 2013 15"

## Packages

* rsyslog
* intel-ucode
* cronie
* chrony
* broadcom-wl-dkms
* ufw
* ufw-extras
* apparmor
* dbus
* elogind
* NetworkManager
* mesa-dri
* pulseaudio
* bluez
* cups
* hplip
* avahi
* nss-mdns
* gdm
* wayfire
* wf-shell
* mako
* wlsunset
* swayidle
* kitty
* wofi
* wlogout
* light
* firefox
* tomahawk
* qView
* git
* zsh

## Modules

### /etc/modules-load.d/

bcm5974.conf met inhoud:

```
# load bcm5974 (mouse)
bcm5974
```

### /etc/modprobe.d/usbmouse.conf

usbmouse.conf met inhoud:

```
blacklist usbmouse
```

### /etc/dracut.conf.d/usbmouse.conf

usbmouse.conf met inhoud:

```
omit_drivers+=" usbmouse "
```

## Services

```
NetworkManager  agetty-tty2  agetty-tty5   bluetoothd  cupsd  rsyslogd
acpid           agetty-tty3  agetty-tty6   chronyd     dbus   udevd
agetty-tty1     agetty-tty4  avahi-daemon  cronie      gdm    ufw
```

## Extra settings

### Change kernel / GRUB commandline

Kernel command line arguments can be added through the GRUB bootloader by editing ```/etc/default/grub```, changing the ```GRUB_CMDLINE_LINUX_DEFAULT``` variable and then running ```update-grub```.

### Regenerate initramfs

```xbps-reconfigure --force linux<x>.<y>``` met het juiste versienummer.

### Apparmor

To use AppArmor on a system, one must:

1. Install the ```apparmor``` package.
2. Set ```apparmor=1 security=apparmor``` on the kernel commandline.

### vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
