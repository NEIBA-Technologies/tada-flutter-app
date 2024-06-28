import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tada/components/app_buttom_widget.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';

import '../../components/space_height_custom.dart';
import '../../core/constants.dart';
import '../../core/repositories/app_repository.dart';
import '../../core/utils/helpers.dart';
import 'onboarding_items.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final onboarding = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          if (!isLastPage)
            TextButton(
              onPressed: () =>
                  pageController.jumpToPage(onboarding.items.length - 1),
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
              onPageChanged: (index) => setState(
                  () => isLastPage = onboarding.items.length - 1 == index),
              itemCount: onboarding.items.length,
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
                          onboarding.items[index].image,
                          // fit: BoxFit.contain
                        ),
                      ),
                      const SpaceHeightCustom(
                        breakPoint: BreakPoint.xxl,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          onboarding.items[index].title,
                          style: context.textTheme.titleLarge,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SpaceHeightCustom(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(onboarding.items[index].descriptions,
                            style: context.textTheme.titleMedium),
                      ),
                      const SpaceHeightCustom(
                        breakPoint: BreakPoint.xxl,
                      ),
                      getStarted(),
                      const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: onboarding.items.length,
                        onDotClicked: (index) => pageController.animateToPage(
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
            : () => pageController.nextPage(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeIn),
        label: "Commencer");
  }
}
