import 'package:flutter_app_template/core/constants/app_radii.dart';
import 'package:flutter_app_template/core/constants/app_spacing.dart';
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
      body: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              children: [
                Text(l10n.appearance),
              ],
            ),
          ),
          // Appearance selection
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
            child: ToggleButtons(
              constraints:
                  const BoxConstraints(minHeight: 40.0, minWidth: 100.0),
              borderRadius: AppRadii.medium,
              isSelected: [
                themeMode == ThemeMode.light,
                themeMode == ThemeMode.dark,
                themeMode == ThemeMode.system,
              ],
              onPressed: (int index) {
                switch (index) {
                  case 0:
                    themeNotifier.setThemeMode(ThemeMode.light);
                    break;
                  case 1:
                    themeNotifier.setThemeMode(ThemeMode.dark);
                    break;
                  case 2:
                    themeNotifier.setThemeMode(ThemeMode.system);
                    break;
                }
              },
              children: [
                Text(l10n.lightMode),
                Text(l10n.darkMode),
                Text(l10n.systemDefault),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          // Language selection
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
            child: Row(
              children: [
                Text(l10n.language),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
            child: DropdownButtonFormField<Locale>(
              value: locale ?? const Locale('en'),
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
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
