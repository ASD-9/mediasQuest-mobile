import 'package:flutter/material.dart';
import 'package:mediasquest/views/screens/types_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/types":
        return MaterialPageRoute(builder: (_) => const TypesScreen());
      default:
        return MaterialPageRoute(builder: (_) => const TypesScreen());
    }
  }
}
