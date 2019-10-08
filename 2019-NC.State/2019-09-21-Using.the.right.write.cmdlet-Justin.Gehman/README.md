# PowerShell Streams and using the right "Write-*" Cmdlet

## Summary

The files in directory are intended to show how PowerShell's design seperates Error, Verbose, Debug, Warning, and Informational output from the actual data that is passed down the pipeline. Feel free to reach out to me at any time with questions or comments about this material.

* **Presenter:** Justin Gehman
* **Twitter:** [@jmgehman](https://twitter.com/jmgehman)
* **Source:** [github.com/jmgehman/presentations/RTPSUG/PowerShell Saturday 2019](https://github.com/JMGEHMAN/Presentations/tree/master/RTPSUG/PowerShell%20Saturday%202019)

## Presentation Materials

| File | Comment |
| ---| --- |
| [PowerShell Streams and using the right Write Cmdlet.pdf](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/PowerShell%20Streams%20and%20using%20the%20right%20Write%20Cmdlet.pdf) | Slide Deck - Introductory and Summary information. |
| [00_Introduction.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/00_Introduction.ps1) | Shows what the Write cmdlets are and how they all behave when included in a function.
| [01_CmdletBinding.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/01_CmdletBinding.ps1) | Shows that adding ```[CmdletBinding()]``` adds a lot of additional features that directly impact output. |
| [02_PreferenceVariables.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/02_PreferenceVariables.ps1) | Shows how the streams can be controlled with preference variables |
| [03_WriteInformation.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/03_WriteInformation.ps1) | Shows how ```Write-Information``` can be used - specifically tagging messages.
| [Write-Hello.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/Write-Hello.ps1) | Shows how basic fuctions are inadquate and do not leverage streams. See [00_Introduction.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/00_Introduction.ps1) for example commands. |
| [Write-AdvancedHello.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/Write-AdvancedHello.ps1) | Shows how simply adding ```[CmdletBinding()]``` to a script or function opens up a lot of new possibilities. See [01_CmdletBinding.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/01_CmdletBinding.ps1) for example commands. |
| [Write-AdvancedHello2.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/Write-AdvancedHello2.ps1) | Shows how to leverage the **Cmdlet (Advanced Function)** code snippet in ISE. See [01_CmdletBinding.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/01_CmdletBinding.ps1) for example commands. |
| [Write-AdvancedHello3.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/Write-AdvancedHello3.ps1) | Shows how ```Write-Information``` and ```Write-Host``` both use the **Information** stream and how adding tags to ```Write-Information``` commands can help with collecting data. See [03_WriteInformation.ps1](https://github.com/JMGEHMAN/Presentations/blob/master/RTPSUG/PowerShell%20Saturday%202019/03_WriteInformation.ps1) for example commands.  |
