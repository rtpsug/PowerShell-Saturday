# Use Write-Error over throw

# Throwing an error to catch

try {
    # obligatory clearing of error variable for example
    $Error.Clear()

    Write-Output "This has some fancy code."
    # minding
    # my own
    # business
    Write-Output "I dont like what I see and" +
        "should handle it seperately when I see it"

    # simulating identifying an edge case
    if ($true){
        Write-Error -Exception "We were unable to get the correct UDP connection.....some off the wall tribal issue." `
            -Message "Something does not seem right.....message for the help desk to find the correct article." `
            -Category ConnectionError `
            -ErrorId "KB10000001" `
            -RecommendedAction "Check that config file only the SME knows about."
            # multiple predefined items provided by PSs intellisense
    }
} catch{
    Clear-Host
    $Error[0]

    # $Error[0].CategoryInfo # Info about reason and category
    
    # $Error[0].Exception # Extracted issue
    
    # $Error[0].InvocationInfo # Finding the culprit
    
    # $Error[0].InvocationInfo.ScriptName # Finding the culprit; curated
    
    # $Error[0].ScriptStackTrace # Finding the needle in the hay stack
    
    # $error[0].ErrorDetails.RecommendedAction # Useful info for support
    
    # $Error[0].Exception.GetType().FullName # Helps us find that specific error
}