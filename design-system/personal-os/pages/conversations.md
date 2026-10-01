# Override trang — Conversations

## Mục đích

Cho người dùng xem, chọn và bắt đầu hội thoại mà không cạnh tranh sự chú ý với
vùng Chat.

## Layout

- Từ 1024 logical px, hiển thị sidebar cố định bên trái; vùng này không được
  thu hẹp Chat xuống dưới chiều rộng dễ đọc.
- Dưới 1024 logical px, hiển thị cùng nội dung trong drawer và đóng drawer sau
  khi chọn hội thoại.
- Header gồm tên khu vực và action tạo hội thoại mới; danh sách hội thoại là
  vùng cuộn duy nhất của sidebar.

## ConversationTile

- Toàn bộ tile là một control có nhãn semantics từ tiêu đề hội thoại.
- Trạng thái selected dùng `conversationSelected`, đồng thời có chỉ báo không
  chỉ dựa vào màu.
- Hover chỉ tăng phản hồi thị giác trên desktop; focus keyboard luôn rõ hơn
  hover.
- Tiêu đề quá dài được cắt có chủ đích và vẫn có đường truy cập tên đầy đủ qua
  tooltip hoặc semantics.
- Empty state hướng dẫn tạo hội thoại đầu tiên; không dùng minh hoạ trang trí
  làm thay thế cho nội dung hướng dẫn.
