import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_assets_link.dart';
import '../core/constants.dart';
import '../core/extensions.dart';
import '../core/router_generator.dart';
import '../core/utils/helpers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
          context, RouterGenerator.indexRoute, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);

    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 30),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: Helpers.getSvg(
              AppAssetLink.fullLogoSvg,
              height: size.width / 9,
            ),
          ),
        ),
      ),
    );
  }
}
