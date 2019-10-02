param (
  [parameter()][string] $FilePath = $(Join-Path $PSScriptRoot "computers.xlsx"),
  [parameter()][string] $TabName = "Laptops"
)
if (!(Test-Path $FilePath)) {
  Write-Warning "file not found: $FilePath"
  break
}

Import-Excel –Path $filepath –WorksheetName $TabName
