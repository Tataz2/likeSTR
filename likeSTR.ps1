#
# likeSTR version beta 0.1
# Prints line if it matches the given filter. Pipeline is supported.
# Usage:
# -file <inpute.txt>      Input file
# -filter "124?123*"      Filter 
#           ?                  Any single character
#           *                  Zero or more characters
#           `*                 Match any character as a literal (not a wildcard character)
#                              Works only in PowerShell
#           [charlist]         Any single character in charlist or range like [1-7], [a-d]
# -i                      Case-insensitive match

# Pipeline https://www.gngrninja.com/script-ninja/2016/5/15/powershell-getting-started-part-8-accepting-pipeline-input
# Convert to exe https://www.powershellgallery.com/packages/ps2exe/

[cmdletbinding()]
param(
    [parameter(
        Mandatory         = $false,
        ValueFromPipeline = $true)]
    $pipelineInput,
    [string]$file = "noFile123",
    [string]$filter= "noFilter123",
    [switch]$i,
    [switch]$h,
    [switch]$help
)

Begin {
    #Write-Host "-------------------------------------------------------------------------------"
    #write-host "filter '$filter'"
    #write-host "file '$file'"
    #Write-Host "-------------------------------------------------------------------------------"
}

Process {

    # Print help 
    if ( ("$file" -eq "noFile123" -and $pipelineInput -eq $null) -or ( "$filter" -eq "noFilter123")  ) {
        write-host "likeSTR version beta 0.1"
        write-host "Prints line if it matches the given filter. Pipeline is supported."
        write-host "Usage:"
        write-host "-file <inpute.txt>      Input file"
        write-host "-filter ""124?123*""      Filter"
        write-host "          ?                  Any single character"
        write-host "          *                  Zero or more characters"
        write-host "          ``*                 Match any character as a literal (not a wildcard character)"
        write-host "                              Works only in PowerShell"
        write-host "          [charlist]         Any single character in charlist or range like [1-7], [a-d]"
        write-host "-i                      Case-insensitive match"
        exit 1
    }

    if ("$file" -eq "noFile123") {
         ForEach ($input in $PipelineInput) {
           #write-host "Input: '$input', Filter: '$filter'"
           # If switch parameter -i is given, use case-insensitive match (-like). Otherwise case-sensitive (-clike)
           if ($i){
                if ( $input -like $filter ) { write-host "$input" }
           } else {
                if ( $input -clike $filter ) { write-host "$input" }
           }
         }

    } else {
        if (Test-Path $file) {
            ForEach ($input in type $file) {
                #write-host "Input: '$input', Filter: '$filter'"
                if ($i){
                    if ($input -like $filter) { write-host "$input" }
                } else {
                    if ($input -clike $filter) { write-host "$input" }
                }
            }

        } else {
            write-host "Input file not found!"
        }
    }
}

End {
       # Write-Host "-------------------------------------------------------------------------------"
}
