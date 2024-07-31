#! /bin/sh
# add the command below on the conf file. They have to be under the section # Misc Options
sudoedit /etc/pacman.conf
Color
ILoveCandy
ParallelDownloads = 5

sudo pacman -Syyu --noconfirm;
sudo pacman -S yay --noconfirm;

yay -S git

mkdir -p ~/Documents/Projects && cd ~/Documents/Projects && git clone https://github.com/igorsodre/dotfiles.git

# increase sudo timeout
sudo visudo
Defaults:sodre timestamp_timeout=560



# enable AUR on sofware center
yay -S base-devel cmake extra-cmake-modules git imagemagick copyq xclip xsel wl-clipboard fontconfig vlc bat konsole kvantum spotify ranger gimp highlight mediainfo ueberzug tldr vim neovim net-tools neofetch firefox firefox-developer-edition gnome-keyring libsecret libgnome-keyring ripgrep visual-studio-code-bin nodejs ffmpegthumbs qbittorrent vdhcoapp --noconfirm

# if needed
yay -S kpackage5 qt5-tools

cd /tmp; git clone https://github.com/nclarius/kwin-application-switcher.git && cd kwin-application-switcher && ./install.sh


# to enable wayland
yay -S plasma-wayland-session --noconfirm;

# vscode
# cd /tmp; git clone https://aur.archlinux.org/visual-studio-code-bin.git; cd visual-studio-code-bin; makepkg -si;

# brave
cd /tmp; git clone https://aur.archlinux.org/brave.git; cd brave; makepkg -si;

# sudo yay -S snapd --noconfirm
# sudo systemctl enable --now snapd.socket
# sudo ln -s /var/lib/snapd/snap /snap


