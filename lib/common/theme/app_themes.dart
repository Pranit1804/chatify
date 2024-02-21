// import 'package:flutter/material.dart';

// import '../../common/constants/layout_constants.dart';
// import 'app_color.dart';
// import 'text_theme.dart';

// abstract class AppTheme {
//   AppTheme._();

//   static ThemeData defaultTheme() => ThemeData(
//         primaryColor: AppColor.black,
//         toggleableActiveColor: AppColor.black,
//         scaffoldBackgroundColor: AppColor.black,
//         unselectedWidgetColor: AppColor.white,
//         canvasColor: AppColor.black,
//         colorScheme: const ColorScheme.light(
//           primary: AppColor.black,
//           onPrimary: AppColor.black,
//           brightness: Brightness.dark,
//         ),
//         appBarTheme: const AppBarTheme(
//           color: AppColor.black,
//           elevation: LayoutConstants.dimen_0,
//           iconTheme: IconThemeData(
//             color: AppColor.white,
//             size: LayoutConstants.dimen_24,
//           ),
//           actionsIconTheme: IconThemeData(
//             color: AppColor.black,
//           ),
//         ),
//         fontFamily: AppTextTheme.defaultFontFamily,
//         primaryTextTheme: DarkTheme(),//AppTextTheme.textTheme(),
//         textTheme: DarkTheme(),//AppTextTheme.textTheme(),
//         snackBarTheme: SnackBarThemeData(
//           backgroundColor: AppColor.white,
//           actionTextColor: AppColor.black,
//           disabledActionTextColor: AppColor.disabledText,
//           contentTextStyle: AppTextTheme.textTheme().subtitle1,
//           elevation: LayoutConstants.dimen_0,
//           behavior: SnackBarBehavior.fixed,
//         ),
//         textSelectionTheme: const TextSelectionThemeData(
//           cursorColor: AppColor.white,
//         ),
//       );

//   static ThemeData lightTheme() => ThemeData(
//         primaryColor: AppColor.black,
//         toggleableActiveColor: AppColor.black,
//         scaffoldBackgroundColor: AppColor.black,
//         unselectedWidgetColor: AppColor.white,
//         canvasColor: AppColor.black,
//         iconTheme: const IconThemeData(color: AppColor.black),
//         colorScheme: const ColorScheme.dark(
//           primary: AppColor.white,
//           onPrimary: AppColor.white,
//           brightness: Brightness.light,
//         ),
//         appBarTheme: const AppBarTheme(
//           color: AppColor.black,
//           elevation: LayoutConstants.dimen_0,
//           iconTheme: IconThemeData(
//             color: AppColor.black,
//             size: LayoutConstants.dimen_24,
//           ),
//           actionsIconTheme: IconThemeData(
//             color: AppColor.black,
//           ),
//         ),
//         fontFamily: AppTextTheme.defaultFontFamily,
//         primaryTextTheme: LightTheme(),//AppTextTheme.textTheme(),
//         textTheme: LightTheme(),//AppTextTheme.textTheme(),
//         snackBarTheme: SnackBarThemeData(
//           backgroundColor: AppColor.white,
//           actionTextColor: AppColor.black,
//           disabledActionTextColor: AppColor.disabledText,
//           contentTextStyle: AppTextTheme.textTheme().subtitle1,
//           elevation: LayoutConstants.dimen_0,
//           behavior: SnackBarBehavior.fixed,
//         ),
//         textSelectionTheme: const TextSelectionThemeData(
//           cursorColor: AppColor.white,
//         ),
//       );
// }
