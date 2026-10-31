# Start the local preview server.
# Usage:  .\tools\dev.ps1            -> http://127.0.0.1:4000/
#         .\tools\dev.ps1 -Port 5000
param(
  [int]$Port = 4000,
  [string]$Address = '127.0.0.1'
)

. (Join-Path $PSScriptRoot 'env.ps1')

Push-Location $RepoRoot
try {
  Write-Host "Preview: http://${Address}:$Port/   (Ctrl+C to stop)"
  & $NodeExe $HexoCli server -p $Port -i $Address
}
finally {
  Pop-Location
}
