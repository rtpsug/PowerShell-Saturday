try {
    Get-ChildItem c:\thisfiledoesnotexist -ErrorAction Stop -ErrorVariable mycustomerror
}
catch [System.Management.Automation.ItemNotFoundException]
{
    Write-host "This block is executed instead of the error written to the screen"
}

# $mycustomerror.CategoryInfo # Info about reason and category

# $mycustomerror.Exception # Extracted issue

# $mycustomerror.InvocationInfo # Finding the culprit

# $mycustomerror.InvocationInfo.ScriptName # Finding the culprit; curated

# $mycustomerror.ScriptStackTrace # Finding the needle in the hay stack

# $mycustomerror.ErrorDetails.RecommendedAction # Useful info for support

# $mycustomerror.Exception.GetType().FullName # Helps us find that specific error