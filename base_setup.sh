#! /bin/sh

################################################################  PROGRAMAS GERAIS ##############################
# change special key to move windowsm to super instead of ALT. preference -> windows -> Behavior

sudo apt update -y; sudo apt upgrade -y;
sudo apt install git;

mkdir -p ~/Documents/Projects && cd ~/Documents/Projects && git clone https://github.com/igorsodre/dotfiles.git

sudo apt install build-essential cmake imagemagick git copyq xclip xsel vim neovim silversearcher-ag gimp fontconfig vlc flameshot konsole default-jdk libffi-dev libssl-dev zlib1g-dev fonts-powerline ranger highlight mediainfo apt-transport-https tldr -y;

# installing vscode
cd /tmp; wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null && sudo apt update && sudo apt install code

# nodejs
cd /tmp; curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh && sudo -E bash nodesource_setup.sh && sudo apt-get install -y nodejs

# firefox developer
sudo install -d -m 0755 /etc/apt/keyrings && wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null && gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}' && echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null && sudo apt-get update && sudo apt-get install firefox-devedition


# increase sudo timeout
sudo visudo
Defaults:sodre timestamp_timeout=560

# take a look at asdf to manage all your programing languages

# adiciona na startup apps e o shortcut para o copyq

# change print shortcut to use flameshot
# login to firefox

# install vscode

# Set up git
ssh-keygen -t rsa -b 4096 -C "csodreigor@gmail.com"
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub

git config --global user.email "csodreigor@gmail.com"
git config --global user.name "Igor Sodré"
git config pull.rebase false


# install node with nvm - deprecated
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
# nvm install --lts
# source ~/.bashrc
# nvm alias default 16
# npm install yarn -g


# baixar nerd fonts e instalar (firacode e hack) (versões completas, pra não faltar nenhum icone pro terminal)
# baixar e instalar powerlne fonts
cd /tmp
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# extrair o fira code zip e instalar as fontes
sudo mkdir /usr/share/fonts/custom
sudo cp ~/Documents/Projects/dotfiles/f/3270NerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/JetBrainsNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/HackNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/UbuntuNerdFont/* /usr/share/fonts/custom && sudo cp ~/Documents/Projects/dotfiles/f/FiraCode/* /usr/share/fonts/custom

# ZSH
sudo apt install zsh -y
chsh -s $(which zsh) # reinicia o PC
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# instala e roda o powelevel10k
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
ln -s ~/Documents/Projects/dotfiles/nvim ~/.config/nvim

# Wallpapers
ln -s ~/Documents/Projects/dotfiles/f/Wallpapers ~/Pictures/Wallpapers

# ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
rebash

## asdf node
asdf plugin add nodejs
asdf list all nodejs
asdf install nodejs lts
asdf global nodejs lts

## asdf dotnet core
asdf plugin add dotnet-core
# add this to .zshrc . ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh

asdf list all dotnet-core
asdf install dotnet-core 6.0.201
asdf install dotnet-core 5.0.406
asdf global dotnet-core 6.0.201
asdf reshim

## asdf ruby
asdf plugin add ruby
asdf list all ruby
sudo apt install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev # this is required for version 3.x.x
asdf install ruby 3.3.4
# asdf install ruby 2.7.5
asdf global ruby 3.3.4

## asdf rust
asdf plugin add rust
asdf list all rust
asdf install rust 1.79.0 && asdf global rust 1.79.0

## asdf java
asdf plugin add java
asdf list all java
asdf install java openjdk-17
asdf global java openjdk-17
# add this to .zshrc . ~/.asdf/plugins/java/set-java-home.zs


## asdf golang
# asdf plugin add golang
# asdf list all golang
# asdf install golang 1.17.8
# asdf global golang 1.17.8

# asdf plugin add go-sdk
# asdf list-all go-sdk
# asdf install go-sdk 1.17.7


# gem install lscolors
gem install colorls


# install anaconda
apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
# baixa e instala


# instalar android studio, install below, then download and extract it into your bin folder
sudo apt install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

#instala o rubymine

# Brave browser
sudo apt install apt-transport-https curl -y

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

# snap
sudo rm /etc/apt/preferences.d/nosnap.pref
sudo rm -f /etc/apt/preferences.d/10-tuxedo-snap
sudo apt update
sudo apt install snapd

# spotify
snap install Spotify

# discord
snap install discord


# docker & docker-compose
# sudo apt install ca-certificates curl gnupg lsb-release
# sudo mkdir -p /etc/apt/keyrings
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# sudo apt update
# sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo apt install docker docker-compose && sudo usermod -aG docker $USER && newgrp docker

# custom wallpapers on login screen
sudo mkdir -p /usr/share/backgrounds/custom/ && sudo cp -r ~/Documents/Projects/dotfiles/f/Wallpapers /usr/share/backgrounds/custom/



# appearance
sudo add-apt-repository ppa:papirus/papirus && sudo apt update && sudo apt install qt6-style-kvantum qt6-style-kvantum-themes
