#Author: Zack Acklin

Function LoadDefUser {
    REG.EXE Load HKU\DefUser C:\Users\Default\NTUser.dat
}
Function UnloadDefUser {
    Reg.exe Unload HKU\DefUser
}
Function AddDesktopIcons {
    #This-PC Icon
    New-Item -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Force
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Name '{20D04FE0-3AEA-1069-A2D8-08002B30309D}' -PropertyType 'DWORD' -Value '0' -Force

    #Control Panel Icon
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel' -Name '{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}' -PropertyType 'DWORD' -Value '0' -force
}
Function RemoveDesktopIcons {
    #Remove VLC
    Remove-Item -path 'C:\Users\Public\Desktop\VLC media player.lnk'
}
Function Taskbar {
    #Remove Searchbox
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -PropertyType 'DWORD' -Value '0' -Force

    #Remove Task View Icon
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -PropertyType 'DWORD' -Value '0' -Force

    #Remove People Icon
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'PeopleBand' -Value '0' -PropertyType 'DWORD' -Force

    #Remove Cortana Icon
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCortanaButton' -Value '0' -PropertyType 'DWORD' -Force
}
Function FileExplorer {
    #Show Hidden Files
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -PropertyType 'DWORD' -Value '1' -Force

    #Show File Extensions
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -PropertyType 'DWORD' -Value '0' -Force

    #Open File Explorer to This PC
    New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -PropertyType 'DWORD' -Value '1' -Force
}

Function DataFolder {
    #Create Data Folder on C:
    New-Item -path "C:\" -Name "Data" -ItemType "Directory"
}

LoadDefUser
start-sleep -Seconds 15
#__Put Functions After__


AddDesktopIcons
RemoveDesktopIcons
Taskbar
FileExplorer
DataFolder