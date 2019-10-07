try
{
    Get-Process fdsfds -ErrorVariable mybestvariablename -ErrorAction Stop
}
catch
{
    Write-Output "Found process"
}