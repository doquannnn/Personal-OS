# Frontend Personal OS

Frontend Flutter/Dart của Personal OS, phát triển cho Linux, Windows và macOS.
Flutter `3.47.2` được pin trong `.fvmrc`; FVM, Flutter SDK và cache đều nằm
cục bộ trong `.tools/`, không cần cài Flutter, Dart hoặc FVM vào PATH của máy.

## Thiết lập

Trên Linux hoặc macOS:

```bash
bash scripts/bootstrap-fvm.sh
./scripts/fvm.sh flutter pub get
```

Trên Windows PowerShell:

```powershell
.\scripts\bootstrap-fvm.ps1
.\scripts\fvm.ps1 flutter pub get
```

Trong IDE, chọn Flutter SDK tại `.fvm/flutter_sdk` sau khi FVM đã thiết lập
project. Không chọn SDK trong cache `.tools/` trực tiếp.

## Chạy và kiểm tra

Trên Linux, chạy ứng dụng mẫu bằng:

```bash
./scripts/fvm.sh flutter run -d linux
```

Quality runner luôn đồng bộ dependency trước khi kiểm tra định dạng, analyzer
và test. Ở chế độ mặc định, nó yêu cầu xác nhận giữa các bước:

```bash
./scripts/fvm.sh dart tool/check.dart
```

Trong CI hoặc khi đã chấp thuận chạy liên tiếp:

```bash
./scripts/fvm.sh dart tool/check.dart --all
```

Khi cần Dart tự định dạng mã nguồn trước khi kiểm tra, dùng `--fix` rồi xem lại
diff:

```bash
./scripts/fvm.sh dart tool/check.dart --fix
```

Chỉ kết hợp `--all --fix` khi muốn cho phép sửa và kiểm tra liên tiếp.

`flutter doctor` trên Linux có thể báo Android SDK thiếu; điều đó không ảnh
hưởng đến phạm vi desktop hiện tại.
