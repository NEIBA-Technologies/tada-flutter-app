import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tada/state_manager/SimpleBlocObserver.dart';

import 'application.dart';
import 'core/app_init.dart';
import 'core/locator.dart';
import 'core/repositories/app_repository.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await start();
  final userRepository = AppRepository();

  setupLocator(userRepository);

  Bloc.observer = SimpleBlocObserver();
  runApp(const Application());
}

Future start() async {
  await AppInit.init();
}
