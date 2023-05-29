# Void Linux on Macbook Pro Late 2013 15"

## Packages

Output from ```xbps-query -m```.
* 7zip
* NetworkManager
* accountsservice
* alsa-plugins-pulseaudio
* apparmor
* audit
* avahi
* base-system
* bluez
* broadcom-wl-dkms
* chrony
* cronie
* cryptsetup
* cups
* curl
* dbus
* docker
* docker-compose
* elogind
* emacs
* emptty
* firefox
* font-fira-otf
* font-fira-ttf
* font-libertine-otf
* font-libertine-ttf
* fonts-roboto-ttf
* freefont-ttf
* git
* grub-i386-efi
* grub-x86_64-efi
* hplip
* intel-ucode
* kbdlight
* kitty
* lf
* libreoffice
* libvirt
* light
* logrotate
* lvm2
* mako
* mdadm
* mpd
* ncdu
* ncmpcpp
* network-manager-applet
* nss-mdns
* pulseaudio
* qemu
* rsyslog
* swayidle
* swaylock
* switchboard
* switchboard-plug-bluetooth
* switchboard-plug-network
* switchboard-plug-printers
* texlive2023-bin
* ufw
* ufw-extras
* unzip
* upower
* vim
* virt-manager
* void-docs-browse
* void-repo-nonfree
* wayfire
* wf-shell
* wget
* wlogout
* wlsunset
* wofi
* xdg-desktop-portal
* xorg
* xz
* zathura
* zathura-pdf-poppler
* zip
* zsh

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
sudo ufw allow HPLIP
sudo ufw allow CUPS
```

## Services

```
acpid        agetty-tty4  avahi-daemon  cupsd   libvirtd        udevd
agetty-tty1  agetty-tty5  bluetoothd    dbus    mpd             ufw
agetty-tty2  agetty-tty6  chronyd       docker  NetworkManager  virtlockd
agetty-tty3  auditd       cronie        emptty  rsyslogd        virtlogd
```
## Tex

### tlmgr packages

* collection-langeuropean
* collection-latexextra
* collection-fontsrecommended
* fontawesome5
* physics

## Extra settings

### Change to console

fn + ctrl + alt + F[1-6] to change to the consoles/ttys. Your desktop probably runs on fn + ctrl + alt + F7.

### Change kernel / GRUB commandline

Kernel command line arguments can be added through the GRUB bootloader by editing ```/etc/default/grub```, changing the ```GRUB_CMDLINE_LINUX_DEFAULT``` variable and then running ```update-grub```.

### Regenerate initramfs

```xbps-reconfigure --force linux<x>.<y>``` with the right version number.

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

Do ```aa-complain /usr/libexec/virt-aa-helper```, because for some reason that one doesn't have permission(?) to add profiles for VMs to the apparmor.d/libvirt folder.

