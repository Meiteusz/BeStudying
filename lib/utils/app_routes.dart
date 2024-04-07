import 'package:flutter/material.dart';

import 'package:be_studying/screens/start_screen.dart';
import 'package:be_studying/screens/home_screen.dart';

class AppRoutes {
  static const startScreen = "/start";
  static const homeScreen = "/home";

  static Route<dynamic> OnGenerateRoute(RouteSettings settings) {
    WidgetBuilder builderFunction;

    switch (settings.name) {
      case startScreen:
        {
          builderFunction = (context) => const StartScreen();
          break;
        }
      case homeScreen:
        {
          builderFunction = (context) => const HomeScreen();
          break;
        }
      default:
        {
          builderFunction = (context) => const StartScreen();
        }
    }
    return MaterialPageRoute(settings: settings, builder: builderFunction);
  }
}
