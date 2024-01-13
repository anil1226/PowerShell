Param(
  [string]$Path = './webapp',
  [string]$DestinationPath = './',
  [switch]$PathIsWebApp
)

if (!(Test-Path $Path) -or !(Test-Path $DestinationPath) ) {
    throw "path does not exist"
}

if ($PathIsWebApp) {
  try {
    $fileExist = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match '\.js|\.html|\.css'
    if (!$fileExist) {
      throw "not a web app"
    }else {
      Write-Host "thumbs up to files"
    }
  }
  catch {
    Write-Error "error:$($PSItem.Exception.Message)" -ErrorAction Stop
  }
}

$date = Get-Date -Format FileDate
try {
  Compress-Archive -Path $Path -CompressionLevel Optimal -DestinationPath $($DestinationPath+'backup-'+$date) -Update
}
catch {
  Write-Error "error:$($PSItem.Exception.Message)" -ErrorAction Stop
}

Write-Host "Created backup at $($DestinationPath + 'backup-'+$date+'.zip')" 
