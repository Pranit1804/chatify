import 'package:flutter/material.dart';

class ScreenUtils {
  static const int defaultWidth = 375;
  static const int defaultHeight = 667;

  /// for learn page
  static const int defaultLearnScreenWidth = 360;
  static const int defaultLearnScreenHeight = 774;

  /// for share screen
  static const int defaultShareScreenWidth = 360;
  static const int defaultShareScreenHeight = 771;

  static late ScreenUtils _instance;

  /// UI Design phone size in px
  late num uiWidthPx;
  late num uiHeightPx;
  late num uiLearnWidthPx;
  late num uiLearnHeightPx;
  late num uiShareWidthPx;
  late num uiShareHeightPx;
  late BuildContext rootContext;
  late GlobalKey<NavigatorState>? navigator;

  /// allowFontScaling specifies whether fonts should scale
  /// to respect the Text Size accessibility settings. The default is false.
  late bool allowFontScaling;

  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;

  ScreenUtils._();

  factory ScreenUtils() {
    return _instance;
  }

  static void init(
    BuildContext context, {
    num width = defaultWidth,
    num height = defaultHeight,
    num learnWidth = defaultLearnScreenWidth,
    num learnHeight = defaultLearnScreenHeight,
    bool allowFontScaling = false,
    num shareWidth = defaultShareScreenWidth,
    num shareHeight = defaultShareScreenHeight,
    GlobalKey<NavigatorState>? navigator,
  }) {
    _instance = ScreenUtils._();
    _instance.uiWidthPx = width;
    _instance.uiHeightPx = height;
    _instance.uiLearnWidthPx = learnWidth;
    _instance.uiLearnHeightPx = learnHeight;
    _instance.allowFontScaling = allowFontScaling;
    _instance.rootContext = context;
    _instance.navigator = navigator;
    _instance.uiShareWidthPx = shareWidth;
    _instance.uiShareHeightPx = shareHeight;

    try {
      final mediaQuery = MediaQuery.of(context);
      _mediaQueryData = mediaQuery;
      _pixelRatio = mediaQuery.devicePixelRatio;
      _screenWidth = mediaQuery.size.width;
      _screenHeight = mediaQuery.size.height;
      _statusBarHeight = mediaQuery.padding.top;
      _bottomBarHeight = _mediaQueryData.padding.bottom;
      _textScaleFactor = mediaQuery.textScaleFactor;
    } catch (_) {
      _pixelRatio = 0;
      _screenWidth = 0;
      _screenHeight = 0;
      _statusBarHeight = 0;
      _bottomBarHeight = 0;
      _textScaleFactor = 0;
    }
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  /// The number of font pixels for each logical pixel.
  static double get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size in dp
  static double get screenWidthDp => _screenWidth;

  ///The vertical extent of this size in dp
  static double get screenHeightDp => _screenHeight;

  /// The vertical extent of this size in px
  static double get screenWidth => _screenWidth * _pixelRatio;

  /// The vertical extent of this size in px
  static double get screenHeight => _screenHeight * _pixelRatio;

  /// The status bar offset from the top
  static double get statusBarHeight => _statusBarHeight;

  /// The OS specific action buttons bar offset from the bottom.
  static double get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => _screenWidth / uiWidthPx;

  /// The ratio of the actual dp to the design draft px
  double get scaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiHeightPx;

  /// The ratio of the actual dp to the learn page design draft px
  double get learnScaleWidth =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiLearnWidthPx;

  /// The ratio of the actual dp to the learn page design draft px
  double get learnScaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiLearnHeightPx;

  /// The ratio of the actual dp to the share page design draft px
  double get shareScaleWidth =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiShareWidthPx;

  /// The ratio of the actual dp to the share page design draft px
  double get shareScaleHeight =>
      (_screenHeight - _statusBarHeight - _bottomBarHeight) / uiShareHeightPx;

  double setShareHeight(num height) => height * shareScaleHeight;
  double setShareWidth(num width) => width * shareScaleWidth;

  double get scaleText => scaleWidth;

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to
  /// achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect,
  ///  or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  /// This should be used for learn page UI instead of the
  /// usual one as per the Design.
  double setLearnHeight(num height) => height * learnScaleHeight;
  double setLearnWidth(num height) => height * learnScaleWidth;

  ///Font size adaptation method
  double setSp(num fontSize, {bool allowFontScalingSelf = false}) =>
      (allowFontScaling || (allowFontScalingSelf))
          ? (fontSize * scaleText)
          : (fontSize * scaleText) / _textScaleFactor;
}
