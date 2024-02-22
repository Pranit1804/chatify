import 'package:flutter/material.dart';

@immutable
class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  const CustomColorTheme({
    this.homeBackground,
    this.primaryButtonColor,
    this.reverseTextColor,
    this.icon1,
  });

  final Color? homeBackground;
  final Color? primaryButtonColor;
  final Color? reverseTextColor;
  final Color? icon1;

  @override
  CustomColorTheme copyWith({
    Color? homeBackground,
    Color? primaryButtonColor,
    Color? reverseTextColor,
    Color? icon1,
  }) {
    return CustomColorTheme(
      homeBackground: homeBackground,
      primaryButtonColor: primaryButtonColor,
      reverseTextColor: reverseTextColor,
      icon1: icon1,
    );
  }

  @override
  CustomColorTheme lerp(ThemeExtension<CustomColorTheme>? other, double t) {
    if (other is! CustomColorTheme) {
      return this;
    }
    return CustomColorTheme(
      homeBackground: Color.lerp(homeBackground, other.homeBackground, t),
      primaryButtonColor:
          Color.lerp(primaryButtonColor, other.primaryButtonColor, t),
      reverseTextColor: Color.lerp(reverseTextColor, other.reverseTextColor, t),
      icon1: Color.lerp(icon1, other.icon1, t),
    );
  }
}
