#!/bin/bash
# Configurar layout do teclado para o teclado BR
echo "[[Layout Teclado]] Configurar layout do teclado para br-abnt2"
loadkeys bt-abnt2
echo "[[Relogio do sistema]] Configurar relogio do sistema"
timedatectl set-ntp true

if ! ping -c1 8.8.8.8 ; then
	echo "\n\n[[Wifi]] Configurar conecção com a internet Wi-Fi"
	wifi-menu
fi

echo "[[Pre-formatação]]"
read -p "informe o caminho raiz do sistema: " raiz
read -p "informe o caminho para a partição de boot: " boot
read -p "informe o caminho para a partição swap: " swap
read -p "informe o caminho para a pratição home: " home

echo "[[Formatando]] Formatar disco rigido"
mkfs.ext4 ${raiz}
mkfs.fat -F32 -n BOOT ${boot}
mkswap -L  swap ${swap} && swapon ${swap}

echo "[[Mounting]] Montando partições"
mount /dev/sda2 /mnt
mkdir -p /mnt/home && mount /dev/sda3 /mnt/home
mkdir -p /mnt/boot && mount /dev/sda1 /mnt/boot

echo "[[Mirrors]] Selecione o mirror para a instalação"
nano /etc/pacman.d/mirrorlist

echo "[[Sistema-Base]] Instalando a base do sistema"
pacstrap /mnt base base-devel

echo "[[Fstab]] Gerar o fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "[[Adentre o novo sistema]] shell na raiz no novo sistema"
cp -r ../archLinuxInstallation /mnt
arch-chroot /mnt

