# likeSTR version beta 0.1

```
 Prints line if it will match given filter. Pipeline is supported.
 Usage:
 -file <inpute.txt>      Input file
 -filter "124?123*"      Filter 
           ?                  Any single character
           *                  Zero or more characters
           `*                 Match any character as a literal (not a wildcard character)
                              Works only in PowerShell
           [charlist]         Any single character in charlist or range like [1-7], [a-d]
 -i                      Case-insensitive match
```

Coverted to exe https://www.powershellgallery.com/packages/ps2exe/1.0.12