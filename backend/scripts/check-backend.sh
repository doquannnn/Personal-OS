#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
backend_dir="$(dirname -- "$script_dir")"
run_all=false
fix=false

show_help() {
    cat <<'EOF'
Cách dùng: ./scripts/check-backend.sh [--all] [--fix]

Tùy chọn:
  --all   Chạy toàn bộ các bước mà không yêu cầu xác nhận giữa các bước.
  --fix   Cho phép Ruff định dạng và sửa các lỗi lint an toàn.
  --help  Hiển thị hướng dẫn này.
EOF
}

while (($# > 0)); do
    case "$1" in
        --all)
            run_all=true
            ;;
        --fix)
            fix=true
            ;;
        --help)
            show_help
            exit 0
            ;;
        *)
            printf 'Tùy chọn không hợp lệ: %s\n' "$1" >&2
            show_help >&2
            exit 2
            ;;
    esac
    shift
done

if [[ "$run_all" == false && ! -t 0 ]]; then
    printf 'Chế độ mặc định cần terminal tương tác. Dùng --all để chạy không tương tác.\n' >&2
    exit 2
fi

cd "$backend_dir"

confirm_next() {
    if [[ "$run_all" == true ]]; then
        return
    fi

    local answer
    read -r -p "Tiếp tục bước kế tiếp? [y/N] " answer
    if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
        printf 'Đã dừng theo yêu cầu.\n'
        exit 0
    fi
}

run_step() {
    local description="$1"
    shift
    printf '\n==> %s\n' "$description"
    "$@"
}

run_step "Đồng bộ môi trường từ uv.lock" uv sync --locked
confirm_next

if [[ "$fix" == true ]]; then
    run_step "Định dạng mã nguồn bằng Ruff" uv run ruff format .
    confirm_next
    run_step "Sửa các lỗi lint an toàn bằng Ruff" uv run ruff check --fix .
    confirm_next
fi

run_step "Kiểm tra định dạng bằng Ruff" uv run ruff format --check .
confirm_next
run_step "Kiểm tra lint bằng Ruff" uv run ruff check .
confirm_next
run_step "Kiểm tra kiểu bằng Pyrefly" uv run pyrefly check
confirm_next
run_step "Chạy kiểm thử bằng pytest" uv run pytest

printf '\nTất cả kiểm tra backend đã hoàn tất.\n'
