import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../core/providers/locale_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final themeNotifier = ref.read(themeModeProvider.notifier);
    final localeNotifier = ref.read(localeProvider.notifier);
    final locale = ref.watch(localeProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<ThemeMode>(
              value: themeMode,
              decoration: InputDecoration(labelText: l10n.darkMode),
              onChanged: (mode) {
                if (mode != null) {
                  themeNotifier.setThemeMode(mode);
                }
              },
              items: [
                DropdownMenuItem(
                    value: ThemeMode.system, child: Text(l10n.systemDefault)),
                DropdownMenuItem(
                    value: ThemeMode.light, child: Text(l10n.lightMode)),
                DropdownMenuItem(
                    value: ThemeMode.dark, child: Text(l10n.darkMode)),
              ],
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<Locale>(
              value: locale ?? const Locale('en'),
              decoration: InputDecoration(labelText: l10n.language),
              onChanged: (Locale? value) {
                if (value != null) {
                  localeNotifier.setLocale(value);
                }
              },
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('zh'), child: Text('中文')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
