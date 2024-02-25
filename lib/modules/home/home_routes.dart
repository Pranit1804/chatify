import 'package:chatify/modules/home/presentation/pages/home.dart';
import 'package:chatify/modules/home/presentation/pages/share_invite_screen.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:flutter/material.dart';

abstract class HomeRoutes {
  static Map<String, WidgetBuilder> all() => {
        RoutesConstants.home: (context) => const Home(),
        RoutesConstants.shareInviteScreen: (context) => const ShareInvite(),
      };

  static Map<String, WidgetBuilder> getRoutesWithSettings(
          RouteSettings settings) =>
      {};
}
