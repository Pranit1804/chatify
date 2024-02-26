import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/color_theme/default_color_themes.dart';

CustomColorTheme lightColorThemeExtension = const CustomColorTheme(
  homeBackground: AppColor.linkWater,
  primaryButtonColor: AppColor.lightPrimaryButtonColor,
  reverseTextColor: AppColor.snowDriftText,
  bubbleColor: AppColor.snowDriftText,
  icon1: AppColor.ravenText,
);

CustomColorTheme darkColorThemeExtension = const CustomColorTheme(
  homeBackground: AppColor.cinder,
  primaryButtonColor: AppColor.darkPrimaryButtonColor,
  reverseTextColor: AppColor.ravenText,
  bubbleColor: AppColor.slate,
  icon1: AppColor.snowDriftText,
);
