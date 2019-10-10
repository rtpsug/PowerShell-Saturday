try{
    ThisCmdlet-DoesNotExist
} catch{
    Write-Output "You do not have the correct cmdlet; maybe, who knows."
}