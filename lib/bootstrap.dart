import 'package:flutter_app_template/app/app.dart';
import 'package:flutter_app_template/core/providers/local_notification_provider.dart';
import 'package:flutter_app_template/core/services/local_notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<ProviderScope> createAppScope() async {
  final localNotificationService = LocalNotificationService();
  await localNotificationService.init();

  return ProviderScope(
    overrides: [
      localNotificationServiceProvider
          .overrideWithValue(localNotificationService),
    ],
    child: const App(),
  );
}
