#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
frontend_dir="$(dirname -- "$script_dir")"
fvm_bin="$frontend_dir/.tools/fvm/bin/fvm"

if [[ ! -x "$fvm_bin" ]]; then
    printf 'Chưa có FVM cục bộ. Chạy: bash scripts/bootstrap-fvm.sh\n' >&2
    exit 1
fi

export FVM_CACHE_PATH="$frontend_dir/.tools/fvm-cache"
exec "$fvm_bin" "$@"
