import 'dart:ui';

class Utils {
  static Color colorFromString(String colorString) {
    colorString = colorString.replaceFirst('#', '');
    colorString = colorString.length == 6 ? 'ff' + colorString : colorString;
    int colorHexInt = int.parse(colorString, radix: 16);
    return Color(colorHexInt);
  }

  static int intFromString(String value) {
    String alphaString = 'ff000000';
    return int.parse(value, radix: 16) & int.parse(alphaString, radix: 16);
  }

  static String stringFromColor(Color color) {
    return '#${color.value.toRadixString(16)}';
  }
}
