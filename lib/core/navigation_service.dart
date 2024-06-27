import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'repositories/app_repository.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppRepository appRepository;

  NavigationService(this.appRepository);

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }


  void goBack() {
    navigatorKey.currentState!.pop();
  }
}
