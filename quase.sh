echo "[[locale]] Configure locale"
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo 'LANG=pt_BR.UTF-8' > /etc/locale.conf
ln -sf /usr/share/zoneinfo/America/Sao_Paulo  /etc/localtime
echo "#  This file is part of systemd.
#
#  systemd is free software; you can redistribute it and/or mo    dify it
#  under the terms of the GNU Lesser General Public License as     published by
#  the Free Software Foundation; either version 2.1 of the Lic    ense, or
#  (at your option) any later version.
#
# Entries in this file show the compile time defaults.
# You can change settings by editing this file.
# Defaults can be restored by simply deleting this file.
#
# See timesyncd.conf(5) for details.

[Time]
NTP=pool.ntp.br
FallbackNTP=a.ntp.br b.ntp.br c.ntp.br
#FallbackNTP=0.arch.pool.ntp.org 1.arch.pool.ntp.org 2.arch.po    ol.ntp.org 3.arch.pool.ntp.org
#RootDistanceMaxSec=5
#PollIntervalMinSec=32
#PollIntervalMaxSec=2048" > /etc/systemd/timesyncd.conf
hwclock --systohc --utc

echo "[[Hostname]] Configurar hostname"
read -p "HostName:"; read hostname
echo $hostname > /etc/hostname 

echo "[[hosts]] Configurar Hosts"
echo "127.0.0.1	localhost
::1		localhost
127.0.1.1	${hostname}.localdomain	${hostname}" > /etc/hosts

echo "[[DHCP]] Habilitar DHCP"
systemctl enable dhcpcd

echo "[[GRUB]] Instalar e configurar GRUB"
pacman -S grub efibootmgr --noconfirm
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

echo "[[USERS]] Criando usuários"
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
read -p "username: "; read username
useradd $username -m
gpasswd -a $username wheel
echo "[[Senha]] Difina a senha para $username"
passwd $username

gpasswd -a $username sys
gpasswd -a $username lp
gpasswd -a $username network
gpasswd -a $username video
gpasswd -a $username optical
gpasswd -a $username storage
gpasswd -a $username scanner
gpasswd -a $username power

echo "[[ROOT PASS]] Senha para o root"
passwd root

echo "[[XDG-USER-DIRS]]"
pacman -S xdg-user-dirs
sudo localectl set-x11-keymap br abnt2

echo "[[xorg]] interface grafica"
pacman -S xorg-{server,apps,xinit} xf86-input-{mouse,keyboard,synaptics} --noconfirm

echo "[[Driver Video]]"
pacman -S xf86-video-intel --noconfirm


echo "[[GNOME]] Instalar Gnome"
pacman -S gnome gnome-extra

echo "[[GDM]] Gerenciador de login do Gnome"
pacman -S gdm --noconfirm
systemctl enable gdm

echo "[[REDE]] configurar rede"
pacman -S networkmanager network-manager-applet wireless_tools wpa_supplicant wpa_actiond --noconfirm
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

echo "[[Som-Video-arquivos]]"
pacman -S pulseaudio pulseaudio-alsa pavucontrol alsa-firmware alsa-utils a52dec faac faad2 flac jasper lame libdca libdv libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore gstreamer gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gvfs gvfs-afc gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb --noconfirm








