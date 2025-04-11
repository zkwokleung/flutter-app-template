import 'package:flutter/material.dart';
import 'package:flutter_app_template/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final scope = await createAppScope();
  runApp(scope);
}
