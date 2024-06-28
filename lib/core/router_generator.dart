import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:tada/components/animated_routes/scale_up_route.dart';
import 'package:tada/components/params/RouterArguments.dart';
import 'package:tada/view/auth_screen/sign_in_screen.dart';

import '../view/auth_screen/sign_up_screen.dart';
import '../view/index_screen.dart';
import '../view/intro/onboarding_view.dart';
import '../view/splash_screen.dart';

class RouterGenerator {
  static const splashScreen = "/splashScreen";
  static const onboardingRoute = '/onboarding';
  static const signUpRoute = '/signUp';
  static const signInRoute = '/signIn';
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
      case onboardingRoute:
        page = const OnboardingView();
        break;
      case signUpRoute:
        page = const SignUpScreen();
        break;
      case signInRoute:
        page = const SignInScreen();
        break;
      case indexRoute:
        page = IndexScreen(
          arguments: setting.arguments as RouterArguments?,
        );
        break;
    }

    return ScaleUpRouter(builder: (context) => page, current: page);
  }
}
