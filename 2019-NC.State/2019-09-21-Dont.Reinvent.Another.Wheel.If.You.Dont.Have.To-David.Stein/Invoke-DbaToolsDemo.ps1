param (
  [parameter()][ValidateNotNullOrEmpty()][string] $Server = "db001",
  [parameter()][ValidateNotNullOrEmpty()][string] $Database = "inventory",
  [parameter()][ValidateNotNullOrEmpty()][string] $Query = "select distinct name from workstations where dept=5"
)
Invoke-DbaQuery –SqlInstance $Server –Database $Database –Query $query
