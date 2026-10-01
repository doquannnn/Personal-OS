# Override trang — Chat

## Mục đích

Chat là vùng nội dung chính: đọc phản hồi streaming, nhập câu hỏi và nhận biết
trạng thái model mà không làm nhiễu hội thoại.

## Layout

- Header chỉ hiển thị ngữ cảnh hội thoại và model khi cần; không biến thành
  thanh công cụ dày đặc.
- Danh sách message chiếm không gian co giãn, có inset ở đáy để không bị
  ChatComposer che nội dung cuối.
- ChatComposer được ghim ở đáy vùng Chat, tôn trọng safe area và keyboard
  focus; action gửi luôn có nhãn semantics.

## Message và streaming

- Tin nhắn người dùng và trợ lý dùng variant `user`/`assistant` của
  `ChatBubble`, khác nhau bằng surface và alignment nhưng giữ cùng hierarchy
  chữ.
- Streaming dùng `streamingIndicator` cùng mô tả bằng chữ cho screen reader;
  chuyển động phải giảm khi `disableAnimations` được bật.
- Lỗi phản hồi có message rõ ràng, action thử lại nếu hành vi đó được feature
  hỗ trợ; không chỉ đổi sang màu lỗi.
- Danh sách chỉ tự cuộn khi người dùng đang ở gần cuối. Nếu người dùng đã cuộn
  để đọc lịch sử, hiển thị action quay về phản hồi mới thay vì ép cuộn.

## Khả năng truy cập

- Nội dung message được chọn và sao chép được.
- Focus không bị che bởi composer; keyboard luôn truy cập được composer và các
  action liên quan.
- Text scale lớn phải làm bubble tăng chiều cao, không cắt nội dung hoặc badge.
