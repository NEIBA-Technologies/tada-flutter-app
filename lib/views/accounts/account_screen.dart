import 'package:flutter/material.dart';
import 'package:tada/components/items/card_action.dart';
import 'package:tada/components/params/router_arguments.dart';
import 'package:tada/core/app_assets_link.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/locator.dart';
import 'package:tada/core/navigation_service.dart';
import 'package:tada/core/router_generator.dart';
import 'package:tada/core/utils/helpers.dart';

import '../../components/items/grid_item.dart';
import '../../core/shared/modals.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<GridItem> items = [
    GridItem(
      icon: AppAssetLink.gridIcon1Svg,
      text: 'Contactez le service client',
      routeNamed: null,
    ),
    GridItem(
      icon: AppAssetLink.gridIcon2Svg,
      text: 'Modifier le profil',
      routeNamed: RouterGenerator.updateAccountRoute,
    ),
    GridItem(
      icon: AppAssetLink.gridIcon3Svg,
      text: 'Support & Contact',
      routeNamed: RouterGenerator.previewItemRoute,
      args: ArgumentAccountPages().supportAndContact,
    ),
    GridItem(
      icon: AppAssetLink.gridIcon4Svg,
      text: 'Modifier le mot de passe',
      routeNamed: RouterGenerator.updatePasswordRoute,
    ),
    GridItem(
      icon: AppAssetLink.gridIcon5Svg,
      text: 'À propos',
      routeNamed: RouterGenerator.previewItemRoute,
      args: ArgumentAccountPages().about,
    ),
    GridItem(
      icon: AppAssetLink.gridIcon6Svg,
      text: 'Rejoindre la communauté',
      routeNamed: RouterGenerator.previewItemRoute,
      args: ArgumentAccountPages().socialNetwork,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              elevation: context.theme.appBarTheme.elevation,
              shadowColor: context.theme.appBarTheme.shadowColor,
              shape:
                  const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Mon profil",
                          style: context.theme.appBarTheme.titleTextStyle),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                      child: SizedBox(
                          width: size.width / 4.4,
                          height: size.width / 4.4,
                          child: Helpers.getImage(AppAssetLink.userAccount)),
                    ),
                    Text("Dan Alban", style: context.labelLarge),
                    Text("nompseudo@gmail.com", style: context.labelSmall),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(padding),
                child: Column(
                  children: [
                    CardAction(
                      title: "Invitez des amis",
                      color: yellowColor,
                      prefixIcon: Helpers.getSvg(AppAssetLink.heartHexagonSvg),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 1.6,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        physics: const NeverScrollableScrollPhysics(),
                        children: items.toList(),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        var res = await Modals.showAlertClose(context);
                        if (res == true) {
                          locator<NavigationService>().logOut();
                        }
                      },
                      child: CardAction(
                        title: "Déconnexion",
                        color: primaryColorLight.withOpacity(.3),
                        prefixIcon: Helpers.getSvg(AppAssetLink.signOutSvg),
                        surfixIcon: Icon(Icons.arrow_forward_ios_rounded,
                            color: blackColor, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
