import 'package:flutter/material.dart';

import '../pages/data_loading_page.dart';
import '../pages/home_page.dart';
import '../pages/landing_page.dart';
import '../pages/login_page.dart';
import 'app_routes.dart';

class AppRouteGenerator {
  AppRouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dataLoadingRoute:
        return MaterialPageRoute(
          builder: (_) => const DataLoadingPage(),
          settings: settings,
        );
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
