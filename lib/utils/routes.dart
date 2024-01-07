

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idoc/splash_screen.dart';

import '../views/auth/login_screen.dart';
import '../views/auth/sign_up_screen.dart';
import '../views/dashboard/dashboard_screen.dart';

class Routes {
  static Route<dynamic>? getRoutes(RouteSettings settings) {
    Map? arguments = settings.arguments as Map?;
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (context) => const SplashScreen());
        }
      case LoginScreen.routeName:
        {
          return MaterialPageRoute(builder: (context) => const LoginScreen());
        }
      case SignUpScreen.routeName:
        {
          return MaterialPageRoute(builder: (context) => const SignUpScreen());
        }
      case DashboardScreen.routeName:
        {
          return MaterialPageRoute(builder: (context) => const DashboardScreen());
        }

    }
  }
}