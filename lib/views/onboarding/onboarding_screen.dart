import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tada/components/others_widget/app_buttom_widget.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';

import '../../components/others_widget/space_height_custom.dart';
import '../../core/app_assets_link.dart';
import '../../core/constants.dart';
import '../../core/models/onboarding.dart';
import '../../core/repositories/app_repository.dart';
import '../../core/utils/helpers.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<Onboarding> items = [
    Onboarding(
      title: "Ouvre ton compte.",
      descriptions:
      "Crée ta  boutique en un clic Crée ta  boutique en un clic Crée ta  boutique en un clic.",
      image: AppAssetLink.openAccount,
    ),
    Onboarding(
        title: "Donne ton avis sur l’application.",
        descriptions:
        "Crée ta  boutique en un clic Crée ta  boutique en un clic Crée ta  boutique en un clic.",
        image: AppAssetLink.giveOpinion),
    Onboarding(
        title: "Gagne de l’argent !",
        descriptions:
        "Crée ta  boutique en un clic Crée ta  boutique en un clic Crée ta  boutique en un clic.",
        image: AppAssetLink.earnMoney),
  ];

  List<Onboarding> get onboardingItems => items.toList();

  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          if (!isLastPage)
            TextButton(
              onPressed: () =>
                  pageController.jumpToPage(onboardingItems.length - 1),
              child: Text(
                "Sauter",
                style: TextStyle(
                    fontWeight: FontWeight.w100,
                    color: blackColor,
                    fontSize: 12),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: PageView.builder(
              onPageChanged: (index) =>
                  setState(
                          () =>
                      isLastPage = onboardingItems.length - 1 == index),
              itemCount: onboardingItems.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: size.height / 2.2,
                        width: size.width,
                        child: Helpers.getImage(
                          onboardingItems[index].image,
                          // fit: BoxFit.contain
                        ),
                      ),
                      const SpaceHeightCustom(
                        breakPoint: BreakPoint.xxl,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          onboardingItems[index].title,
                          style: context.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SpaceHeightCustom(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(onboardingItems[index].descriptions,
                            style: context.titleMedium),
                      ),
                      const SpaceHeightCustom(
                        breakPoint: BreakPoint.xxl,
                      ),
                      getStarted(),
                      const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: onboardingItems.length,
                        onDotClicked: (index) =>
                            pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.easeIn),
                        effect: WormEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          activeDotColor: primaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget getStarted() {
    return AppButtonWidget(
        onPressed: isLastPage
            ? () async {
          await AppRepository().updateStorageOnboarding();
          if (!mounted) return;
          Navigator.pushReplacementNamed(
            context,
            RouterGenerator.signUpRoute,
          );
        }
            : () =>
            pageController.nextPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn),
        label: "Commencer");
  }
}
