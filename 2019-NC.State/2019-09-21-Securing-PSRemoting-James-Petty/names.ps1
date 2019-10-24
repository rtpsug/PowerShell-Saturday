$randomNames = Import-Csv C:\remoting\names.csv
foreach ($r in $randomNames){
    new-aduser -Name ($r.first + $r.last) -SamAccountName $r.first

}

<# only for cleanup
foreach ($r in $randomNames){
    Remove-ADUser -Identity $r.First -Confirm:$false

}

#>