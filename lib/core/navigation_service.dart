import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tada/core/router_generator.dart';

import 'repositories/app_repository.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppRepository appRepository;

  NavigationService(this.appRepository);

  Future<dynamic> navigateTo(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName,arguments: args);
  }

  Future<void> logOut() async {
    appRepository.logOut();
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
        RouterGenerator.signInRoute, (Route<dynamic> route) => false);
  }

  void goBack() {
    navigatorKey.currentState!.pop();
  }
}
