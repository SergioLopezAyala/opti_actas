// lib/src/theme.dart (crea este archivo)
import 'package:flutter/material.dart';

// Colores base
const corporativeBlue = Color(0xFF0033A0);       // Azul institucional
const corporativeBlueLight = Color(0xFF0072CE);  // Azul complementario
const corporativeGreen = Color(0xFF78BE20);      // Verde corporativo
const corporativeYellow = Color(0xFFF4C300);     // Amarillo acento
const neutralGrey = Color(0xFFF4F4F4);         // Fondo gris neutro
const textDark = Color(0xFF1C1C1C);            // Texto principal

ThemeData buildTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: corporativeBlue,
      primary: corporativeBlue,
      secondary: corporativeGreen,
      tertiary: corporativeBlueLight,
      surface: neutralGrey,
      error: Colors.red.shade700,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: neutralGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: corporativeBlue,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: corporativeBlue,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: textDark, fontSize: 16),
      titleLarge: TextStyle(color: textDark, fontWeight: FontWeight.bold),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: corporativeBlueLight),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: corporativeBlue, width: 2),
      ),
      labelStyle: const TextStyle(color: corporativeBlue),
    ),
  );
}
