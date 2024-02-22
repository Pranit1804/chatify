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
    Future.delayed(const Duration(milliseconds: 400), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        getInitialRoute(),
        (_) => false,
      );
    });
  }

  String getInitialRoute() {
    return RoutesConstants.login;
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chatify'),
    );
  }
}
