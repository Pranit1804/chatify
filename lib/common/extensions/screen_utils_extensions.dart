import 'package:chatify/common/utils/screen_utils.dart';

extension ScreenUtilsExtension on num {
  double get w => ScreenUtils().setWidth(this);

  double get h => ScreenUtils().setHeight(this);

  double get lw => ScreenUtils().setLearnWidth(this);

  double get lh => ScreenUtils().setLearnHeight(this);

  double get sp => ScreenUtils().setSp(this);

  double get sw => ScreenUtils().setShareWidth(this);

  double get sh => ScreenUtils().setShareHeight(this);
}
