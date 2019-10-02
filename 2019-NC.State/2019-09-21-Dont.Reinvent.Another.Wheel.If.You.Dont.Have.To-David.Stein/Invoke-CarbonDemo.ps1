[CmdletBinding()]
param (
  [parameter()][ValidateNotNullOrEmpty()][string] $FolderPath = "c:\TestFolder",
  [parameter()][string] $GroupName = "Users"
)
try {
  if (!(Test-Path $FolderPath)) {
    md $FolderPath -Force
  }
  Grant-CPermission $FolderPath –Identity $GroupName –Permission Full –ApplyTo ContainerAndChildContainersAndChildLeaves –Type Allow
}
catch {
  Write-Error $_.Exception.Message
}
