#! /bin/sh
# add the command below on the conf file. They have to be under the section # Misc Options
sudoedit /etc/pacman.conf
Color
ILoveCandy
ParallelDownloads = 5

# increase sudo timeout
sudo visudo
Defaults:sodre timestamp_timeout=560

sudo pacman -Syyu --noconfirm;
sudo pacman -S yay --noconfirm;

# enable AUR on sofware center
yay -S base-devel cmake git imagemagick git copyq xclip xsel fontconfig vlc flameshot bat konsole spotify autojump ranger highlight mediainfo ueberzug tldr vim neovim net-tools firefox firefox-developer-edition gnome-keyring libsecret libgnome-keyring --noconfirm

# vscode
cd /tmp; git clone https://aur.archlinux.org/visual-studio-code-bin.git; cd visual-studio-code-bin; makepkg -si;

# brave
cd /tmp; git clone https://aur.archlinux.org/brave.git; cd brave; makepkg -si;

# sudo yay -S snapd --noconfirm
# sudo systemctl enable --now snapd.socket
# sudo ln -s /var/lib/snapd/snap /snap


sudo mkdir /usr/share/fonts/custom
sudo cp ~/Documents/Projects/dotfiles/f/3270NerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/JetBrainsNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/HackNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/UbuntuNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/FiraCode/* /usr/share/fonts/custom
cd /tmp
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
yay -S nerd-fonts-hack nerd-fonts-fira-code --noconfirm

git config --global user.email "csodreigor@gmail.com"
git config --global user.name "Igor Sodré"


sudo yay -Syu zsh --noconfirm
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# copia e cola o .bashrc pro home
cp ~/Documents/Projects/dotfiles/.bashrc ~/.bashrc
# copia o .zshrc pro home
cp ~/Documents/Projects/dotfiles/.zshrc ~/.zshrc

# vimrc
cp ~/Documents/Projects/dotfiles/.vimrc ~/.vimrc

mkdir -p ~/.config/nvim/
cp ~/Documents/Projects/dotfiles/init.vim ~/.config/nvim/

mkdir -p ~/.config/lvim/
cp ~/Documents/Projects/dotfiles/config.lua ~/.config/lvim/config.lua

# restart

# asdf
cd /tmp; git clone https://aur.archlinux.org/asdf-vm.git && cd asdf-vm && makepkg -si; . /opt/asdf-vm/asdf.sh;

## asdf node
asdf plugin add nodejs
asdf list all nodejs
asdf install nodejs lts
asdf global nodejs lts

## asdf dotnet core
asdf plugin add dotnet-core
# add this to .zshrc . ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

asdf list all dotnet-core
asdf install dotnet-core 6.0.400
asdf install dotnet-core 5.0.406
asdf global dotnet-core 6.0.400
asdf reshim

## asdf ruby
asdf plugin add ruby
asdf list all ruby
sudo apt install -y libssl-dev zlib1g-dev # this is required for version 3.x.x
asdf install ruby 3.1.1
# asdf install ruby 2.7.5
asdf global ruby 3.1.1


## asdf java
asdf plugin add java
asdf list all java | grep openjdk
asdf install java openjdk-18.0.1
asdf global java openjdk-18.0.1
# add this to .zshrc . ~/.asdf/plugins/java/set-java-home.zs

## asdf rust
asdf plugin add rust
asdf list all rust
asdf install rust 1.63.0
asdf global rust 1.63.0

# gem install lscolors
gem install colorls

# discord
yay -S discord_arch_electron

# docker
yay -S docker docker-compose --noconfirm; sudo systemctl enable docker.service; sudo systemctl start docker.service; sudo usermod -aG docker $USER; newgrp docker;


# kde-konsole-themes
cd /tmp
git clone git@github.com:nareshv/kde-konsole-colorschemes.git && git clone https://gitlab.com/protesilaos/modus-themes.git && git clone https://github.com/EliverLara/Sweet.git && git clone https://github.com/PapirusDevelopmentTeam/materia-kde.git && git clone https://github.com/EliverLara/Nordic.git

cp kde-konsole-colorschemes/* ~/.local/share/konsole -r && cp modus-themes/* ~/.local/share/konsole -r && cp Sweet/* ~/.local/share/konsole -r && cp materia-kde/* ~/.local/share/konsole -r && cp Nordic/kde/konsole/* ~/.local/share/konsole -r
cp ~/Documents/Projects/dotfiles/f/konsole_themes/* ~/.local/share/konsole
# Doing the above, also fixes konsole broken profiles

# flat-remix themes
yay -S flat-remix

# lunar vim
npm install -g yarn npm
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)


# slack-desktop
yay -S slack-desktop

# windows bootable usb
yay -S woeusb
# on the program disks, unmount the flashdrive
cd folder_of_my_windows_iso
lsblk #to check wich sd the flashdrive is
sudo woeusb --device path_to_my_windows.iso /dev/sdc --tgt-fs NTFS --verbose # this will take a long time. More than 40 minutes


# how to mount a disk for read and write
sudo mkdir /media/mount-point
sudo mount -o rw /dev/sda3 /media/mount-point

# custom wallpapers on login screen
sudo cp -r ~/Documents/Projects/dotfiles/f/Wallpapers /usr/share/backgrounds/custom/

# yay cheat-sheet:
# yay -S program-name  # installs a package
# yay -Q name          # search locally for programs  # installs a package
# yay -R name          # remove program, don't run it without extra options
# yay -Sy              # update local repositories, equivalent of apt update
# yay -Syu             # update local repositories AND download and install the updated versions. Equivalent of apt update && apt upgrade
# yay -Ss name         # search programs online. name can be ^name
# yay -Rns name        # remove program with all its dependecies and config files
# yay -Sc              # remove obsolete packages from cache

# yay -Q               # list all programs installed and all their dependencies
# yay -Qe               # list all programs installed without their dependencies


# configure applet Grouped window list

#themes
cd /tmp; git clone https://github.com/vinceliuice/Orchis-theme.git ; cd Orchis-theme; ./install.sh;

cd /tmp; git clone https://github.com/vinceliuice/Fluent-gtk-theme.git ; cd Fluent-gtk-theme; ./install.sh;

cd /tmp; git clone https://github.com/vinceliuice/Fluent-icon-theme.git ; cd Fluent-icon-theme; ./install.sh;