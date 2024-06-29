import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tada/core/constants.dart';

import '../core/app_assets_link.dart';
import '../core/repositories/app_repository.dart';
import '../core/router_generator.dart';
import '../core/utils/helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color? color;

  late StreamSubscription<Null> stream;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      startSession();
    });
    stream = Stream.periodic(const Duration(seconds: 1), (computation) {
      if (computation % 2 == 0) {
        color = blackColor;
      } else {
        color = null;
      }
    }).listen(
      (event) {
        setState(() {});
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    stream.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: AnimatedCrossFade(
            firstChild: Helpers.getSvg(
              AppAssetLink.fullLogoSvg,
              height: size.width / 9,
            ),
            secondChild: Helpers.getSvg(AppAssetLink.fullLogoSvg,
                height: size.width / 9, color: color),
            duration: Duration(seconds: 1),
            crossFadeState: color != null
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
          ),
        ),
      ),
    );
  }

  Future<void> startSession() async {
    String route = RouterGenerator.indexRoute;
    bool value = await AppRepository().hasAlreadyOnboarding();
    route =
        value ? RouterGenerator.signUpRoute : RouterGenerator.onboardingRoute;
    Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
  }
}
