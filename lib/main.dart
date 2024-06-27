import 'package:flutter/material.dart';

import 'application.dart';
import 'core/app_init.dart';
import 'core/locator.dart';
import 'core/repositories/app_repository.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await start();
  final userRepository = AppRepository();

  setupLocator(userRepository);
  runApp(const Application());
}

Future start() async {
  await AppInit.init();
}
