echo "[[i3 installation]]"
yaourt -S i3-gaps i3blocks compton feh polybar redshift rxvt-unicode rofi i3lock-fancy-git amixer xbacklight playerctl --needed --noconfirm

echo "[[Getting Config]]"
git clone https://github.com/ogoes/DotfilesSucculent.git
echo "Informe o caminho do arquivo de configuração do i3: " -n
read file
dir=$(echo ${file%/*})
source='DotfilesSucculent'

cp -rf $source/i3/{i3blocks.conf,workspace-main.json} $dir
mv $file ${file}.bak
cp -rf $source/i3/config $file

rm -rf $source/.config/i3

cp -rf $source/{.config,_Xresources} ./

rm -rf $source

