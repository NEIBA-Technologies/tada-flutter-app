
 import '../../core/app_assets_link.dart';
import 'onboarding_info.dart';

class OnboardingItems{
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Ouvre ton compte.",
        descriptions: "Crée ta  boutique en un clic Crée ta  boutique en un clic Crée ta  boutique en un clic.",
        image:  AppAssetLink.openAccount,
        ),

    OnboardingInfo(
        title: "Donne ton avis sur l’application.",
        descriptions: "Crée ta  boutique en un clic Crée ta  boutique en un clic Crée ta  boutique en un clic.",
        image: AppAssetLink.giveOpinion
        ),

    OnboardingInfo(
        title: "Gagne de l’argent !",
        descriptions: "Crée ta  boutique en un clic Crée ta  boutique en un clic Crée ta  boutique en un clic.",
        image: AppAssetLink.earnMoney
        ),

  ];
 }