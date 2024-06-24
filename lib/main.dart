import 'package:flutter/material.dart';

import 'application.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await start();
  runApp(const Application());
}

Future start() async {
  // await AppInit.init();
}
