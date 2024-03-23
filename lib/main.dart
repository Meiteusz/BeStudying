import 'package:be_studying/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'layout/be_studying_theme.dart';

void main() {
  runApp(const AppBeStudying());
}

class AppBeStudying extends StatelessWidget {
  const AppBeStudying({super.key});

  @override
  Widget build(BuildContext context) {
    return Localizations(locale: const Locale('pt', 'BR'), delegates: const <LocalizationsDelegate<dynamic>>[
      DefaultWidgetsLocalizations.delegate,
      DefaultWidgetsLocalizations.delegate,
    ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kaizen: Be Better',
          theme: BeStudyingTheme.theme(),
          onGenerateRoute: AppRoutes.OnGenerateRoute,
        ));
  }
}