import 'dart:math';

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

  static String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
