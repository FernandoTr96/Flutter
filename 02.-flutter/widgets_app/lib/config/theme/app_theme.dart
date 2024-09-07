import 'package:flutter/material.dart';

class AppTheme {

  const AppTheme();

  static ThemeData theme(Color color){  
    return ThemeData(
      colorSchemeSeed: color,
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }
}