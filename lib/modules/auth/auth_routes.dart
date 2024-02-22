import 'package:chatify/modules/auth/presentation/pages/login.dart';
import 'package:chatify/modules/auth/presentation/pages/sign_up.dart';
import 'package:chatify/modules/launch/onboarding.dart';
import 'package:chatify/modules/launch/splash_screen.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:flutter/material.dart';

abstract class AuthRoutes {
  static Map<String, WidgetBuilder> all() => {
        RoutesConstants.splashScreen: (context) => const SplashScreen(),
        RoutesConstants.login: (context) => const Login(),
        RoutesConstants.onboarding: (context) => const Onboarding(),
        RoutesConstants.signUp: (context) => const SignUp(),
      };

  static Map<String, WidgetBuilder> getRoutesWithSettings(
          RouteSettings settings) =>
      {};
}