sudo mkdir -p /usr/share/fonts/custom
sudo cp ~/Documents/Projects/dotfiles/f/3270NerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/JetBrainsNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/HackNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/UbuntuNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/FiraCode/* /usr/share/fonts/custom

cd /tmp && git clone https://github.com/powerline/fonts.git --depth=1 && cd fonts && ./install.sh && cd /tmp && yay -S ttf-hack-nerd ttf-firacode-nerd --noconfirm

git config --global user.email "csodreigor@gmail.com"
git config --global user.name "Igor Sodré"
git config --global pull.rebase false


sudo yay -Syu zsh --noconfirm
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; # reboot computer afer this


# do this after the above, separetly
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# copia e cola o .bashrc pro home
rm ~/.bashrc && ln -s ~/Documents/Projects/dotfiles/.bashrc ~/.bashrc
# copia o .zshrc pro home
rm ~/.zshrc && ln -s ~/Documents/Projects/dotfiles/.zshrc ~/.zshrc

# vimrc
ln -s ~/Documents/Projects/dotfiles/.vimrc ~/.vimrc

# jetbrains vim
ln -s ~/Documents/Projects/dotfiles/.ideavimrc ~/.ideavimrc

mkdir -p ~/.config/
# cp ~/Documents/Projects/dotfiles/init.vim ~/.config/nvim/
ln -s ~/Documents/Projects/dotfiles/nvim ~/.config/nvim
# curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#mkdir -p ~/.config/lvim/
#cp ~/Documents/Projects/dotfiles/config.lua ~/.config/lvim/config.lua

# restart

# asdf
cd /tmp && git clone https://aur.archlinux.org/asdf-vm.git && cd asdf-vm && makepkg -si && . /opt/asdf-vm/asdf.sh;


# Wallpapers
ln -s ~/Documents/Projects/dotfiles/f/Wallpapers ~/Pictures/Wallpapers


## asdf node
asdf plugin add nodejs
asdf list all nodejs
asdf install nodejs 20.9.0
asdf global nodejs 20.9.0

## asdf dotnet core
asdf plugin add dotnet-core
# add this to .zshrc . ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

asdf list all dotnet-core
asdf install dotnet-core 8.0.201
# asdf install dotnet-core 5.0.406
asdf global dotnet-core 8.0.201
asdf reshim

## asdf ruby
asdf plugin add ruby
asdf list all ruby
# sudo apt install -y libssl-dev zlib1g-dev # this is required for version 3.x.x
asdf install ruby 3.2.2
# asdf install ruby 2.7.5
asdf global ruby 3.2.2


## asdf java
asdf plugin add java
asdf list all java | grep openjdk
asdf install java openjdk-21
asdf global java openjdk-21
# add this to .zshrc . ~/.asdf/plugins/java/set-java-home.zs

## asdf rust
asdf plugin add rust
asdf list all rust
asdf install rust 1.76.0
asdf global rust 1.76.0

# gem install lscolors
gem install colorls

# discord
yay -S discord --noconfirm

# docker
yay -S docker docker-compose --noconfirm; sudo systemctl enable docker.service; sudo systemctl start docker.service; sudo usermod -aG docker $USER; newgrp docker;


# kde-konsole-themes
cd /tmp && git clone https://gitlab.com/protesilaos/modus-themes.git  && git clone https://github.com/EliverLara/Sweet.git  && git clone https://github.com/PapirusDevelopmentTeam/materia-kde.git  && git clone https://github.com/EliverLara/Nordic.git && cp modus-themes/* ~/.local/share/konsole -r  && cp Sweet/* ~/.local/share/konsole -r  && cp materia-kde/* ~/.local/share/konsole -r  && cp Nordic/kde/konsole/* ~/.local/share/konsole -r && cp ~/Documents/Projects/dotfiles/f/konsole_themes/* ~/.local/share/konsole;
# Doing the above, also fixes konsole broken profiles
ln -s ~/Documents/Projects/dotfiles/f/Sodre.profile ~/.local/share/konsole/Sodre.profile

# flat-remix themes
# yay -S flat-remix

# slack-desktop
yay -S slack-desktop

# windows bootable usb
yay -S woeusb
# on the program disks, unmount the flashdrive
cd folder_of_my_windows_iso
lsblk #to check wich sd the flashdrive is
sudo woeusb --device path_to_my_windows.iso /dev/sdc --tgt-fs NTFS --verbose # this will take a long time. More than 40 minutes


############# configure ssh agent
mkdir -p ~/.config/systemd/user

#put the following code on the file ~/.config/systemd/user/ssh-agent.service
[Unit]
Description=SSH key agent

[Service]
Type=simple
Environment=DISPLAY=:0
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK
ExecStartPost=/bin/sleep 3
ExecStartPost=/bin/sh -c '/usr/bin/grep -slR "PRIVATE" $HOME/.ssh/ | /usr/bin/xargs /usr/bin/ssh-add'

[Install]
WantedBy=default.target


# enable it and start it
systemctl --user enable ssh-agent
systemctl --user start ssh-agent

# create this config:
mkdir -p ~/.ssh

# put this code on the file  ~/.ssh/config
AddKeysToAgent  yes
#######################################

# how to mount a disk for read and write
sudo mkdir -p /media/mount-point
sudo mount -o rw /dev/sda3 /media/mount-point

# custom wallpapers on login screen
sudo mkdir -p /usr/share/backgrounds/custom/ && sudo cp -r ~/Documents/Projects/dotfiles/f/Wallpapers /usr/share/backgrounds/custom/

# yay cheat-sheet:
# yay -S program-name  # installs a package
# yay -Syy program-name  # installs a package but update the repos first
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

# kde themes
cd /tmp && git clone --single-branch --depth=1 https://github.com/Luwx/Lightly.git && cd Lightly && mkdir build && cd build && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DBUILD_TESTING=OFF .. && make && sudo make install;

# for window decorations search for willow and choose the dark version
# set the GTK theme for Fluent-Dar-compact

cd /tmp && git clone https://github.com/yeyushengfan258/We10XOS-kde && cd ./We10XOS-kde  && ./install.sh;
cd /tmp && git clone https://github.com/yeyushengfan258/Win11-icon-theme && cd ./Win11-icon-theme && ./install.sh;
cd /tmp && git clone https://github.com/yeyushengfan258/We10x-icon-theme && cd ./We10x-icon-theme && ./install.sh;

cd /tmp; git clone https://github.com/vinceliuice/Orchis-theme.git ; cd Orchis-theme; ./install.sh;

cd /tmp; git clone https://github.com/vinceliuice/Fluent-gtk-theme.git ; cd Fluent-gtk-theme; ./install.sh;

cd /tmp; git clone https://github.com/vinceliuice/Fluent-icon-theme.git ; cd Fluent-icon-theme; ./install.sh;

# kvantum themes
# open the kvantum manager
cd /tmp && git clone https://github.com/vinceliuice/Orchis-kde.git

cd /tmp && git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git && cd Tela-circle-icon-theme && ./install.sh -a

cd /tmp && git clone https://gitlab.com/jomada/otto.git && cd otto && chmod u+x install.sh && ./install.sh


# neofetch customization
cd /tmp && git clone https://github.com/Chick2D/neofetch-themes/
cat neofetch-themes/normal/acenoster.conf > ~/.config/neofetch/config.conf
