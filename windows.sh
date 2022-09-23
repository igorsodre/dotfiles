# go to: https://github.com/microsoft/winget-cli   > releases latest > download the .msixbundle file and install it

# enable hyper-v, linux subsystem on features
# install all fonts from the "f" folder

winget install --id=hluk.CopyQ  -e
# add to startup: reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v CopyQ /t REG_SZ /d "C:\Program Files (x86)\CopyQ\copyq.exe"

wsl --install

wsl --list --online

wsl --install -d Ubuntu-20.04 # change the start script for ubuntu to C:\Windows\system32\wsl.exe ~ -d Ubuntu-20.04

# follow this link for enabling wsl2
wsl --set-default-version 2

# powetshell 7
winget install --id Microsoft.Powershell --source winget

# git
winget install -e --id Git.Git

# terminal
winget install Microsoft.WindowsTerminal

# vscode
winget install -e --id Microsoft.VisualStudioCode

Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

# after you already installed git
Install-Module posh-git -Scope CurrentUser -Force
Install-Module oh-my-posh -Scope CurrentUser
winget install JanDeDobbeleer.OhMyPosh
Install-Module git-aliases -Scope CurrentUser -AllowClobber
Install-Module -Name Terminal-Icons -Repository PSGallery
winget install GitHub.cli

code $PROFILE

oh-my-posh init pwsh | Invoke-Expression

Get-PoshThemes

Install-Module HackF5.ProfileAlias #https://github.com/hackf5/powershell-profile-alias
# Install-Module -Name Microsoft.PowerShell.UnixCompleters


# paste the contents of the PowerShell_profile.ps1 file on this folder to the system's profile file

########################### useful software
winget install -e --id BraveSoftware.BraveBrowser

winget install -e --id 7zip.7zip

winget install -e --id Docker.DockerDesktop

winget install -e --id VideoLAN.VLC # if it does not work, download and install it

winget install -e --id GIMP.GIMP

winget install -e --id Microsoft.dotnet # if it does not work, download and install it

winget install -e --id OpenJS.NodeJS
npm install -g yarn

winget install -e --id Python.Python.3

winget install -e --id JetBrains.Rider # download and install rider if it does not work
winget install -e --id JetBrains.DataGrip

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

winget install -e --id Discord.Discord

winget install -e --id DelugeTeam.Deluge

winget install -e --id Postman.Postman
