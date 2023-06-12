import 'package:banksync/core/core.dart';
import 'package:banksync/features/features.dart';
import 'package:banksync/features/home/home.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RouteName.splash:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const SplashView(),
      );
    case RouteName.home:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const Home(),
      );

    case RouteName.paystackUserDetails:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const PaystackUserDetails(),
      );

    default:
      return MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

Route<dynamic> _getPageRoute({
  required String routeName,
  required Widget viewToShow,
}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
