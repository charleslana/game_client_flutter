import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import '../pages/landing_page.dart';
import '../pages/login_page.dart';
import 'app_routes.dart';

class AppRouteGenerator {
  AppRouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingRoute:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
          settings: settings,
        );
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('Nenhuma rota encontrada para ${settings.name}'),
              ),
            ),
          ),
        );
    }
  }
}
