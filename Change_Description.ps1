$OSValues = Get-WmiObject -class Win32_OperatingSystem -computername (Read-Host "Computer name")

$OSValues.Description = (Read-Host "New Description")

$OSValues.put()