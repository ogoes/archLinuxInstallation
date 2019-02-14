#!/bin/bash

echo "[[POST INSTALLATION]]"

echo "[[YAOURT Installation]]"
sudo pacman -S git curl --needed
cd ~
git clone https://aur.archlinux.org/package-query.git
cd package-query/
makepkg -si && cd ../ && rm -rf package-query/
git clone https://aur.archlinux.org/yaourt.git
cd yaourt/
makepkg -si && cd ../ && rm -rf yaourt/

echo "[[Web Browsers]]"
sudo pacman -S firefox lynx --noconfirm
yaourt -S google-chrome --noconfirm

echo "[[File Sharing]]"
sudo pacman -S curl filezilla transmission-gtk --noconfirm
yaourt -S dropbox --noconfirm

echo "[[Comunication]]"
yaourt -S mailspring --noconfirm

echo "[[imagem]]"
sudo pacman -S feh gnome-photos --noconfirm

echo "[[Música]]"
sudo pacman -S lollypop --noconfirm
yaourt -S spotify tagtool --noconfirm

echo "[[Video]]"
sudo pacman -S vlc --noconfirm

echo "[[Terminal]]"
sudo pacman -S tilix --noconfirm

echo "[[Gerenciador de arquivos]]"
sudo pacman -S ranger nautilus --noconfirm

echo "[[Disk]]"
yaourt -S etcher --noconfirm

echo "[[Editores de texto]]"
sudo pacman -S vim atom gedit code --noconfirm
yaourt -S sublime-text-dev --noconfirm

echo "[[Office]]"
sudo pacman -S libreoffice-fresh --noconfirm

echo "[[NodeJS]]"
sudo pamcman -S nodejs npm yarn --noconfirm
yaourt -S nvm --noconfirm


echo "[[Shell]]"
sudo pacman -S zsh --noconfirm
chsh -s $(which zsh)

echo "[[oh-my-zsh]]"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "[[spaceship-prompt]]"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


echo "[[Cursor]]"
yaourt -S bibata-cursor-theme --noconfirm

echo "[[GNOME Extensions]]"
sudo pacman -S gnome-shell-extensions --noconfirm


echo "[[GNOME configuration]]"
gsettings set org.gnome.desktop.interface clock-format 12h
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds false
gsettings set org.gnome.desktop.interface cursor-theme "Bibata_Oil"
gsettings set org.gnome.desktop.interface gtk-im-module "gtk-im-context-simple"
gsettings set org.gnome.desktop.interface gtk-theme "Plastik-Dark"
gsettings set org.gnome.desktop.interface scaling-factor 1
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.interface text-scaling-factor 0.6
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
gsettings set org.gnome.desktop.peripherals.mouse speed -0.492647
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad speed -0.15441176
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar "minimize"
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:appmenu"
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar "minimize"
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar "minimize"
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar "minimize"
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar "minimize"

ggettings set org.gnome.system.locale region "pt_BT.UTF-8"

gsettings set org.gnome.shell enabled-extensions "['user-theme@gnome-shell-extensions.gcampax.github.com', 'dash-to-dock@micxgx.gmail.com', 'drive-menu@gnome-shell-extensions.gcampax.github.com', 'alternate-tab@gnome-shell-extensions.gcampax.github.com', 'CoverflowAltTab@palatis.blogspot.com', 'dynamicTopBar@gnomeshell.feildel.fr', 'TopIcons@phocean.net', 'extendedgestures@mpiannucci.github.com', 'gTile@vibou', 'gsconnect@andyholmes.github.io', 'hidetopbar@mathieu.bidon.ca', 'gnomeGlobalAppMenu@lestcape']"

gsettings set org.gnome.shell.extensions.dash-to-dock customize-alphas true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-shrink true
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icpn-size 32
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock force-straight-corner false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide-mode "ALL_WINDOWS"
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-monitors true
gsettings set org.gnome.shell.extensions.dash-to-dock max-alpha 0.16
gsettings set org.gnome.shell.extensions.dash-to-dock min-alpha 0
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock require-pressure-to-show false
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-dominant-color true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-tyle "DEFAULT"
gsettings set org.gnome.shell.extensions.dash-to-dock show-delay 0.05
gsettings set org.gnome.shell.extensions.dash-to-dock show-show-apps-button false
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode "DYNAMIC"

gsettings set org.gnome.shell.extensions.hidetopbar enable-active-window false
gsettings set org.gnome.shell.extensions.hidetopbar mouse-sensitive true
gsettings set org.gnome.shell.extensions.hidetopbar pressure-threshold 0
gsettings set org.gnome.shell.extensions.hidetopbar pressure-timeout 10000
gsettings set org.gnome.shell.extensions.hedetopbar shortcut-delay 10

gsettings set org.gnome.shell.extensions.topicons icon-opacity 136
gsettings set org.gnome.shell.extensions.topicons icon-size 21
gsettings set org.gnome.shell.extensions.topicons icon-spacing 1
gsettings set org.gnome.shell.extensions.topicons tray-order 1
gsettings set org.gnome.shell.extensions.topicons tray-pos "center"

gsettings set org.gnome.shell.extentions.user-theme name "Abrus-solid-dark"

gsettings set com.gexperts.Tilix.Settings app-title ""
gsettings set com.gexperts.Tilix.Settings auto-hide-mouse true
gsettings set com.gexperts.Tilix.Settings control-scroll-zoom true
gsettings set com.gexperts.Tilix.Settings copy-on-select true
gsettings set com.gexperts.Tilix.Settings focus-follow-mouse true
gsettings set com.gexperts.Tilix.Settings new-instace-mode "new-window"
gsettings set com.gexperts.Tilix.Settings quake-specific-monitor 0
gsettings set com.gexperts.Tilix.Settings teminal-title-style none
gsettings set com.gexperts.Tilix.Settings warn-vte-config-issue false
gsettings set com.gexperts.Tilix.Settings window-style "disable-csd-hide-toolbar"


