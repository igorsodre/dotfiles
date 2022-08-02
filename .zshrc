# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
alias vim='lvim'
# . $HOME/.asdf/asdf.sh
. /opt/asdf-vm/asdf.sh
. ~/.asdf/plugins/dotnet-core/set-dotnet-home.zsh
export PATH="$PATH:$HOME/.dotnet/tools/"
. ~/.asdf/plugins/java/set-java-home.zsh

# set the gopath if go is installed
# export GOPATH=$(go env GOPATH)
# export GOROOT=$(go env GOROOT)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
if [ -f ~/.profile ]; then
	. ~/.profile;
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc;
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions kubectl history sudo web-search copypath copyfile copybuffer dirhistory jsontools)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autojump setup
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# angular autocompletion
if command -v ng -v >/dev/null 2>&1; then
  source <(ng completion script)
fi

# colors ls autocomplete setup
if command -v gem -h >/dev/null 2>&1 ; then
  if gem list -i "^colorls$"; then
    source $(dirname $(gem which colorls))/tab_complete.sh
  fi
fi

# aliases
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias LS='colorls --sd --gs --sf'
alias LST='colorls --sd --gs --sf --tree=2'
alias LL='colorls --sd --gs --sf -alf'
alias LA='colorls --sd --gs --sf -A'
alias LAT='colorls --sd --gs --sf -A --tree=2'
alias lf='du -sh * | sort -h'
alias top='htop'

alias open-projects='cd ~/Documents/Projects'
alias open-dot='cd ~/Documents/Projects/dotfiles'
alias rebash='source ~/.zshrc'
alias supercode='sudo code --user-data-dir="/tmp"'
alias xopen='xdg-open'
alias openbash='vim ~/.bashrc'
alias openprofile='vim ~/.profile'
alias opennpm='vim ~/.npmrc'
alias openenvironment='sudoedit /etc/environment'
alias openhosts='sudoedit /etc/hosts'
alias openzsh='vim ~/.zshrc'
alias openvim='vim ~/.vimrc'
alias openneovim='vim ~/.config/nvim/init.vim'
alias openhere='xdg-open . &> /dev/null'
alias update-global-node='n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local'
# alias doupgrade='sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y;'
alias doupgrade='yay -Syu --noconfirm; yay -Qtdq --noconfirm && sudo yay --noconfirm -Rs $(yay -Qtdq)';


# Docker
alias up-containers="docker-compose up -d"
alias stop-containers="docker-compose stop"
alias remove-containers="docker-compose down"
