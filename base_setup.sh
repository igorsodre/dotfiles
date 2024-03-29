#! /bin/sh

################################################################  PROGRAMAS GERAIS ##############################
# change special key to move windowsm to super instead of ALT. preference -> windows -> Behavior

sudo apt update -y; sudo apt upgrade -y;

sudo apt install build-essential cmake imagemagick git copyq xclip xsel vim neovim silversearcher-ag fontconfig vlc flameshot konsole default-jdk fonts-powerline autojump ranger highlight mediainfo tldr -y;

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

# ZSH
sudo apt install zsh -y
chsh -s $(which zsh) # reinicia o PC
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# instala e roda o powelevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# copia e cola o .bashrc pro home
cp ~/Documents/Projects/dotfiles/.bashrc ~/.bashrc
# copia o .zshrc pro home
cp ~/Documents/Projects/dotfiles/.zshrc ~/.zshrc


# ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.9.0
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
sudo apt install -y libssl-dev zlib1g-dev # this is required for version 3.x.x
asdf install ruby 3.1.2
# asdf install ruby 2.7.5
asdf global ruby 3.1.2

## asdf rust
asdf plugin add rust
asdf list all rust
asdf install rust 1.63.0
asdf global rust 1.63.0

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


# instalar android studio
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils ia32-libs-multiarch

#instala o rubymine

# Brave browser
sudo apt install apt-transport-https curl -y

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser -y

# snap
sudo rm /etc/apt/preferences.d/nosnap.pref
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

sudo apt install docker docker-compose
sudo usermod -aG docker $USER
newgrp docker
