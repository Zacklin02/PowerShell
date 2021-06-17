while(($inp = Read-Host -Prompt "Run Script? 'N' will exit") -ne "N"){
    $computer = (Read-Host "Computer name")

    Write-Host 'confirmed'
    New-PSSession -computer $computer

    Invoke-Command -computer $computer -FilePath .\Script\ScriptRemoveLocalAdmin.ps1
    
    Remove-PSSession -computer $computer

}