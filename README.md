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
* accountsservice
* emptty
* wayfire
* wf-shell
* upower
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
* libreoffice
* git
* zsh
* ncdu
* emacs
* zip
* xz
* docker
* docker-compose
* libvirtd
* qemu
* virt-manager

## Modules

### /etc/modules-load.d/

bcm5974.conf with contents:

```
# load bcm5974 (mouse)
bcm5974
```

### /etc/modprobe.d/usbmouse.conf

usbmouse.conf with contents:

```
blacklist usbmouse
```

### /etc/dracut.conf.d/usbmouse.conf

usbmouse.conf with contents:

```
omit_drivers+=" usbmouse "
```

## Firewall

```
sudo ufw default allow outgoing
sudo ufw default deny incoming
```

## Services

```
acpid        agetty-tty4   bluetoothd  dbus      NetworkManager  virtlockd
agetty-tty1  agetty-tty5   chronyd     docker    rsyslogd        virtlogd
agetty-tty2  agetty-tty6   cronie      emptty    udevd
agetty-tty3  avahi-daemon  cupsd       libvirtd  ufw
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

Change the value in ```/etc/default/apparmor``` from ```complain``` to ```enforce```. Reboot the laptop to finish the installation.

### vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### oh-my-zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### spacemacs

```
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
```

### ssh-agent

Add to zshrc
```
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
```

## Bugs 

After hibernating or suspending the laptop doesn't automatically connect to the wifi device again. So you have to restart NetworkManager with ```sudo sv restart NetworkManager```.
