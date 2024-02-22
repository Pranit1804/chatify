import 'package:chatify/modules/auth/auth_routes.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static Map<String, WidgetBuilder> getAll() => {
        ...AuthRoutes.all(),
      };

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    WidgetBuilder? builder;
    if (settings.name != null) {
      switch (settings.name) {}
    }
    if (builder != null) {
      return MaterialPageRoute(builder: builder, settings: settings);
    }
    return null;
  }
}
