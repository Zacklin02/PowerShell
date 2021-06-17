#Author: Zack Acklin

Function InstallChoco { #Installs chocolaty to local machine
    Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

Function InstallApps { #Install Applications
    choco install googlechrome 7zip vlc -y --ignore-checksums
}

InstallChoco
InstallApps