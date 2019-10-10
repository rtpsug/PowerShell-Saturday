try {
    Get-ChildItem c:\thisfiledoesnotexist -ErrorAction Stop
}
catch [System.Management.Automation.ItemNotFoundException]
{
    Write-host "This block is executed instead of the error written to the screen"
    Write-Host "Greedo shot first"
    # This is how George Lucas messed up
}
catch
{
    Write-Host "Han shot first."
}