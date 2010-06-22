# Add Git to the PS path
$Env:Path = $Env:Path + ";C:\devtools\git\bin"

# Always import psake
Import-Module("C:\devtools\psake\psake.psm1")

# Alias to open Notepad++ on a file
function npp ($file) {
	& 'C:\Program Files (x86)\Notepad++\notepad++.exe' $file
}

#Opens Visual Studio 2010
function vs ($param) {
	& "C:\Program Files (x86)\Microsoft Visual Studio 10.0\Common7\IDE\devenv.exe" $param
}

# Opens the first .sln file in the current folder in VS
# From: http://tiredblogger.wordpress.com/2009/08/21/using-git-and-everything-else-through-powershell/
function vsh {
    param ($param)
   
    if ($param -eq $NULL) {
        “A solution was not specified, opening the first one found.”
        $solutions = get-childitem | ?{ $_.extension -eq “.sln” }
    }
    else {
        “Opening {0} …” -f $param
        vs $param
        break
    }
    if ($solutions.count -gt 1) {
        “Opening {0} …” -f $solutions[0].Name
        vs $solutions[0].Name
    }
    else {
        “Opening {0} …” -f $solutions.Name
        vs $solutions.Name
    }
}