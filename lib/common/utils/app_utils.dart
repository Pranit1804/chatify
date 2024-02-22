import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppUtils {
  static ThemeMode getAppTheme() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    return _getThemeFromBrightness(brightness);
  }

  static ThemeMode _getThemeFromBrightness(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
