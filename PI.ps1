param(
    # Parameter help description
    [Parameter(Mandatory,HelpMessage="provide path")]
    [string]
    $Path
)

if (-Not $Path -eq '') {
    New-Item $Path
    Write-Host "File $Path is created"
}else {
    Write-Host "Path Cannot be empty"
}
