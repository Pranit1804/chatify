import 'package:chatify/di/injector_config.dart';
import 'package:chatify/modules/app.dart';
import 'package:flutter/material.dart';

void main() {
  InjectorConfig.setUp();
  runApp(const App());
}
