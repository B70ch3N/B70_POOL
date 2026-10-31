# Create a new post (Markdown file + asset folder, because post_asset_folder is on).
# Usage:  .\tools\new-post.ps1 -Title "我的新文章"
param(
  [Parameter(Mandatory = $true)][string]$Title
)

. (Join-Path $PSScriptRoot 'env.ps1')

Push-Location $RepoRoot
try {
  & $NodeExe $HexoCli new post $Title
  if ($LASTEXITCODE -ne 0) { throw "hexo new failed ($LASTEXITCODE)" }

  $dir = Join-Path $RepoRoot 'source\_posts'
  $created = Get-ChildItem $dir -Filter '*.md' | Sort-Object LastWriteTime -Descending | Select-Object -First 1
  Write-Host "Created: $($created.FullName)"
  Write-Host "Images for this post go into: $($created.DirectoryName)\$($created.BaseName)\"
}
finally {
  Pop-Location
}
