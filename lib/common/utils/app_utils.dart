import 'dart:math';

import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
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
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  static String getConversationID(UserEntity user, String id) =>
      user.userId.hashCode <= id.hashCode
          ? '${user.userId}_$id'
          : '${id}_${user.userId}';
}
