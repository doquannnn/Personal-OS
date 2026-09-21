# Personal OS

Personal OS là ứng dụng native cho iOS và Android, sử dụng React Native ở phía mobile và Python cho backend cùng các tính năng AI.

## Giai đoạn hiện tại

Dự án sẽ ưu tiên xây dựng **Financial Module** trước. Đây là module đầu tiên làm nền tảng cho việc quản lý, phân tích và phát triển các tính năng tài chính cá nhân trong Personal OS.

Các module khác sẽ được lên kế hoạch và triển khai sau khi nền tảng của Financial Module đã ổn định.

## Kiến trúc đề xuất

```text
React Native app (iOS + Android)
          │ HTTPS / WebSocket
          ▼
Python API (FastAPI)
          │
          ├── AI frameworks / agents
          ├── Model inference
          ├── Database
          └── Background jobs
```

## Công nghệ

- **Mobile:** React Native, Expo và TypeScript
- **Navigation:** Expo Router
- **Backend:** Python và FastAPI
- **AI:** Các thư viện Python phù hợp với từng tính năng
- **Realtime:** WebSocket hoặc Server-Sent Events
- **API schema:** OpenAPI, dùng để sinh TypeScript client cho mobile

Nên sử dụng **Expo Development Build** thay vì chỉ dựa vào Expo Go nếu ứng dụng cần native AI SDK, Bluetooth, background service hoặc module Swift/Kotlin tùy chỉnh.

## Nguyên tắc tích hợp AI

- Phần lớn framework Python không chạy trực tiếp bên trong React Native. Mobile app nên giao tiếp với Python backend qua HTTPS hoặc WebSocket.
- Các mô hình lớn, tác vụ kéo dài hoặc workload cần GPU nên chạy trên server.
- Nếu cần AI offline hoặc on-device, có thể xuất mô hình sang Core ML, TensorFlow Lite hoặc ONNX và tích hợp qua native module cho React Native.
- Không nhúng API key của OpenAI hoặc các dịch vụ AI khác vào mobile app. Mọi khóa bí mật phải được giữ ở backend.

## Cấu trúc monorepo dự kiến

```text
Personal-OS/
├── apps/
│   └── mobile/
├── services/
│   └── api/
├── packages/
│   └── shared/
├── models/
└── docs/
```

React Native kết hợp với Python là hướng phù hợp cho dự án này: React Native cung cấp một codebase chung cho iOS và Android, còn Python đảm nhiệm backend, AI và xử lý dữ liệu. Swift/Kotlin thuần chỉ nên được cân nhắc khi ứng dụng phụ thuộc sâu vào API hệ điều hành hoặc cần xử lý AI nặng hoàn toàn trên thiết bị.
