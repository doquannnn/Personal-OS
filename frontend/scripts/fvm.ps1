$ErrorActionPreference = 'Stop'

$frontendDir = Split-Path -Parent $PSScriptRoot
$fvmBin = Join-Path $frontendDir '.tools/fvm/bin/fvm.exe'

if (-not (Test-Path $fvmBin)) {
    throw 'Chua co FVM cuc bo. Chay: .\\scripts\\bootstrap-fvm.ps1'
}

$env:FVM_CACHE_PATH = Join-Path $frontendDir '.tools/fvm-cache'
& $fvmBin @args
exit $LASTEXITCODE
