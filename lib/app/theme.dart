import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );

  static final dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blue, brightness: Brightness.dark),
  );
}
