Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
)

$date = Get-Date -Format FileDate
Compress-Archive -Path $Path -CompressionLevel Optimal -DestinationPath $($DestinationPath+'backup-'+$date)
Write-Host "Created backup at $($DestinationPath + 'backup-'+$date+'.zip')" 