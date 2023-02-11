az aks install-cli
$targetDir="$env:USERPROFILE\.azure-kubelogin"
$oldPath = [System.Environment]::GetEnvironmentVariable("Path","User")
$oldPathArray=($oldPath) -split ";"
if(-Not($oldPathArray -Contains "$targetDir")) {
    write-host "Permanently adding $targetDir to User Path"
    $newPath = "$oldPath;$targetDir" -replace ";+", ";"
    [System.Environment]::SetEnvironmentVariable("Path",$newPath,"User")
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","User"),[System.Environment]::GetEnvironmentVariable("Path","Machine") -join ";"
}