import 'package:flutter/material.dart';
import 'package:tada/components/app_buttom_widget.dart';
import 'package:tada/components/paints/sawtooth.dart';
import 'package:tada/components/layout_modal.dart';
import 'package:tada/components/space_height_custom.dart';
import 'package:tada/core/app_assets_link.dart';
//import 'package:tada/components/items/sawtooth.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/utils/helpers.dart';

import '../../components/header_modal.dart';
import '../../components/items/offering_item_wiget.dart';
import '../../components/params/RouterArguments.dart';
import '../router_generator.dart';

class ChoiceOffering extends StatefulWidget {
  const ChoiceOffering({
    super.key,
  });

  @override
  State<ChoiceOffering> createState() => _ChoiceOfferingState();
}

class _ChoiceOfferingState extends State<ChoiceOffering> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutModal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderModal(
            backgorundColor: context.theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Helpers.getImage(
                  AppAssetLink.handGesture,
                  width: size.width / 4,
                ),
                SpaceHeightCustom(),
                Text(
                  "Choisissez votre offrande",
                  style: context.textTheme.titleMedium!,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: context.theme.scaffoldBackgroundColor,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: offeringItems.length,
                itemBuilder: (context, e) {
                  var item = offeringItems[e];
                  return OfferingItemWidget(data: item);
                },
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            // Permet au ClipPath de dépasser son conteneur
            children: [
              Positioned(
                top: -10, // Décale le ClipPath vers le haut
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: ZigZagClipper(),
                  child: Container(
                    height: 10,
                    color: Colors.white, // Couleur des dents
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: padding * 2),
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Offrande",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "0 CFA",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    AppButtonWidget(
                      label: "Ajouter au panier",
                      press: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RouterGenerator.indexRoute, (route) => false,
                            arguments: RouterArguments(
                              fragmentTarget: FragmentTarget.SHOPPING_CART,
                            ));
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
