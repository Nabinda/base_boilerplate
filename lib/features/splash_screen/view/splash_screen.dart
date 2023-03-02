import 'package:auto_route/auto_route.dart';
import 'package:base_boilerplate/routes/app_routes.gr.dart';
import 'package:base_boilerplate/routes/routes_observer.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      RoutesObserver.replace(context,
          page: MyHomeRoute(title: 'Check'), pageName: 'Home Page Screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
