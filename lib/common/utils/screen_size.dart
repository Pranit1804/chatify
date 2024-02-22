import 'package:chatify/common/constants/app_constants.dart';
import 'package:chatify/common/utils/screen_utils.dart';

class ScreenSize {
  static late bool isSmallScreen;

  static void init() {
    isSmallScreen =
        ScreenUtils.mediaQueryData.size.height < AppConstants.minScreenHeight;
  }
}
