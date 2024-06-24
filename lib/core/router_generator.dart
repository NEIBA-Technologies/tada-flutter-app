import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:tada/components/params/RouterArguments.dart';

import '../components/animated_routes/blur_page_route.dart';
import '../view/index_screen.dart';
import '../view/splash_screen.dart';

class RouterGenerator {
  static const splashScreen = "/splashScreen";
  static const indexRoute = "/homeRoute";
  static String? currentRoute;

  static Route<dynamic> navigate(RouteSettings setting) {
    if (kDebugMode) {
      print("-----------------------------------------------------------");
      print("----------------navigate to ${setting.name}----------------");
      print(setting);
      print("-----------------------------------------------------------");
    }
    currentRoute = setting.name;

    Widget page = const SizedBox();

    switch (setting.name) {
      case splashScreen:
        page = const SplashScreen();
        break;
      case indexRoute:
        page = IndexScreen(
          arguments: setting.arguments as RouterArguments?,
        );
        break;
    }

    return BlurredRouter(builder: (context) => page);
  }
}
