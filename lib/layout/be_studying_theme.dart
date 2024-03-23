import 'package:flutter/material.dart';

import 'be_studying_colors.dart';

class BeStudyingTheme {
  static ThemeData theme(){
    final primaryColor = HexColor(BeStudyingColors.primaryColor);
    final secondColor = HexColor(BeStudyingColors.secondColor);

    final ThemeData defaultThemeData = ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: HexColor(BeStudyingColors.generalWhite)),
          color: secondColor,
        ),
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: primaryColor,
        primaryColor: primaryColor,
        textTheme: TextTheme(
            bodyMedium: TextStyle(
              fontWeight: FontWeight.w500,
              color: HexColor(BeStudyingColors.generalBlack),
            )
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        )
    );

    return defaultThemeData.copyWith(
        colorScheme: defaultThemeData.colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondColor,
        )
    );
  }
}