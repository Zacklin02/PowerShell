#__Author: Zack Acklin

$csv = Import-Csv C:\PhoneDID.csv
foreach($user in $csv){

#Set Variables
$name = $user.User
$number = $user.Number
$number = $number.replace("-","")
$sam = Get-ADUser -Filter { DisplayName -eq $name }

#Set otherIpPhone based on SamAccount with the number provided
Set-ADUser $sam -Add @{otherIpPhone = $number}

#Write host to show name and DID#
write-host "Name: $name
DID#: $number
DID added to otherIpPhone"
}