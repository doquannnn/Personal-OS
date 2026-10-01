# Override trang — Model Manager

## Mục đích

Quản lý model local theo trạng thái rõ ràng: thêm, chọn model đang dùng và gỡ
model mà không gây nhầm lẫn về thao tác phá huỷ.

## Layout

- Header có action thêm model; danh sách model là nội dung chính.
- Dùng `ModelCard` thay vì bảng dày đặc ở v0.1. Card hiển thị tên, định dạng,
  kích thước khi có dữ liệu và `ModelStatusBadge`.
- Trên cửa sổ rộng, card có thể xếp lưới; trên cửa sổ hẹp, dùng một cột.
- Empty state nói rõ chưa có model và hướng dẫn hành động thêm model.

## Trạng thái và hành động

- `ready`, `loading`, `unavailable` luôn có icon và text, không chỉ màu.
- Chọn model đang dùng là action primary rõ ràng; model đang dùng có chỉ báo
  selected bền vững.
- Thao tác gỡ model dùng destructive action và luôn mở dialog xác nhận. Dialog
  nêu rõ model bị gỡ, có Cancel là focus mặc định, và không để overlay che
  focus keyboard.
- Khi đang thêm, chọn hoặc gỡ model, control liên quan dùng loading/disabled
  state để ngăn thao tác lặp.
