import 'package:flutter/material.dart';

class AppTheme {

  final bool isDarkMode;

  const AppTheme({ this.isDarkMode = false });

  ThemeData theme(Color color){  
    return ThemeData(
      colorSchemeSeed: color,
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }

  ThemeData darkMode(){
    return ThemeData(
      colorScheme: isDarkMode ? const ColorScheme.dark() : const ColorScheme.light(),
      appBarTheme: const AppBarTheme(
        centerTitle: true
      )
    );
  }

  // metodo para copiar clases
  // se puede acceder en cualquier instancia
  AppTheme copyWith({bool? isDarkMode}) => AppTheme(
    isDarkMode: isDarkMode ?? this.isDarkMode
  );
}