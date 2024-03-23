import 'dart:ui';

class BeStudyingColors {
  BeStudyingColors._();

  static const String primaryColor = "#191928";
  static const String secondColor = "#121228";
  static const String generalWhite = "#FFFFFF";
  static const String generalBlack = "#0A0A10";
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length == 6){
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}