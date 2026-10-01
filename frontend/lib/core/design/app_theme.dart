import 'package:flutter/material.dart';

import 'app_tokens.dart';
import 'personal_os_semantic_colors.dart';

/// Hiện thực Material 3 của các quyết định trong design system Personal OS.
abstract final class AppTheme {
  static const Color _seedColor = Color(0xFF0A84FF);

  static ThemeData light() => _create(Brightness.light);

  static ThemeData dark() => _create(Brightness.dark);

  static ThemeData _create(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: brightness,
    );
    final isLight = brightness == Brightness.light;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      extensions: <ThemeExtension<dynamic>>[
        _semanticColors(colorScheme, isLight),
      ],
      cardTheme: CardThemeData(
        margin: EdgeInsets.zero,
        color: colorScheme.surfaceContainerLow,
        surfaceTintColor: colorScheme.surfaceTint,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          side: BorderSide(color: colorScheme.outlineVariant),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(44, 44),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.control),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerLow,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        border: _inputBorder(colorScheme.outline),
        enabledBorder: _inputBorder(colorScheme.outline),
        focusedBorder: _inputBorder(colorScheme.primary, width: 2),
        errorBorder: _inputBorder(colorScheme.error),
        focusedErrorBorder: _inputBorder(colorScheme.error, width: 2),
      ),
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.control),
      borderSide: BorderSide(color: color, width: width),
    );
  }

  static PersonalOsSemanticColors _semanticColors(
    ColorScheme colorScheme,
    bool isLight,
  ) {
    return PersonalOsSemanticColors(
      assistantMessageSurface: colorScheme.surfaceContainerHigh,
      userMessageSurface: colorScheme.primaryContainer,
      streamingIndicator: colorScheme.primary,
      modelReady: isLight ? const Color(0xFF0B6E4F) : const Color(0xFF62DDB2),
      modelLoading: colorScheme.primary,
      modelUnavailable: colorScheme.error,
      success: isLight ? const Color(0xFF0B6E4F) : const Color(0xFF62DDB2),
      warning: isLight ? const Color(0xFF8A4B00) : const Color(0xFFFFB95D),
      info: colorScheme.primary,
      conversationSelected: colorScheme.secondaryContainer,
      conversationHover: colorScheme.surfaceContainerHigh,
      focusRing: colorScheme.primary,
    );
  }
}
