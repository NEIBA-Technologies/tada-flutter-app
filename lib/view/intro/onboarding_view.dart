import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:flutter/material.dart';
import 'package:tada/view/auth_screen/sign_up_screen.dart';
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
  final controller = OnboardingItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: PageView.builder(
              onPageChanged: (index) => setState(
                  () => isLastPage = controller.items.length - 1 == index),
              itemCount: controller.items.length,
              controller: pageController,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: isLastPage
                            ? SpaceHeightCustom(
                                breakPoint: BreakPoint.lg,
                              )
                            : TextButton(
                                onPressed: () => pageController
                                    .jumpToPage(controller.items.length - 1),
                                child: const Text(
                                  "Sauter",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black54,
                                      fontSize: 12
                                      ),
                                )),
                      ),
                      SizedBox(
                        height: size.height / 2.2,
                        width: size.width,
                        child: Helpers.getImage(
                          controller.items[index].image,
                          // fit: BoxFit.contain
                        ),
                      ),
                      SpaceHeightCustom(
                        breakPoint: BreakPoint.xxl,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          controller.items[index].title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SpaceHeightCustom(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(controller.items[index].descriptions,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                            textAlign: TextAlign.start),
                      ),
                      SpaceHeightCustom(
                        breakPoint: BreakPoint.xxl,
                      ),
                      getStarted(),
                      SpaceHeightCustom(breakPoint: BreakPoint.sm),
                      SmoothPageIndicator(
                        controller: pageController,
                        count: controller.items.length,
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
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: primaryColor),
      width: MediaQuery.of(context).size.width * .9,
      height: 40,
      child: TextButton(
          onPressed: isLastPage
              ? () async {
                  await  AppRepository().updateStorageOnboarding();

                  if (!mounted) return;
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                }
              : () => pageController.nextPage(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeIn),
          child: const Text(
            "Commencer",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.w100,),
          )),
    );
  }
}
