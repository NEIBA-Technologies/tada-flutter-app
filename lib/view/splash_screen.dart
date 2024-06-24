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
      backgroundColor: primaryColorLight,
      body: Stack(
        children: [
          Positioned.fill(
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: ShapeDecoration(
                    color: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(size.width)))),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Helpers.getSvg(
                      AppAssetLink.fullLogoSvg,
                      height: size.width / 9,
                    ),
                    Text(
                      "Demandez une messe plus facilement",
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                    Column(
                      children: [
                        Text(
                          "Une seule messe",
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelLarge!.copyWith(
                            color: yellowColor,
                          ),
                        ),
                        Text(
                          "Peut tout changer",
                          textAlign: TextAlign.center,
                          style: context.textTheme.labelLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Helpers.getSvg(
              AppAssetLink.sacramentalLightSvg,
              color: yellowColor,
              height: size.width / 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
