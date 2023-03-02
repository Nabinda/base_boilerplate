import 'package:auto_route/auto_route.dart';
import 'package:base_boilerplate/routes/app_routes.gr.dart';
import 'package:flutter/material.dart';

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Boiler plate',
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(appRouter,
          navigatorObservers: () => [AutoRouteObserver()]),
      builder: (context, child) {
        return ScrollConfiguration(
            behavior: GlobalScrollBehavior(), child: child ?? Container());
      },
    );
  }
}
