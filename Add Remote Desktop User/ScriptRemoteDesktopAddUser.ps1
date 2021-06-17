$group = 'Remote Desktop Users'
$user = (Read-Host "User Login Name")
$computer = $env:COMPUTERNAME
$title    = 'Allow remote desktop user'
$question = "Are you sure you want to proceed? 
Computer: $computer   
User: $user"
$choices  = '&Yes', '&No'

$decision = $Host.UI.PromptForChoice($title, $question, $choices, 1)
if ($decision -eq 0) {
    
    try {
        Add-LocalGroupMember -Group $group -member $user
        write-host 'User Added'
    }
    Catch {
        write-host 'Error: User not added'
    }

    try {
        Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
        Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
    }
    Catch {
        write-host 'Registry or Netfirewall rule change failed'
    }
}