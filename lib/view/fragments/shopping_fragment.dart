import 'package:flutter/material.dart';
import 'package:tada/components/paints/sawtooth.dart';
import 'package:tada/components/params/RouterArguments.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';

import '../../../components/app_buttom_widget.dart';
import '../../components/items/shopping_cart_widget.dart';
import '../../../core/shared/modals.dart';
import '../../components/icon_shopping_cart.dart';
import '../../core/app_assets_link.dart';
import '../../core/utils/helpers.dart';

class ShoppingFragment extends StatefulWidget {
  const ShoppingFragment({super.key});

  @override
  State<ShoppingFragment> createState() => _ShoppingFragmentState();
}

class _ShoppingFragmentState extends State<ShoppingFragment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 15,
        title: Row(
          children: [
            const Flexible(
              child: Text(
                "Panier de prières",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 5),
            Helpers.getImage(AppAssetLink.raisingHandsMediumDarkSkinTone,
                width: 18)
          ],
        ),
        actions: [IconShoppingCart()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding * 2),
            child: Text(
              "${shoppingItemList.length} demande${shoppingItemList.length > 1 ? 's' : ''}",
              style: context.textTheme.labelLarge!,
            ),
          ),
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...shoppingItemList.asMap().entries.map((e) {
                  var item = e.value;
                  var i = e.key;
                  return Container(
                    margin: EdgeInsets.only(
                      left: i == 0 ? 10 : 0,
                      right: i == shoppingItemList.length - 1 ? 10 : 0,
                    ),
                    padding: EdgeInsets.only(right: padding),
                    child: ShoppingCartWidget(
                      indexItemColor: i,
                      data: item,
                    ),
                  );
                })
              ],
            ),
          ),
          ClipPath(
            clipper: ZigZagClipper(),
            child: Container(
              height: 5,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: padding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "0 CFA",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppButtonWidget(
                    label: "Payer",
                    press: () async {
                      await Modals.showModalAddAdresse(context);
                    },
                  ),
                  AppButtonWidget(
                    label: "Ajouter une autre demande",
                    styleButton: StyleButton.GREEN,
                    press: () {
                      Navigator.popAndPushNamed(
                          context, RouterGenerator.indexRoute,
                          arguments: RouterArguments(
                            fragmentTarget: FragmentTarget.REQUEST,
                          ));
                    },
                  ),
                  AppButtonWidget(
                    label: "Envoyer pour payer en espèces",
                    styleButton: StyleButton.GREEN,
                    press: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
