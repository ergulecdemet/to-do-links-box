import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_links/screens/onboarding/onboarding_screen.dart';

import '../screens/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic>? createRoute(Widget page, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(settings: settings, builder: (context) => page);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(settings: settings, builder: (context) => page);
    } else {
      return CupertinoPageRoute(builder: (context) => page);
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      //must be splash screen
      case "/":
        return createRoute(const HomeScreen(), settings);
      case "/onboarding":
        return createRoute(const OnboardingScreen(), settings);
      case "/home":
        return createRoute(const HomeScreen(), settings);

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            backgroundColor: Color.fromARGB(255, 170, 165, 165),
            body: Center(
              child: Text("Not a found page"),
            ),
          ),
        );
    }
  }
}

enum AppRoutes { home, productDetail, onboarding }

extension MyAppRoutes on AppRoutes {
  String get path {
    switch (this) {
      case AppRoutes.home:
        return "/";
      case AppRoutes.productDetail:
        return "/productDetail";
      case AppRoutes.onboarding:
        return "/onboarding";
    }
  }
}
