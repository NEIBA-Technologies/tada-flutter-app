import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:tada/components/animated_routes/blur_page_route.dart';
import 'package:tada/components/pages/display_content_screen.dart';
import 'package:tada/components/pages/display_menu_screen.dart';
import 'package:tada/core/models/page_route_setting.dart';
import 'package:tada/components/params/router_arguments.dart';
import 'package:tada/core/models/assignment.dart';
import 'package:tada/views/accounts/fragments/report_problem_fragment.dart';
import 'package:tada/views/accounts/fragments/update_account_fragment.dart';
import 'package:tada/views/auth_screen/fortget_password/reset_password_step_four.dart';
import 'package:tada/views/auth_screen/fortget_password/reset_password_step_one.dart';
import 'package:tada/views/auth_screen/fortget_password/reset_password_step_three.dart';
import 'package:tada/views/auth_screen/fortget_password/reset_password_step_two.dart';
import 'package:tada/views/auth_screen/sign_in_screen.dart';
import 'package:tada/views/buisness/add_an_account_screen.dart';
import 'package:tada/views/buisness/removal_withdrawal_success_screen.dart';

import '../views/accounts/fragments/update_password_fragment.dart';
import '../views/auth_screen/sign_up_screen.dart';
import '../views/buisness/removal_withdrawal_screen.dart';
import '../views/buisness/withdraw_cash_screen.dart';
import '../views/assignment/assignment_details_screen.dart';
import '../views/index_screen.dart';
import '../views/assignment/invinstigation_screen.dart';
import '../views/onboarding/onboarding_screen.dart';
import '../views/splash_screen.dart';

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
  static const withdrawCashRoute = "/withdraw_cash_screen";
  static const addAnAccountRoute = "/AddAnAccountScreen";
  static const removalWithdrawalRoute = "/RemovalWithdrawalScreen";
  static const removalWithdrawalSuccessRoute = "/removalWithdrawalSuccess";
  static const updatePasswordRoute = "/UpdatePasswordFragment";
  static const reportProblemRoute = "/ReportProblemFragment";
  static const updateAccountRoute = "/UpdateAccountFragment";
  static const previewItemRoute = "/previewItem";
  static const displayContentRoute = "/displayContentScreen";
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
        page = InvinstigationScreen(
          data: setting.arguments as Assignment,
        );
        break;
      case detailAssignmentRoute:
        page = AssignmentDetailsScreen(
          data: setting.arguments as Assignment,
        );
        break;

      case resetPasswordStepTwoRoute:
        page = ResetPasswordStepTwo();
        break;
      case resetPasswordStepThreeRoute:
        page = const ResetPasswordStepThree();
        break;
      case resetPasswordStepFourRoute:
        page =  ResetPasswordStepFour();
        break;
      case withdrawCashRoute:
        page = const WithdrawCashScreen();
        break;
      case addAnAccountRoute:
        page = const AddAnAccountScreen();
        break;
      case removalWithdrawalRoute:
        page = const RemovalWithdrawalScreen();
        break;
      case removalWithdrawalSuccessRoute:
        page = const RemovalWithdrawalSuccessScreen();
        break;
      case updatePasswordRoute:
        page = const UpdatePasswordFragment();
        break;
      case reportProblemRoute:
        page = const ReportProblemFragment();
        break;
      case updateAccountRoute:
        page = const UpdateAccountFragment();
        break;
      case previewItemRoute:
        page = DisplayMenuScreen(params: setting.arguments as PageRouteSetting);
        break;
        case displayContentRoute:
        page = DisplayContentScreen(params: setting.arguments as PageRouteSetting);
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
