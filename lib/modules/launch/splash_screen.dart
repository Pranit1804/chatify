import 'package:chatify/common/theme/new_theme/color_theme/custom_color_theme_extension.dart';
import 'package:chatify/common/theme/new_theme/text_theme/custom_text_theme_extension.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // _setUp();
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        getInitialRoute(),
        (_) => false,
      );
    });
  }

  String getInitialRoute() {
    return RoutesConstants.onboarding;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).extension<CustomColorTheme>()!.homeBackground,
      body: Center(
        child: Text(
          'Chatify',
          style: Theme.of(context).extension<CustomTextTheme>()!.display2XLR,
        ),
      ),
    );
  }
}
