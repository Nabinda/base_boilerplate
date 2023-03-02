import 'package:auto_route/auto_route.dart';
import 'package:base_boilerplate/features/splash_screen/view/splash_screen.dart';

import '../features/home_screen/view/home_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(page: MyHomePage),
])
class $AppRouter {}
