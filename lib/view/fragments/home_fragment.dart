import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../components/app_buttom_widget.dart';
import '../../components/demande_item_widget.dart';
import '../../components/icon_shopping_cart.dart';
import '../../components/params/RouterArguments.dart';
import '../../components/space_height_custom.dart';
import '../../core/app_assets_link.dart';
import '../../core/constants.dart';
import '../../core/router_generator.dart';
import '../../core/shared/modals.dart';
import '../../core/utils/helpers.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
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
                'Bienvenue',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 5),
            Helpers.getImage(AppAssetLink.wavingHandMediumDarkSkinTone,
                width: 18)
          ],
        ),
        actions: [IconShoppingCart()],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: padding * 2),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
              ),
              child: Column(
                children: [
                  Helpers.getSvg(
                    AppAssetLink.culteImageSvg,
                    width: size.width,
                    height: size.width / 4,
                  ),
                  const SpaceHeightCustom(),
                  AppButtonWidget(
                    sizeButton: SizeButton.sm,
                    press: () {
                      Navigator.popAndPushNamed(
                          context, RouterGenerator.indexRoute,
                          arguments: RouterArguments(
                            fragmentTarget: FragmentTarget.REQUEST,
                          ));
                    },
                    label: "Demander une messe",
                  ),
                ],
              ),
            ),
            const SpaceHeightCustom(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Dernières Demandes',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: greenColor,
                  ),
                ),
                SizedBox(width: padding),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: greenColor,
                  size: 20,
                )
              ],
            ),
            const SpaceHeightCustom(),
            SizedBox(
              height: 170,
              child: OverflowBox(
                maxWidth: size.width,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: demandeList.length,
                  itemBuilder: (context, i) {
                    var item = demandeList[i];
                    return Container(
                      margin: EdgeInsets.only(
                        left: i == 0 ? 10 : 0,
                        right: i == demandeList.length - 1 ? 10 : 0,
                      ),
                      child: DemandeItemWidget(
                        indexItemColor: i,
                        data: item,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              ),
            ),
            const SpaceHeightCustom(),
            Container(
              height: size.height / 2,
              padding: EdgeInsets.symmetric(horizontal: padding * 4)
                  .copyWith(top: padding * 4),
              margin: EdgeInsets.only(bottom: padding),
              decoration: BoxDecoration(
                color: tertiairColor,
                borderRadius: BorderRadius.circular(radius * 2),
              ),
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: padding * 4),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius * 15),
                    topRight: Radius.circular(radius * 15),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Helpers.getSvg(
                      AppAssetLink.fullLogoSvg,
                      height: size.width / 13,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Une seule messe",
                          style: TextStyle(
                            color: yellowColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          "peut tout changer.",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    AppButtonWidget(
                        press: () {},
                        label: "Partager",
                        sizeButton: SizeButton.xs),
                    GestureDetector(
                      onTap: () async {
                        await Modals.showModalQrcode(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.qr_code,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "QR Code",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
