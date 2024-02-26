import 'package:chatify/modules/auth/auth_routes.dart';
import 'package:chatify/modules/chat/chat_routes.dart';
import 'package:chatify/modules/home/home_routes.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        ...AuthRoutes.all(),
        ...HomeRoutes.all(),
      };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    WidgetBuilder? builder;
    if (settings.name != null) {
      switch (settings.name) {
        case RoutesConstants.chat:
          builder = ChatRoutes.getRoutesWithSettings(settings)[settings.name];
          break;
      }
    }
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return null;
  }
}
