#region Enable
winrm qc

Enable-PSRemoting

#endregion Enable

#region 1 to 1 remoting

Enter-PSSession DC01 

Invoke-Command -computername dc01 -ScriptBlock { gci C:\remoting } 

#endregion 1 to 1 remoting


#region 1 to many remoting

invoke-command -ComputerName dc01,srv01 -ScriptBlock { 
gci C:\remoting 
gci c:\
get-service spooler}

Invoke-Command -ComputerName dc01 -ScriptBlock {get-aduser jan}

invoke-command -computername dc01 -FilePath C:\remoting\names.ps1

Invoke-Command -ComputerName dc01 -ScriptBlock {get-aduser jan}

#endregion 1 to 1 remoting


#region sessions
$session1 = New-PSSession -ComputerName DC01

Get-PSSession

Enter-PSSession -Session $session1

Invoke-Command -Session $session1 -scriptblock { gci C:\remoting }

$session2 = New-PSSession -ComputerName dc01,srv01

Invoke-Command -Session $session2 -scriptblock { gci C:\remoting }


#endregion sessions


#region Data

Invoke-Command -ComputerName dc01 -scriptBlock `
{ Get-WmiObject -Class Win32_Process } | Select-Object Name, { $_.GetOwner().User }



Invoke-Command -ComputerName dc01 -scriptBlock `
{ Get-WmiObject -Class Win32_Process | Select-Object Name, { $_.GetOwner().User } }

#endregion Date

#region copy
Enter-PSSession dc01 

#old way of copying
foreach ($s in $servers) {copy-item \\c:\temp\mydocument.txt \\$s\c$\temp}

$session1 = New-PSSession -ComputerName srv01

copy-item  C:\remoting\mycopy.txt -Destination c:\remoting -ToSession $sessionm1 -FromSession
#endregion Copy