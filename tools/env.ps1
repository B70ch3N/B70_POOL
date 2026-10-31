# Shared environment resolution for this Hexo workspace.
# Dot-source it from other scripts:  . (Join-Path $PSScriptRoot 'tools\env.ps1')

$ErrorActionPreference = 'Stop'

$script:RepoRoot = Split-Path -Parent $PSScriptRoot

# 1. Node.js: prefer PATH, fall back to the runtime bundled with DSH.
$nodeCandidates = @()
$nodeCmd = Get-Command node -ErrorAction SilentlyContinue
if ($nodeCmd) { $nodeCandidates += $nodeCmd.Source }
$nodeCandidates += (Join-Path $env:USERPROFILE '.dsh\dsh-runtimes\dsh-primary-runtime\dependencies\node\bin\node.exe')

$script:NodeExe = $nodeCandidates | Where-Object { $_ -and (Test-Path $_) } | Select-Object -First 1
if (-not $script:NodeExe) {
  throw 'Node.js not found. Install Node.js 18+ (node on PATH) and run this again.'
}

# Packages run install scripts through cmd.exe (e.g. `node -e ...`), so node must be
# resolvable on PATH as well.
$nodeDir = Split-Path -Parent $script:NodeExe
if ($env:PATH -notlike "*$nodeDir*") { $env:PATH = "$nodeDir;$env:PATH" }

# 2. Hexo entry point installed inside the repo.
$script:HexoCli = Join-Path $script:RepoRoot 'node_modules\hexo\bin\hexo'
if (-not (Test-Path $script:HexoCli)) {
  throw "Hexo is not installed ($script:HexoCli missing). See README.md for the dependency step."
}

# 3. Git over HTTPS inside the DSH sandbox fails with schannel SEC_E_NO_CREDENTIALS;
#    the OpenSSL TLS backend works. Harmless outside the sandbox too.
if (-not $env:GIT_CONFIG_COUNT) {
  $env:GIT_CONFIG_COUNT = '1'
  $env:GIT_CONFIG_KEY_0 = 'http.sslBackend'
  $env:GIT_CONFIG_VALUE_0 = 'openssl'
}
