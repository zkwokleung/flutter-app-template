import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/auth_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(authControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => controller.login('test@email.com', 'password'),
              child: const Text('Login with Email'),
            ),
            ElevatedButton(
              onPressed: controller.signInWithGoogle,
              child: const Text('Login with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
