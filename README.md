# Personal OS

Ứng dụng chatbot AI local, cross-platform, với giao diện tối giản lấy cảm hứng từ Siri.

## Cấu trúc repository

- `backend/`: backend Python, dependency và môi trường được quản lý bằng `uv`.
- `frontend/`: ứng dụng Flutter/Dart sẽ được thêm sau.
- `docs/`: tài liệu phạm vi và phiên bản sản phẩm.

Để thiết lập backend:

```bash
cd backend
uv sync
uv run personal-os
```

## Phiên bản hiện tại — v0.1

- Chat văn bản với model chạy local.
- Thêm, chọn, đổi và gỡ model.
- Backend mới có bộ khung Python, chưa có API hoặc database.

**Tech stack:** Flutter, Dart, Riverpod, go_router, llama.cpp qua FFI và model GGUF.

Theo dõi nội dung và thay đổi của từng phiên bản tại [Versions](docs/VERSIONS.md).
