/// Các giá trị primitive dùng chung trong giao diện Personal OS.
abstract final class AppSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

abstract final class AppRadius {
  static const double control = 8;
  static const double card = 12;
  static const double dialog = 16;
  static const double pill = 999;
}

abstract final class AppIconSize {
  static const double sm = 16;
  static const double md = 20;
  static const double lg = 24;
}

abstract final class AppMotion {
  static const Duration press = Duration(milliseconds: 120);
  static const Duration feedback = Duration(milliseconds: 180);
  static const Duration transition = Duration(milliseconds: 240);
}
