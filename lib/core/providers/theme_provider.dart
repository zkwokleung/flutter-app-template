// core/providers/theme_provider.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    _load();
    return ThemeMode.system;
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt('themeMode') ?? ThemeMode.system.index;
    state = ThemeMode.values[index];
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);
    state = mode;
  }

  Future<void> toggleThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final index = (state.index + 1) % ThemeMode.values.length;
    await prefs.setInt('themeMode', index);
    state = ThemeMode.values[index];
  }

  Future<void> resetThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('themeMode');
    state = ThemeMode.system;
  }

  Future<void> setThemeModeFromString(String mode) async {
    final prefs = await SharedPreferences.getInstance();
    ThemeMode themeMode;
    switch (mode) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      default:
        themeMode = ThemeMode.system;
    }
    await prefs.setInt('themeMode', themeMode.index);
    state = themeMode;
  }

  String getThemeModeAsString() {
    switch (state) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}
