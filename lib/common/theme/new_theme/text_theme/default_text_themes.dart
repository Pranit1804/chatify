import 'package:chatify/common/extensions/screen_utils_extensions.dart';
import 'package:flutter/material.dart';

abstract class NewAppTextTheme {
  NewAppTextTheme._();

  static const String defaultFontFamily = 'RedHatText';
  static const String barlowCondensed = 'BarlowCondensed';
  static const String nexa = 'Nexa Bold';

  static final TextStyle displaySuper = TextStyle(
    fontSize: 96.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayLabel = TextStyle(
    fontSize: 60.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display3XLSB = TextStyle(
    fontSize: 44.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display3XLR = TextStyle(
    fontSize: 44.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display2XLSB = TextStyle(
    fontSize: 36.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display2XLR = TextStyle(
    fontSize: 36.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayXLSB = TextStyle(
    fontSize: 32.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayXLR = TextStyle(
    fontSize: 32.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayLSB = TextStyle(
    fontSize: 26.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayLR = TextStyle(
    fontSize: 26.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayMSB = TextStyle(
    fontSize: 22.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayMR = TextStyle(
    fontSize: 22.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displaySSB = TextStyle(
    fontSize: 20.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displaySR = TextStyle(
    fontSize: 20.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayXSSB = TextStyle(
    fontSize: 16.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle displayXSR = TextStyle(
    fontSize: 16.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display2XSSB = TextStyle(
    fontSize: 14.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display2XSR = TextStyle(
    fontSize: 14.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display3XSSB = TextStyle(
    fontSize: 12.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle display3XSR = TextStyle(
    fontSize: 12.sp,
    fontFamily: NewAppTextTheme.barlowCondensed,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
  );

  static final TextStyle summary = TextStyle(
    fontSize: 46.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle heading1 = TextStyle(
    fontSize: 28.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle heading2r = TextStyle(
    fontSize: 20.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle heading2m = TextStyle(
    fontSize: 20.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle heading2b = TextStyle(
    fontSize: 20.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodyXLr = TextStyle(
    fontSize: 18.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyXLm = TextStyle(
    fontSize: 18.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyXLb = TextStyle(
    fontSize: 18.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodyLr = TextStyle(
    fontSize: 16.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyLm = TextStyle(
    fontSize: 16.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyLb = TextStyle(
    fontSize: 16.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodyMr = TextStyle(
    fontSize: 14.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyMm = TextStyle(
    fontSize: 14.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodyMb = TextStyle(
    fontSize: 14.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodySr = TextStyle(
    fontSize: 12.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodySm = TextStyle(
    fontSize: 12.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle bodySb = TextStyle(
    fontSize: 12.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle bodyXSr = TextStyle(
    fontSize: 10.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle bodyXSm = TextStyle(
    fontSize: 10.sp,
    fontFamily: NewAppTextTheme.defaultFontFamily,
    fontWeight: FontWeight.w600,
  );
}
