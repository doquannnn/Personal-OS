#!/usr/bin/env bash

set -euo pipefail

fvm_version="4.3.1"
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
frontend_dir="$(dirname -- "$script_dir")"
tools_dir="$frontend_dir/.tools/fvm"
fvm_bin="$tools_dir/bin/fvm"

case "$(uname -s):$(uname -m)" in
    Linux:x86_64)
        asset="fvm-${fvm_version}-linux-x64.tar.gz"
        checksum="ad59c861bdbef80c9f262d30ab28debd374afad0ef4b10b99a47bbab77e08bde"
        ;;
    Darwin:arm64)
        asset="fvm-${fvm_version}-macos-arm64.tar.gz"
        checksum="9c69d11d792963ce52a2dce457d4ec7f1d9c5da38d17d3088cdfcae4a6e3c525"
        ;;
    Darwin:x86_64)
        asset="fvm-${fvm_version}-macos-x64.tar.gz"
        checksum="adfee394a827aa9fb9b8a345c8531e2194f638d0b6c15450a3cbbb00c1ccaa8d"
        ;;
    *)
        printf 'Không hỗ trợ nền tảng FVM: %s:%s\n' "$(uname -s)" "$(uname -m)" >&2
        exit 1
        ;;
esac

if [[ -x "$fvm_bin" ]]; then
    printf 'FVM cục bộ đã sẵn sàng: %s\n' "$fvm_bin"
    exit 0
fi

command -v curl >/dev/null || { printf 'Cần curl để tải FVM.\n' >&2; exit 1; }
command -v sha256sum >/dev/null || { printf 'Cần sha256sum để xác thực FVM.\n' >&2; exit 1; }
command -v tar >/dev/null || { printf 'Cần tar để giải nén FVM.\n' >&2; exit 1; }

temporary_dir="$(mktemp -d)"
trap 'rm -rf "$temporary_dir"' EXIT
archive="$temporary_dir/$asset"
extract_dir="$temporary_dir/extract"
url="https://github.com/leoafarias/fvm/releases/download/${fvm_version}/${asset}"

printf 'Tải FVM %s cho %s...\n' "$fvm_version" "$(uname -s)"
curl --fail --location --silent --show-error "$url" --output "$archive"
printf '%s  %s\n' "$checksum" "$archive" | sha256sum --check --status

mkdir -p "$extract_dir" "$tools_dir/bin"
tar -xzf "$archive" -C "$extract_dir"
extracted_bin="$(find "$extract_dir" -type f -name fvm -print -quit)"

if [[ -z "$extracted_bin" ]]; then
    printf 'Không tìm thấy binary FVM trong archive đã xác thực.\n' >&2
    exit 1
fi

install -m 755 "$extracted_bin" "$fvm_bin"
printf 'Đã cài FVM cục bộ: %s\n' "$fvm_bin"
