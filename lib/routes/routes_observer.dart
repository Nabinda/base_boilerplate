import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class RoutesObserver {
  static updateAnalytics(String pageName) {
    FirebaseAnalytics.instance.setCurrentScreen(
      screenName: pageName,
    );
  }

  static pushScreen(BuildContext context,
      {required PageRouteInfo page, required String pageName}) {
    updateAnalytics(pageName);
    context.router.push(page);
  }

  static replace(BuildContext context,
      {required PageRouteInfo page, required String pageName}) {
    updateAnalytics(pageName);
    context.router.replace(page);
  }

  static replaceAll(BuildContext context,
      {required List<PageRouteInfo> page, required String pageName}) {
    updateAnalytics(pageName);
    context.router.replaceAll(page);
  }
}
