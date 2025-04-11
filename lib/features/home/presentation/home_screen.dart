import 'package:flutter/material.dart';
import 'package:flutter_app_template/constants/app_spacing.dart';
import 'package:flutter_app_template/core/providers/local_notification_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppSpacing.lg,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/settings'),
              child: const Text('Go to Settings'),
            ),
            ElevatedButton(
              onPressed: () {
                final notification = ref.read(localNotificationServiceProvider);
                notification.showNotification(
                  id: 11,
                  title: 'Hello',
                  body: 'This is a notification from Home Screen',
                );
              },
              child: const Text('Show Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
