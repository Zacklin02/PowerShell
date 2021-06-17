#Taskbar Settings

#Remove Searchbox
New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -PropertyType 'DWORD' -Value '0' -Force

#Remove Task View Icon
New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -PropertyType 'DWORD' -Value '0' -Force

#Remove People Icon
New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'PeopleBand' -Value '0' -PropertyType 'DWORD' -Force

#Remove Cortana Icon
New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowCortanaButton' -Value '0' -PropertyType 'DWORD' -Force

#File Explorer Settings

#Show Hidden Files
New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Hidden' -PropertyType 'DWORD' -Value '1' -Force

#Show File Extensions
New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideFileExt' -PropertyType 'DWORD' -Value '0' -Force

#Open File Explorer to This PC
New-ItemProperty -Path 'Registry::HKU\DefUser\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'LaunchTo' -PropertyType 'DWORD' -Value '1' -Force