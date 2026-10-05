import 'package:flutter/material.dart';
class AppTheme {
  static const primary = Color(0xFF087F5B);
  static const dark = Color(0xFF05543F);
  static const accent = Color(0xFFF4B740);
  static const background = Color(0xFFF7F9F8);
  static const text = Color(0xFF17211D);
  static const danger = Color(0xFFD64545);
  static ThemeData light() {
    final scheme = ColorScheme.fromSeed(seedColor: primary, brightness: Brightness.light);
    return ThemeData(useMaterial3: true, colorScheme: scheme.copyWith(primary: primary, secondary: accent, error: danger), scaffoldBackgroundColor: background, textTheme: ThemeData.light().textTheme.apply(bodyColor: text, displayColor: text), inputDecorationTheme: InputDecorationTheme(filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none)), cardTheme: CardTheme(elevation: 0, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))));
  }
}
