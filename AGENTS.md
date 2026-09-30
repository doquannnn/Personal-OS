# Hướng dẫn Repository

## Ngôn ngữ và cấu trúc

Toàn bộ mã nguồn, tài liệu, tên hiển thị và trao đổi trong repository dùng tiếng Việt, trừ tên kỹ thuật, API và từ khóa của ngôn ngữ. `README.md` giới thiệu sản phẩm; `docs/VERSIONS.md` quản lý phạm vi phiên bản. Frontend Flutter/Dart đặt trong `frontend/` khi được thêm. Backend Python đặt trong `backend/`, với mã nguồn tại `backend/src/` và test tại `backend/tests/`.

## Dependency và môi trường cô lập

Không cài hoặc chạy dependency toàn cục. Mỗi ngôn ngữ phải khai báo dependency trong manifest được commit:

Mặc định thực hiện theo từng bước: chỉ chạy lệnh tiếp theo khi người dùng đã duyệt kết quả của lệnh trước. Chỉ chạy liên tiếp toàn bộ các lệnh khi người dùng nói rõ không cần duyệt từng lệnh.

- Python: `pyproject.toml` là nguồn chính; `requirements.txt` là danh sách tương thích khi cần cài bằng pip.
- Flutter/Dart: `pubspec.yaml` là nguồn chính; không sửa `pubspec.lock` thủ công.

Với Python, dùng `uv` để tạo và quản lý `backend/.venv`. Chạy các lệnh Python từ thư mục `backend/`. Trước khi chạy, đồng bộ môi trường bằng `uv sync`; luôn chạy lệnh qua `uv run`, ví dụ `uv run python -m pytest`. Không gọi `python`, `pip` hoặc `pytest` trực tiếp bên ngoài môi trường này.

Với Flutter/Dart, chạy `flutter pub get` sau khi đổi `pubspec.yaml`, rồi dùng `flutter run`, `flutter analyze` hoặc `flutter test`. Chỉ dùng package đã khai báo trong `pubspec.yaml`.

## Quy ước mã và kiểm thử

Định dạng Dart bằng `dart format`; dùng `snake_case.dart`, `PascalCase` cho kiểu và `camelCase` cho biến, hàm, provider. Giữ nghiệp vụ độc lập với model provider và nền tảng; bọc FFI/native API sau adapter nhỏ. Đặt test Dart tại `test/` với tên `<tinh_nang>_test.dart`; thêm test cho hành vi mới.

## Commit và an toàn

Viết commit ngắn theo dạng `feat(chat): stream local responses` hoặc `docs: cap nhat pham vi v0.1`. PR nêu phạm vi, kiểm tra đã chạy và ảnh chụp nếu đổi giao diện. Không commit `.venv/`, `.dart_tool/`, model GGUF, token, đường dẫn riêng tư hay cấu hình theo máy.
