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
        return _buildNoAnimationRoute(const DataLoadingPage(), settings);
      case landingRoute:
        return _buildNoAnimationRoute(const LandingPage(), settings);
      case loginRoute:
        return _buildNoAnimationRoute(const LoginPage(), settings);
      case homeRoute:
        return _buildNoAnimationRoute(const HomePage(), settings);
      default:
        return MaterialPageRoute(
          builder: (_) => SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('Nenhuma rota encontrada para ${settings.name}'),
              ),
            ),
          ),
          settings: settings,
        );
    }
  }

  static PageRouteBuilder<dynamic> _buildNoAnimationRoute(
      Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      settings: settings,
    );
  }
}
