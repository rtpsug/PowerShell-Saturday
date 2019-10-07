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
        throw "This doesn't seem right"
    }
} catch{
    Clear-Host
    Write-Output "Oh no, something happened"
    # Perform error actions here
}