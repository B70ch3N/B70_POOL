# Clean build: wipe public/ and regenerate the whole site.
param([switch]$NoClean)

. (Join-Path $PSScriptRoot 'env.ps1')

Push-Location $RepoRoot
try {
  if (-not $NoClean) {
    & $NodeExe $HexoCli clean
    if ($LASTEXITCODE -ne 0) { throw "hexo clean failed ($LASTEXITCODE)" }
  }

  & $NodeExe $HexoCli generate
  if ($LASTEXITCODE -ne 0) { throw "hexo generate failed ($LASTEXITCODE)" }

  $files = (Get-ChildItem (Join-Path $RepoRoot 'public') -Recurse -File | Measure-Object).Count
  Write-Host "Build OK: $files files in public\"
}
finally {
  Pop-Location
}
