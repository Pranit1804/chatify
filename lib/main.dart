import 'package:chatify/di/injector_config.dart';
import 'package:chatify/modules/app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'local_database/object_box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);

  InjectorConfig.setUp();
  await ObjectBox.create();
  runApp(App());
}
