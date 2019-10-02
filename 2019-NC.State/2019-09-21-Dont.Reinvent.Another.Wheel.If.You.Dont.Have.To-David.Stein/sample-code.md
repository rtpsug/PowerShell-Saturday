## Function Invoke-DemoStuff.ps1

Demonstrate the use of Carbon functions to help simplify common Windows computer configuration tasks.

**DISCLAIMER**
PROVIDED "AS-IS". USE AT YOUR OWN RISK.  TEST IN AN ISOLATE (NON-PRODUCTION) ENVIRONMENT.  NO WARRANTY/GUARANTEE OF ANY KIND.

### Examples

#### Setup Sample Environment Configuration

```powershell
.\Invoke-DemoStuff.ps1 -Mode Setup
``` 

#### Remove Sample Environment Configuration

```powershell
.\Invoke-DemoStuff.ps1 -Mode Cleanup
```

### Source Code

```powershell
#requires -Modules carbon
[CmdletBinding()]
param (
    [parameter(Mandatory)] [ValidateSet('Setup','Cleanup')] [string] $Mode,
    [parameter()][string]$DemoName = 'Skatterbrainz'
)
<#
Tasks...

* Modify or Set registry key/value
* Create a new local account
* Add local account to local Administrators group
* Grant local account 'Logon as service' rights
* Deny local account 'Interactive logon' rights
#>

#region Set-Parameters
$RegKeyPath   = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\$DemoName"
$RegValue1    = @{Name = "DisplayName"; Data = "$DemoName 2019"}
$RegValue2    = @{Name = "DisplayVersion"; Data = "19.8.01"}
$AccountName  = "CustomService"
$AcctPassword = 'Sup3r$3cuRe$2019!'
#region Set-Parameters

if ($Mode -eq 'Setup') {

    Write-Host "setting things up..." -ForegroundColor Green

    Set-CRegistryKeyValue -Path $RegKeyPath -Name $RegValue1.Name -String $RegValue1.Data
    Set-CRegistryKeyValue -Path $RegKeyPath -Name $RegValue2.Name -String $RegValue2.Data

    $SecPwd = ConvertTo-SecureString -String $AcctPassword -AsPlainText -Force
    New-LocalUser -Name $AccountName -FullName $AccountName -Description "Test Service Account" -Password $SecPwd -AccountNeverExpires

    Add-CGroupMember -Name "Administrators" -Member $AccountName
    Grant-CPrivilege -Identity $AccountName -Privilege SeServiceLogonRight,SeDenyInteractiveLogonRight

    Write-Host "complete!" -ForegroundColor Green

    Write-Host "----------- User Account -----------" -ForegroundColor Yellow
    Write-Output (Get-WmiLocalUserAccount -Username $AccountName) -NoEnumerate

    Write-Host "----------- Administrators group -----------" -ForegroundColor Yellow
    Write-Output (Get-LocalGroupMember -Group "Administrators") -NoEnumerate

    Write-Host "----------- User Privileges -----------" -ForegroundColor Yellow
    Write-Output (Get-CPrivilege -Identity $AccountName) -NoEnumerate

}
else {
    $ErrorActionPreference = 'SilentlyContinue'

    Write-Host "cleaning things up..." -ForegroundColor Magenta

    if (Get-LocalUser -Name $AccountName) {
        Remove-LocalUser -Name $AccountName -Confirm:$False
    }
    else {
        Write-Host "user account not found: $AccountName" -ForegroundColor Magenta
    }
    #Remove-CRegistryKeyValue -Path $RegKeyPath -Name '*' -Confirm:$False
    Remove-Item -Path $RegKeyPath -Recurse -Force

    Write-Host "complete!" -ForegroundColor Magenta

}
```
