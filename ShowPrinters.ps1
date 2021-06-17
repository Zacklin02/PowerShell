$cn = (Read-Host "Computer Name")
$s = New-PSSession -ComputerName $cn
#makes sure RR is not disabled
#Set-Service -Name RemoteRegistry -StartUpType Automatic
#Fires it up #likeaboss
#Start-Service -Name RemoteRegistry
Invoke-Command -Session $s -ScriptBlock{
#gets list of SIDS to recurse through to get the user
$sids = Get-ChildItem Registry::HKEY_USERS -Exclude ".Default","*Classes*" | Select-Object Name -ExpandProperty Name

#gets the users mapped printers by recursing through sids to determine who has mapped printers
    foreach($sid in $sids)
    {
      #Get-ChildItem Registry::$sid\Printers
      if (Test-Path -Path Registry::$sid\Printers\Connections)  
    { 
    $goodsid = $sid
    #trims string
    $unsid = $sid.Substring(11)
    #gets username from sid
    $objSID = New-Object System.Security.Principal.SecurityIdentifier($unsid)
    $objUser = $objSID.Translate( [System.Security.Principal.NTAccount])
    #Might want to UN for some reason
    $un = $objUser.Value
    $printers =Get-ChildItem Registry::$goodsid\Printers\Connections | 
    Select-Object Name | Out-File "C:\Printers.txt"

  #parses text file toget a readable list of printers
  (Get-Content "C:\Printers.txt") | Foreach-Object {$_ -replace "HKEY_USERS", ""} |
   Foreach-Object {$_ -replace "$unsid", ""} | Foreach-Object {$_ -replace "\\", ""} | Foreach-Object {$_ -replace "Printers", ""} | 
  Foreach-Object {$_ -replace "Connections", ""} | Foreach-Object {$_ -replace ",", "\"} | Set-Content "C:\Printers.txt"     
        }
      Else
      {
      }
    }
    }

    #Copies files to same directory
    Move-Item -Path "\\$cn\C$\Printers.txt" -Destination .\$cn.txt