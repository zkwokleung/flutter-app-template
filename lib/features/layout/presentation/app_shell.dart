import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final location =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;

    final l10n = AppLocalizations.of(context)!;

    final tabs = [
      _TabItem(label: l10n.homeTitle, icon: Icons.home, route: '/'),
      _TabItem(
        label: l10n.settingsTitle,
        icon: Icons.settings,
        route: '/settings',
      ),
      _TabItem(
        label: l10n.profileTitle,
        icon: Icons.person,
        route: '/profile',
      ),
    ];

    final currentIndex = tabs.indexWhere((tab) => location.endsWith(tab.route));

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        onTap: (index) => context.go(tabs[index].route),
        items: [
          for (final tab in tabs)
            BottomNavigationBarItem(
              icon: Icon(tab.icon),
              label: tab.label,
            )
        ],
      ),
    );
  }
}

class _TabItem {
  final String label;
  final IconData icon;
  final String route;
  const _TabItem(
      {required this.label, required this.icon, required this.route});
}
