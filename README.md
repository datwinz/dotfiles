# Void Linux on Macbook Pro Late 2013 15"

## Packages

Output from ```xbps-query -m```.
* 7zip
* NetworkManager
* accountsservice
* alsa-pipewire
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
* docker
* docker-buildx
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
* glow
* grub-i386-efi
* grub-x86_64-efi
* hplip
* intel-ucode
* intel-video-accel
* kbdlight
* kitty
* laptop-mode
* lf
* libreoffice
* libspa-bluetooth
* libvirt
* light
* logrotate
* lvm2
* mako
* mdadm
* mesa-vulkan-intel
* mpd
* ncdu
* ncmpcpp
* neovim
* network-manager-applet
* nss-mdns
* pipewire
* powertop
* preload
* qemu
* ripgrep
* rsyslog
* sway
* swayidle
* swaylock
* switchboard
* switchboard-plug-bluetooth
* switchboard-plug-network
* switchboard-plug-printers
* texlive-bin
* tofi
* tree
* udiskie
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
* wlogout
* wlsunset
* wofi
* xdg-desktop-portal
* xorg
* zathura
* zathura-pdf-poppler
* zip
* zramen
* zsh

### Other

[AppImage of stackstorage from Pakketmap](https://filehosting-client.transip.nl/packages/stack) and [pistol from releases](https://github.com/doronbehar/pistol/releases) in ~/.local/bin.

Set up gitleaks in gitlab with the [gitlab-endpoint-installer](https://gitlab.com/gitlab-com/gl-security/security-research/gitleaks-endpoint-installer). Basically just execute ```bash <(curl https://gitlab.com/gitlab-com/gl-security/security-research/gitleaks-endpoint-installer/-/raw/main/install.sh)``` and it will install, it expects no other git hooks are implemented yet.

## Firewall

```
sudo ufw allow HPLIP
sudo ufw allow CUPS
```

## Services

```
acpid        agetty-tty5   chronyd  emptty          preload    virtlogd
agetty-tty1  agetty-tty6   cronie   laptop-mode     rsyslogd   zramen
agetty-tty2  auditd        cupsd    libvirtd        udevd
agetty-tty3  avahi-daemon  dbus     NetworkManager  ufw
agetty-tty4  bluetoothd    docker   powertop        virtlockd
```
## Tex

### tlmgr packages

* collection-langeuropean
* collection-latexextra
* collection-fontsrecommended
* fontawesome5
* physics

## Extra settings

### Partitions and volumes

My root is an XFS partition and my home is BTRFS. I mounted the libvirt folder as a BTRFS subvolume like this.

```bash
mkdir /home/void/.lib/libvirt
sudo mount -t btrfs -o subvolid=257,defaults /dev/disk/by-uuid/6506ff97-3841-4ed3-9062-3827b06467b2 /var/lib/libvirt
```

I automount the subvolume in my fstab. In the end ```lsblk``` looks like this:

```
NAME          MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
sda             8:0    0 465.9G  0 disk
├─sda1          8:1    0   200M  0 part
├─sda2          8:2    0 372.5G  0 part
├─sda3          8:3    0   200M  0 part  /boot/efi
├─sda4          8:4    0    20G  0 part  /var/lib/docker
│                                        /
└─sda5          8:5    0    73G  0 part
  └─void-home 254:0    0    73G  0 crypt /var/lib/libvirt
                                         /home
sdb             8:16   1     0B  0 disk
zram0         253:0    0   3.9G  0 disk  [SWAP]
```

### Groups

The groups my admin user is apart of are below:

```
UID=1000(void) GID=1000(void) groups=1000(void),4(wheel),8(floppy),12(audio),13(video),16(cdrom),17(optical),24(kvm),101(xbuilder),990(libvirt),993(docker),994(lpadmin)
```

### Change to console

fn + ctrl + alt + F[1-6] to change to the consoles/ttys. Your desktop probably runs on fn + ctrl + alt + F7.

### Change kernel / GRUB commandline

Kernel command line arguments can be added through the GRUB bootloader by editing ```/etc/default/grub```, changing the ```GRUB_CMDLINE_LINUX_DEFAULT``` variable and then running ```update-grub```.

### Regenerate initramfs

```xbps-reconfigure -fa```, this force configures all packages including making the initramfs. You also need to do this when making/modifying crypttab.

### zram

The easiest way is with zramen. To test zram do ```sudo zramen make```, to disable ```sudo zramen toss```. The default settings are probably fine. For permanent zram enable the zramen service.

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

### Package and other management

```sudo xbps-install -Su``` to update all packages, ```sudo xbps-remove -Oo``` to clean cache and remove unnecessary packages.

```sudo vkpurge rm all``` to remove old kernels, doesn't remove the packages so use the command above to do that.

### Config management

Use the [bare Git repo method](https://www.atlassian.com/git/tutorials/dotfiles). It uses ```config``` instead of ```git``` as commands by adding this line to zshrc:

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Other than that it uses the standard ```git``` commands such as ```add```, ```commit``` and ```push```.

## Bugs 

After hibernating or suspending the laptop doesn't automatically connect to the wifi device again. So you have to restart NetworkManager with ```sudo sv restart NetworkManager```.

Do ```aa-complain /usr/libexec/virt-aa-helper```, because for some reason that one doesn't have permission(?) to add profiles for VMs to the apparmor.d/libvirt folder.

After resetting NVRAM the Mac OS and/or Opencore bootloader doesn't recognize Void linux. To fix this, burn [boot-repair-disk](https://sourceforge.net/p/boot-repair-cd/home/Home/) to a flash drive and run it.

Intel video isn't recognized automatically. There is a grub patch which fixes it, but you have to recompile grub with the patch for that to work. There are also other solutions, more info on [this stackexchange thread](https://unix.stackexchange.com/questions/193425/enabling-intel-iris-pro-syslinux-tails-system-macbook-pro-15-retina-late-2013). OpenCore Legacy Patcher can also patch this, so if you're dual booting you use that.
