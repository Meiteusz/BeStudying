import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class AppRoutes {
  static const homeScreen = "/home";

  static Route<dynamic> OnGenerateRoute(RouteSettings settings) {
    WidgetBuilder builderFunction;

    switch (settings.name) {
      case homeScreen:{
        builderFunction = (context) => HomeScreen();
        break;
      }
      default:{
        builderFunction = (context) => const HomeScreen();
      }
    }
    return MaterialPageRoute(settings: settings, builder: builderFunction);
  }
}