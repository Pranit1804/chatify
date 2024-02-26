import 'package:chatify/modules/auth/domain/entities/user_entity.dart';
import 'package:chatify/modules/chat/presentation/pages/chat.dart';
import 'package:chatify/routes/routes_constant.dart';
import 'package:flutter/material.dart';

abstract class ChatRoutes {
  static Map<String, WidgetBuilder> all() => {};

  static Map<String, WidgetBuilder> getRoutesWithSettings(
          RouteSettings settings) =>
      {
        RoutesConstants.chat: (context) {
          final friend = settings.arguments as UserEntity;
          return Chat(
            friend: friend,
          );
        },
      };
}
