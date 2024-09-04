import 'package:flutter/material.dart';

class AppTheme {

  // colores tema light
  static ColorScheme get lightThemeSchema {
    return const ColorScheme.light(
      brightness: Brightness.light,
      primary: Colors.indigo,
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color.fromARGB(255, 77, 77, 77),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
    );
  }

  // colores tema dark
  static ColorScheme get darkThemeSchema {
    return const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 3, 95, 86),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color.fromARGB(255, 61, 61, 61),
      onSecondary: Color.fromARGB(255, 190, 190, 190),
      error: Color(0xFFCF6679),
      onError: Color(0xFFFFFFFF),
      surface: Color.fromARGB(255, 37, 37, 37),
      onSurface: Color(0xFFFFFFFF),
    );
  }

  static ThemeData theme(ColorScheme colorSchema) {
    return ThemeData(colorScheme: colorSchema);
  }

  // tema de un solo color
  static ThemeData colorTheme(Color color) {
    return ThemeData(
      colorSchemeSeed: color
    );
  }
}
