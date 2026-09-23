# Product Versions

Mỗi phiên bản bổ sung một phần nhỏ, có thể sử dụng được và không làm phức tạp sản phẩm quá sớm.

## v0.1 — Local Chat

**Mục tiêu:** tạo được trải nghiệm chatbot cơ bản với model chạy trực tiếp trên thiết bị.

**Có trong phiên bản này**

- UI gồm Conversations, Chat và Model Manager.
- Chat văn bản và nhận phản hồi streaming.
- Thêm model từ file, chọn model đang dùng và gỡ model.
- Trạng thái hội thoại chỉ giữ trong bộ nhớ khi ứng dụng đang chạy.

**Tech stack**

- Flutter + Dart: giao diện cross-platform.
- Riverpod: quản lý trạng thái trong bộ nhớ.
- go_router: điều hướng.
- llama.cpp qua Dart FFI: chạy model local.
- GGUF + JSON manifest: file model và thông tin model.

**Chưa có:** database, backend, tài khoản, đồng bộ, voice và các tính năng native như Live Activity.

---

## Cách cập nhật phiên bản tiếp theo

Mỗi phiên bản mới chỉ cần thêm một mục theo mẫu:

```md
## v0.x — Tên phiên bản

**Mục tiêu:** phiên bản này giải quyết điều gì.

**Thay đổi:** tính năng được thêm hoặc điều chỉnh.

**Tech stack:** công nghệ mới được bổ sung hoặc thay thế.
```
