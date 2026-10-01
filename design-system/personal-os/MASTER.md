# Design system — Personal OS

## Mục đích và phạm vi

Đây là nguồn quyết định giao diện chung cho Personal OS v0.1. Ứng dụng là
chatbot AI chạy local trên Linux, Windows và macOS; nội dung hội thoại phải là
trọng tâm, còn giao diện giữ tối giản, bình tĩnh và đáng tin cậy.

Tài liệu này quyết định ý nghĩa của token. Mã Dart trong
`frontend/lib/core/design/` hiện thực các token đó qua Material 3. Widget và
feature không tự đặt màu, khoảng cách, kiểu chữ hoặc trạng thái tương tác.

## Cách dùng và độ ưu tiên

Khi xây hoặc sửa một màn hình:

1. Đọc tài liệu này.
2. Kiểm tra `pages/<ten-trang>.md`. Nếu tồn tại, chỉ quy tắc trong file đó
   được ưu tiên hơn Master.
3. Nếu cần quy tắc lặp lại ở từ hai nơi trở lên, cập nhật Master và token Dart
   trước khi dùng trong màn hình.
4. Nếu chỉ là khác biệt riêng của một trang, thêm vào page override thay vì
   sửa token chung.

Không dùng `--force` khi sinh lại design system. Mọi thay đổi Master đều phải
được xem xét như thay đổi API nội bộ của giao diện.

## Hướng thị giác

| Chủ đề | Quyết định |
|---|---|
| Phong cách | AI-native tối giản: ít chrome, hierarchy rõ, streaming có phản hồi nhẹ |
| Tránh | Landing page, gradient “AI”, hiệu ứng nặng, bảng màu tím/cyan mang tính trang trí |
| Theme | Theo hệ thống: light và dark phải cùng mức chất lượng |
| Màu hạt giống | `#0A84FF`; chỉ dùng để sinh `ColorScheme`, không dùng trực tiếp trong feature |
| Chữ | Material `TextTheme` và font hệ thống; không tải font hoặc thêm package chỉ vì trang trí |
| Biểu tượng | Material vector icons, cùng phong cách outline; không dùng emoji làm icon cấu trúc |

## Token nền tảng

### Primitive

| Nhóm | Giá trị |
|---|---|
| Spacing | 4, 8, 12, 16, 24, 32, 48 logical px |
| Radius | 8: control; 12: card; 16: dialog/chat bubble; 999: pill |
| Icon | 16, 20, 24 logical px |
| Motion | 120 ms: press; 180 ms: màu/opacity; 240 ms: chuyển cảnh |
| Elevation | Dùng M3 surface tint/elevation; không tự tạo shadow trong feature |

### Semantic

`ColorScheme` là nguồn chuẩn cho `primary`, `onPrimary`, `surface`,
`onSurface`, `surfaceContainer`, `outline`, `error` và các vai trò Material
khác. `ThemeExtension` chỉ bổ sung semantic không có sẵn trong Material:

| Token | Ý nghĩa |
|---|---|
| `assistantMessageSurface` | Bề mặt phản hồi của trợ lý |
| `userMessageSurface` | Bề mặt tin nhắn người dùng |
| `streamingIndicator` | Chỉ báo phản hồi đang được sinh |
| `modelReady`, `modelLoading`, `modelUnavailable` | Trạng thái model, luôn đi kèm chữ hoặc icon |
| `success`, `warning`, `info` | Trạng thái bổ sung, không thay thế `error` của Material |
| `conversationSelected`, `conversationHover`, `focusRing` | Trạng thái điều hướng và focus |

Tất cả màu semantic phải đạt tương phản tối thiểu 4.5:1 với chữ thường và
3:1 với viền, focus indicator hoặc control không phải chữ, ở cả light/dark.

### Component

| Component | Token/Theme áp dụng | Variant cần có |
|---|---|---|
| Button và icon button | Material button themes, focus ring, kích thước icon | primary, secondary, tonal/ghost, destructive khi cần |
| Input và ChatComposer | `InputDecorationTheme`, surface, outline, error | default, focus, disabled, error, loading |
| Card và ModelCard | Card theme, padding, radius, outline | default, interactive, selected |
| Dialog xác nhận | Dialog theme, scrim, focus order | default, destructive confirmation |
| ConversationTile | selected/hover/focus semantic | default, hover, focus, selected |
| ChatBubble | message surfaces và typography semantic | user, assistant, streaming, error |
| ModelStatusBadge | status semantic và icon/text | ready, loading, unavailable |

Thứ tự ưu tiên trạng thái tương tác là: disabled, loading, pressed, focus,
hover, default. Không làm thay đổi kích thước/bố cục khi phản hồi nhấn.

## Layout và responsive

| Kích thước cửa sổ | Điều hướng | Nội dung |
|---|---|---|
| Nhỏ hơn 1024 logical px | Conversations ở drawer | Chat chiếm vùng chính |
| Từ 1024 logical px | Sidebar Conversations cố định | Chat là vùng co giãn ưu tiên |

Dùng `LayoutBuilder`, không dùng chiều rộng cố định. Giữ gutter, thứ bậc
spacing và giới hạn độ rộng nội dung đọc dài trên cửa sổ lớn. Scrollable phải
có inset để không bị che bởi header, composer hoặc overlay.

## Accessibility và interaction

- Focus keyboard phải luôn nhìn thấy, kể cả bên trong dialog; overlay không
  được che phần tử đang focus.
- Icon-only control có `tooltip` và nhãn semantics; icon trang trí cạnh chữ
  không được lặp lại nghĩa với screen reader.
- Không dùng màu làm tín hiệu duy nhất; trạng thái model, lỗi và streaming có
  text hoặc icon bổ sung.
- Mọi control có pressed feedback; kích thước hit target tối thiểu 44 logical
  px khi áp dụng được.
- `MediaQuery.disableAnimations` phải giảm hoặc bỏ motion không cần thiết.
- Text scale lớn không cắt text, badge hoặc chip; thứ tự focus khớp thứ tự
  thị giác.

## Quy ước page override

Các page override đầu tiên là `conversations.md`, `chat.md` và
`model-manager.md`. Mỗi file chỉ được mô tả layout, hierarchy, component
variant hoặc ngoại lệ riêng của trang. Không sao chép token từ Master và
không tạo primitive mới trong page override.
