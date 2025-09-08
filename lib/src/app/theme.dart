// lib/src/theme.dart
import 'package:flutter/material.dart';

/// Paleta corporativa (ajústala si lo necesitas)
class BrandColors {
  static const blue = Color(0xFF0033A0);        // principal
  static const blueLight = Color(0xFF0072CE);   // acento azul
  static const green = Color(0xFF78BE20);       // secundario
  static const yellow = Color(0xFFF4C300);      // acento cálido
  static const neutralBg = Color(0xFFF4F4F4);   // fondo claro
  static const textDark = Color(0xFF1C1C1C);    // texto principal
}

class AppTheme {
  /// Tema CLARO global
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      // 👇 clave: fija la familia global a Poppins (de assets/fonts)
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSeed(
        seedColor: BrandColors.blue,
        primary: BrandColors.blue,
        secondary: BrandColors.green,
        tertiary: BrandColors.blueLight,
        surface: Colors.white,
        onSurface: BrandColors.textDark,
        error: Colors.red,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: BrandColors.neutralBg,
    );

    return base.copyWith(
      // 👇 construye sobre el textTheme base sin GoogleFonts
      textTheme: buildTextTheme(base.textTheme, isDark: false),
      appBarTheme: const AppBarTheme(
        backgroundColor: BrandColors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: BrandColors.blue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          elevation: 1,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: BrandColors.green,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: BrandColors.blue,
          side: const BorderSide(color: BrandColors.blueLight),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        labelStyle: const TextStyle(color: BrandColors.blue),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: BrandColors.blueLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: BrandColors.blueLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: BrandColors.blue, width: 2),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: BrandColors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 64,
        backgroundColor: Colors.white,
        indicatorColor: BrandColors.blue.withOpacity(0.12),
        elevation: 2,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: BrandColors.blue.withOpacity(0.12),
        labelStyle: const TextStyle(color: BrandColors.textDark),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(color: BrandColors.blueLight),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: BrandColors.blue,
        contentTextStyle: TextStyle(color: Colors.white),
        behavior: SnackBarBehavior.floating,
        elevation: 2,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.black.withOpacity(0.06),
        thickness: 1,
        space: 24,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: BrandColors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  /// Tema OSCURO global
  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      // 👇 también en dark
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSeed(
        seedColor: BrandColors.blue,
        primary: const Color(0xFF8FB3FF),
        secondary: const Color(0xFF93D36A),
        tertiary: const Color(0xFF7DBBFF),
        surface: const Color(0xFF171A1F),
        onSurface: Colors.white,
        error: Colors.redAccent,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: const Color(0xFF0F1216),
    );

    return base.copyWith(
      textTheme: buildTextTheme(base.textTheme, isDark: true),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF0F1216),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D5BFF),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF222730),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        labelStyle: const TextStyle(color: Color(0xFF8FB3FF)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF2E3A4A)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF2E3A4A)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF8FB3FF), width: 2),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF2D5BFF),
        foregroundColor: Colors.white,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 64,
        backgroundColor: const Color(0xFF141820),
        indicatorColor: Colors.white.withOpacity(0.08),
        elevation: 1,
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF222730),
        selectedColor: Colors.white.withOpacity(0.08),
        labelStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        side: const BorderSide(color: Color(0xFF2E3A4A)),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xFF2D5BFF),
        contentTextStyle: TextStyle(color: Colors.white),
        behavior: SnackBarBehavior.floating,
      ),
      dividerTheme: DividerThemeData(
        color: Colors.white.withOpacity(0.08),
        thickness: 1,
        space: 24,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: const Color(0xFF8FB3FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }

  /// Tipografía: ajusta pesos/colores sobre el TextTheme base.
  /// No usa GoogleFonts; el `fontFamily` ya está fijado a 'Poppins' en ThemeData.
  static TextTheme buildTextTheme(TextTheme base, {required bool isDark}) {
    final color = isDark ? Colors.white : BrandColors.textDark;

    return base.copyWith(
      titleLarge: base.titleLarge?.copyWith(
        // Poppins Bold ~700
        fontWeight: FontWeight.w700,
        fontSize: 22,
        color: color,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        // Poppins Regular ~400
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: color,
      ),
      labelLarge: base.labelLarge?.copyWith(
        // Poppins SemiBold ~600
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}
