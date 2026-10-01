import 'package:flutter/material.dart';

/// Các màu semantic riêng của Personal OS không có sẵn trong [ColorScheme].
@immutable
class PersonalOsSemanticColors
    extends ThemeExtension<PersonalOsSemanticColors> {
  const PersonalOsSemanticColors({
    required this.assistantMessageSurface,
    required this.userMessageSurface,
    required this.streamingIndicator,
    required this.modelReady,
    required this.modelLoading,
    required this.modelUnavailable,
    required this.success,
    required this.warning,
    required this.info,
    required this.conversationSelected,
    required this.conversationHover,
    required this.focusRing,
  });

  final Color assistantMessageSurface;
  final Color userMessageSurface;
  final Color streamingIndicator;
  final Color modelReady;
  final Color modelLoading;
  final Color modelUnavailable;
  final Color success;
  final Color warning;
  final Color info;
  final Color conversationSelected;
  final Color conversationHover;
  final Color focusRing;

  @override
  PersonalOsSemanticColors copyWith({
    Color? assistantMessageSurface,
    Color? userMessageSurface,
    Color? streamingIndicator,
    Color? modelReady,
    Color? modelLoading,
    Color? modelUnavailable,
    Color? success,
    Color? warning,
    Color? info,
    Color? conversationSelected,
    Color? conversationHover,
    Color? focusRing,
  }) {
    return PersonalOsSemanticColors(
      assistantMessageSurface:
          assistantMessageSurface ?? this.assistantMessageSurface,
      userMessageSurface: userMessageSurface ?? this.userMessageSurface,
      streamingIndicator: streamingIndicator ?? this.streamingIndicator,
      modelReady: modelReady ?? this.modelReady,
      modelLoading: modelLoading ?? this.modelLoading,
      modelUnavailable: modelUnavailable ?? this.modelUnavailable,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      conversationSelected: conversationSelected ?? this.conversationSelected,
      conversationHover: conversationHover ?? this.conversationHover,
      focusRing: focusRing ?? this.focusRing,
    );
  }

  @override
  PersonalOsSemanticColors lerp(
    covariant ThemeExtension<PersonalOsSemanticColors>? other,
    double t,
  ) {
    if (other is! PersonalOsSemanticColors) {
      return this;
    }

    return PersonalOsSemanticColors(
      assistantMessageSurface: Color.lerp(
        assistantMessageSurface,
        other.assistantMessageSurface,
        t,
      )!,
      userMessageSurface: Color.lerp(
        userMessageSurface,
        other.userMessageSurface,
        t,
      )!,
      streamingIndicator: Color.lerp(
        streamingIndicator,
        other.streamingIndicator,
        t,
      )!,
      modelReady: Color.lerp(modelReady, other.modelReady, t)!,
      modelLoading: Color.lerp(modelLoading, other.modelLoading, t)!,
      modelUnavailable: Color.lerp(
        modelUnavailable,
        other.modelUnavailable,
        t,
      )!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      conversationSelected: Color.lerp(
        conversationSelected,
        other.conversationSelected,
        t,
      )!,
      conversationHover: Color.lerp(
        conversationHover,
        other.conversationHover,
        t,
      )!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
    );
  }
}
