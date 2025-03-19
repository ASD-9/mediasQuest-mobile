import 'package:flutter/material.dart';
import 'package:mediasquest/utils/page_transition.dart';
import 'package:mediasquest/views/screens/creators_screen.dart';
import 'package:mediasquest/views/screens/types_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/types":
        return MaterialPageRoute(builder: (_) => const TypesScreen());
      case "/creators":
        return PageTransition.slideTransition(page: CreatorsScreen(typeId: settings.arguments as int,));
      default:
        return MaterialPageRoute(builder: (_) => const TypesScreen());
    }
  }
}
