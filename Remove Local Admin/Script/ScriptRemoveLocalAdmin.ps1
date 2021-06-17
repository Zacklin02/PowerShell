$group = 'Administrators'
$user = (Read-Host "User Login Name")
$computer = $env:COMPUTERNAME
$title    = 'Remove Administrator Rights'
$question = "Are you sure you want to proceed? 
Computer: $computer   
User: $user"
$choices  = '&Yes', '&No'

$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {

$isInGroup = (Get-LocalGroupMember $group).Name -contains "gateway2\$user"
write-host $isInGroup
if ($isInGroup -eq 'True') {
    
    try {
    Remove-LocalGroupMember -Group $group -member $user
    write-host 'User Removed'
    }
    Catch {
    write-host 'Error: User not removed'
    }

} else {
    Write-Host 'Not local Admin'
}
}