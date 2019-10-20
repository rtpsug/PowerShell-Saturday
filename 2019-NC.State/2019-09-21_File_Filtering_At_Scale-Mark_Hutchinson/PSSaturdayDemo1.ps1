$keywordList = import-csv -Path "c:\users\new user\documents\pssaturday stuff\KeywordList.csv"
$keywordList

break

# Let's do a little filtering and transformation of the search terms
# into wildcard strings we can use in a switch statement
$keywordList | 
  %{if ($_.Type -like "*FileName*") {$_.searchterm} } |
  %{$_ -replace "%", "*"}

  # We could also have done this:
  #$keywordList | 
  #  ?{ $_.type -in "filename","keyfilename"} | 
  #  %{$_.searchterm -replace "%", "*"}

break

# We can easily construct switch statement conditions
$keywordList | 
  %{if ($_.Type -like "*FileName*") {$_.searchterm} } |
  %{"`"$($_ -replace "%", "*")`" {`$o;break}"}  #| clip

break

#=======================================
# How well does this perform against a list of C: drive files?
# * NOT TOO BAD (~ 2.5 minutes)
& "C:\Users\New User\downloads\EmptyStandbyList.exe" "standbylist"
measure-command{
gc C:\temp\audit.all |
  %{ 
    $o = $_
    switch -Wildcard ($_.split('\')[-1]){
      "*SQL*Navigator*.exe" {$o;break}
      "*SQL*Optimizer*.exe" {$o;break}
      "bfactory*.exe" {$o;break}
      "KXpert*.exe" {$o;break}
      "QSR.exe" {$o;break}
      "QuestCodeTesterOracle*.exe" {$o;break}
      "QuestParser*.exe" {$o;break}
      "QuestSoftware.SVChecker*.exe" {$o;break}
      "TDM.exe" {$o;break}
      "Toad*.exe" {$o;break}
      "*.key" {$o;break}
      "ProductLicenses.xml" {$o;break}
      "qsauth*" {$o;break}
    }
  }  | measure
}


Days              : 0
Hours             : 0
Minutes           : 2
Seconds           : 27
Milliseconds      : 499
Ticks             : 1474997463
TotalDays         : 0.00170717298958333
TotalHours        : 0.04097215175
TotalMinutes      : 2.458329105
TotalSeconds      : 147.4997463
TotalMilliseconds : 147499.7463

break

#===========================================
# Phil decided to convert the $keywordlist into a regex pattern
$IncludeFiles = ((($keywordList | Where-Object Type -like "*FileName*" | select -ExpandProperty SearchTerm | % {"^$_$"} ) -join '|') -replace '\.','\.') -replace '%','.*'
$IncludeFiles

# How well does the regex perform?
# Better than the switch statement by half a minute
& "C:\Users\New User\downloads\EmptyStandbyList.exe" "standbylist"
measure-command{
gc C:\temp\audit.all |
  ?{ $_ -match $IncludeFiles
  }  | measure
}


Days              : 0
Hours             : 0
Minutes           : 1
Seconds           : 55
Milliseconds      : 502
Ticks             : 1155025106
TotalDays         : 0.00133683461342593
TotalHours        : 0.0320840307222222
TotalMinutes      : 1.92504184333333
TotalSeconds      : 115.5025106
TotalMilliseconds : 115502.5106