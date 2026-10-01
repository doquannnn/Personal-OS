import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_os/core/design/app_theme.dart';
import 'package:personal_os/core/design/app_tokens.dart';
import 'package:personal_os/core/design/personal_os_semantic_colors.dart';
import 'package:personal_os/main.dart';

void main() {
  test('theme light và dark có semantic color riêng của Personal OS', () {
    final lightTheme = AppTheme.light();
    final darkTheme = AppTheme.dark();

    expect(lightTheme.brightness, Brightness.light);
    expect(darkTheme.brightness, Brightness.dark);
    expect(lightTheme.extension<PersonalOsSemanticColors>(), isNotNull);
    expect(darkTheme.extension<PersonalOsSemanticColors>(), isNotNull);
  });

  test('primitive token tuân theo nhịp 4/8dp và motion chung', () {
    expect(AppSpacing.xxs, 4);
    expect(AppSpacing.xs, 8);
    expect(AppSpacing.md, 16);
    expect(AppMotion.press, const Duration(milliseconds: 120));
    expect(AppMotion.feedback, const Duration(milliseconds: 180));
    expect(AppMotion.transition, const Duration(milliseconds: 240));
  });

  testWidgets('app root dùng theme hệ thống', (WidgetTester tester) async {
    await tester.pumpWidget(const PersonalOsApp());

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));

    expect(app.title, 'Personal OS');
    expect(app.themeMode, ThemeMode.system);
    expect(app.darkTheme, isNotNull);
  });
}
