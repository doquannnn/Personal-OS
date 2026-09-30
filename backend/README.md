# Backend Personal OS

Backend Python của Personal OS, được quản lý bằng `uv`.

## Thiết lập

```bash
uv sync
uv run personal-os
```

Mã nguồn đặt trong `src/`; test được đặt trong `tests/`.

## Kiểm tra chất lượng

Chạy script từ thư mục `backend/`. Script tự đồng bộ môi trường bằng
`uv sync --locked` trước khi gọi Ruff, Pyrefly và pytest.

Trong lúc phát triển, dùng chế độ mặc định để xem kết quả và xác nhận trước
mỗi bước tiếp theo:

```bash
./scripts/check-backend.sh
```

Trước khi commit, mở pull request hoặc khi chạy trong CI, dùng `--all` nếu đã
chấp thuận chạy toàn bộ các bước liên tiếp:

```bash
./scripts/check-backend.sh --all
```

Khi cần Ruff tự định dạng và sửa các lỗi lint an toàn, dùng `--fix`. Sau khi
chạy, luôn xem lại diff vì tùy chọn này có thể thay đổi mã nguồn:

```bash
./scripts/check-backend.sh --fix
```

Chỉ kết hợp `--all --fix` khi muốn cho phép sửa và kiểm tra liên tiếp mà không
dừng xác nhận giữa các bước:

```bash
./scripts/check-backend.sh --all --fix
```

Các công cụ có vai trò riêng:

- Ruff kiểm tra định dạng, lỗi lint và import.
- Pyrefly kiểm tra kiểu tĩnh cho mã nguồn và test.
- pytest chạy các kiểm thử trong `tests/`.
