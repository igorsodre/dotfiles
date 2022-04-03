winget install JanDeDobbeleer.OhMyPosh

code $PROFILE

oh-my-posh init pwsh | Invoke-Expression

Get-PoshThemes

# cola no arquivo do profile
oh-my-posh init pwsh --config C:\Users\sodre\AppData\Local\Programs\oh-my-posh\themes/sonicboom_dark.omp.json | Invoke-Expression

winget install GitHub.cli

Install-Module -Name Terminal-Icons -Repository PSGallery

# paste in your profile
Import-Module -Name Terminal-Icons

Install-Module PSReadLine -force

Set-PSReadLineOption -PredictionSource History

Install-Module z -AllowClobber
