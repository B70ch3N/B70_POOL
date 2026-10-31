# Commit and push content changes. Vercel builds and deploys after the push,
# so a local build is optional: pass -Build to verify the site compiles first.
# Usage:  .\tools\publish.ps1 -Message "新增文章：xxx"
#         .\tools\publish.ps1 -Message "..." -Yes -Build
param(
  [string]$Message,
  [switch]$Yes,
  [switch]$Build
)

. (Join-Path $PSScriptRoot 'env.ps1')

if ($Build) {
  & (Join-Path $PSScriptRoot 'build.ps1')
}

Push-Location $RepoRoot
try {
  git add -A
  $staged = @(git diff --cached --name-only)
  if ($staged.Count -eq 0) {
    Write-Host 'Nothing to publish: working tree matches HEAD.'
    return
  }

  Write-Host "Staged $($staged.Count) file(s):"
  $staged | Select-Object -First 20 | ForEach-Object { Write-Host "  $_" }
  if ($staged.Count -gt 20) { Write-Host "  ... ($($staged.Count - 20) more)" }

  if (-not $Message) {
    $Message = "post: update $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
  }

  if (-not $Yes) {
    $answer = Read-Host "Commit with message '$Message' and push to origin? [y/N]"
    if ($answer -notmatch '^(y|Y)') {
      Write-Host 'Aborted: changes stay staged, nothing was committed or pushed.'
      return
    }
  }

  git commit -m $Message
  if ($LASTEXITCODE -ne 0) { throw "git commit failed ($LASTEXITCODE)" }

  git push origin HEAD
  if ($LASTEXITCODE -ne 0) { throw "git push failed ($LASTEXITCODE)" }

  Write-Host 'Pushed. Vercel will rebuild https://www.b70.tech/ in a minute or two.'
}
finally {
  Pop-Location
}
