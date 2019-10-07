try
{
    Get-Process fdsfds -ErrorVariable $mybestvariablename
}
catch
{
    Write-Output "Found process"
}

$mybestvariablename # does not exist because not all errors are terminating