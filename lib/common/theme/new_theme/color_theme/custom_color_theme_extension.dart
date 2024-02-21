import 'package:flutter/material.dart';

@immutable
class CustomColorTheme extends ThemeExtension<CustomColorTheme> {
  const CustomColorTheme({
    //home
    this.homeBackground,
  });

  final Color? homeBackground;

  @override
  CustomColorTheme copyWith({
    Color? homeBackground,
  }) {
    return CustomColorTheme(
      homeBackground: homeBackground,
    );
  }

  @override
  CustomColorTheme lerp(ThemeExtension<CustomColorTheme>? other, double t) {
    if (other is! CustomColorTheme) {
      return this;
    }
    return CustomColorTheme(
      homeBackground: Color.lerp(homeBackground, other.homeBackground, t),
    );
  }
}
