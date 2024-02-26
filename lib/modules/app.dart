import 'package:chatify/common/constants/app_constants.dart';
import 'package:chatify/common/global_state_manager/app_bloc_listeners.dart';
import 'package:chatify/common/global_state_manager/app_bloc_provider.dart';
import 'package:chatify/common/theme/new_theme/color_theme/mode_color_themes.dart';
import 'package:chatify/common/theme/new_theme/text_theme/mode_text_themes.dart';
import 'package:chatify/common/utils/app_utils.dart';
import 'package:chatify/common/utils/screen_size.dart';
import 'package:chatify/common/utils/screen_utils.dart';
import 'package:chatify/global_navigator.dart';
import 'package:chatify/routes/routes.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:chatify/widgets/no_scroll_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: mtAppGlobalKey);
  static GlobalKey<_AppState> mtAppKey = GlobalKey();
  static GlobalKey<_AppState> mtAppGlobalKey = GlobalKey();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ThemeMode _themeMode = ThemeMode.light;
  final GlobalKey<NavigatorState> _navigatorStateGlobalKey =
      GlobalNavigator.navigatorStateGlobalKey;

  @override
  void initState() {
    super.initState();
    _themeMode = AppUtils.getAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        ScreenUtils.init(context, navigator: _navigatorStateGlobalKey);
        ScreenSize.init();
        return getApp();
      },
    );
  }

  changeThemeMode(ThemeMode newTheme) {
    setState(() {
      _themeMode = newTheme;
    });
  }

  ThemeMode getThemeMode() {
    return _themeMode;
  }

  MaterialApp getApp() {
    return MaterialApp(
      key: App.mtAppKey,
      navigatorKey: _navigatorStateGlobalKey,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: _appBuilder(context, child!),
        );
      },
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          lightTextThemeExtension,
          lightColorThemeExtension
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          darkTextThemeExtension,
          darkColorThemeExtension
        ],
      ),
      themeMode: _themeMode,
      routes: Routes.getAll(),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutesConstants.splashScreen,
    );
  }

  Widget _appBuilder(BuildContext context, Widget widget) {
    final Widget appWidget = MultiBlocProvider(
        providers: getStartupBlocProviders(),
        child: MultiBlocListener(
          listeners: getAppStartupBlocListeners(_navigatorStateGlobalKey),
          child: SafeArea(child: widget),
        ));

    return appWidget;
  }
}
