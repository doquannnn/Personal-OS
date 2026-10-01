$ErrorActionPreference = 'Stop'

$fvmVersion = '4.3.1'
$frontendDir = Split-Path -Parent $PSScriptRoot
$toolsDir = Join-Path $frontendDir '.tools/fvm'
$fvmBin = Join-Path $toolsDir 'bin/fvm.exe'

if (Test-Path $fvmBin) {
    Write-Output "FVM cuc bo da san sang: $fvmBin"
    exit 0
}

switch ([System.Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture.ToString()) {
    'X64' {
        $asset = "fvm-$fvmVersion-windows-x64.zip"
        $checksum = '88867842466eca560ad2481a479d3e5e5de2d7fbaa37eaaa4983030da6f471cb'
    }
    'Arm64' {
        $asset = "fvm-$fvmVersion-windows-arm64.zip"
        $checksum = '04e8c4e8d5496b19d8c93c8052dc9cb69f1140899d90fb47286db96e49cd49dc'
    }
    default {
        throw "Khong ho tro kien truc Windows: $([System.Runtime.InteropServices.RuntimeInformation]::ProcessArchitecture)"
    }
}

$temporaryDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
$archive = Join-Path $temporaryDir $asset
$extractDir = Join-Path $temporaryDir 'extract'
$url = "https://github.com/leoafarias/fvm/releases/download/$fvmVersion/$asset"

try {
    New-Item -ItemType Directory -Force -Path $temporaryDir, $extractDir, (Split-Path -Parent $fvmBin) | Out-Null
    Write-Output "Tai FVM $fvmVersion cho Windows..."
    Invoke-WebRequest -Uri $url -OutFile $archive

    $actualChecksum = (Get-FileHash -Algorithm SHA256 -Path $archive).Hash.ToLowerInvariant()
    if ($actualChecksum -ne $checksum) {
        throw 'Checksum FVM khong khop; da dung truoc khi cai dat.'
    }

    Expand-Archive -Path $archive -DestinationPath $extractDir
    $extractedBin = Get-ChildItem -Path $extractDir -Recurse -File -Filter 'fvm.exe' | Select-Object -First 1
    if ($null -eq $extractedBin) {
        throw 'Khong tim thay binary FVM trong archive da xac thuc.'
    }

    Copy-Item -Path $extractedBin.FullName -Destination $fvmBin
    Write-Output "Da cai FVM cuc bo: $fvmBin"
}
finally {
    Remove-Item -Recurse -Force -ErrorAction SilentlyContinue $temporaryDir
}
