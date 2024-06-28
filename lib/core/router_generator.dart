import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:tada/components/animated_routes/transparant_route.dart';
import 'package:tada/components/params/RouterArguments.dart';
import 'package:tada/core/models/assignment.dart';
import 'package:tada/view/auth_screen/fortget_password/reset_password_step_four.dart';
import 'package:tada/view/auth_screen/fortget_password/reset_password_step_one.dart';
import 'package:tada/view/auth_screen/fortget_password/reset_password_step_three.dart';
import 'package:tada/view/auth_screen/fortget_password/reset_password_step_two.dart';
import 'package:tada/view/auth_screen/sign_in_screen.dart';

import '../view/auth_screen/sign_up_screen.dart';
import '../view/detail_assignment_screen.dart';
import '../view/index_screen.dart';
import '../view/intro/onboarding_view.dart';
import '../view/invinstigation_screen.dart';
import '../view/splash_screen.dart';

class RouterGenerator {
  static const splashScreen = "/splashScreen";
  static const onboardingRoute = '/onboarding';
  static const signUpRoute = '/signUp';
  static const signInRoute = '/signIn';
  static const resetPasswordStepOneRoute = '/resetPasswordStepOne';
  static const resetPasswordStepTwoRoute = '/resetPasswordStepTwo';
  static const resetPasswordStepThreeRoute = '/resetPasswordStepThree';
  static const resetPasswordStepFourRoute = '/resetPasswordStepFour';
  static const investigationRoute = '/investigation';
  static const detailAssignmentRoute = '/detail-assignment';
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
      case resetPasswordStepOneRoute:
        page = const ResetPasswordStepOne();
        break;
      case investigationRoute:
        page =  InvinstigationScreen(data:  setting.arguments as Assignment,);
        break;
      case detailAssignmentRoute:
        page =  DetailAssignmentScreen(data:  setting.arguments as Assignment,);
        break;

      case resetPasswordStepTwoRoute:
        page = ResetPasswordStepTwo();
        break;
      case resetPasswordStepThreeRoute:
        page = ResetPasswordStepThree();
        break;
      case resetPasswordStepFourRoute:
        page = ResetPasswordStepFour();
        break;
      case indexRoute:
        page = IndexScreen(
          arguments: setting.arguments as RouterArguments?,
        );
        break;
    }

    return TransparantRoute(builder: (context) => page);
  }
}
