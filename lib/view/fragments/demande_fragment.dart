import 'package:flutter/material.dart';
import 'package:tada/components/items/calendarWidget.dart';
import 'package:tada/core/constants.dart';

import '../../components/eglise_item_widget.dart';
import '../../components/icon_shopping_cart.dart';
import '../../core/app_assets_link.dart';
import '../../core/utils/helpers.dart';

class DemandeFragment extends StatefulWidget {
  const DemandeFragment({super.key});

  @override
  State<DemandeFragment> createState() => _DemandeFragmentState();
}

class _DemandeFragmentState extends State<DemandeFragment> {
  int cartItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 15,
        title: Row(
          children: [
            const Flexible(
              child: Text(
                "Choisissez votre messe",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 5),
            Helpers.getImage(AppAssetLink.foldedHandsMediumDarkSkinTone,
                width: 18)
          ],
        ),
        actions: [IconShoppingCart()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.1),
          child: Column(
            children: [
              const LocalizedCalendarWidget(),
              ...List.generate(egliseList.length, (index) {
                var item = egliseList[index];
                return EgliseItemWidget(
                  time: 'Dimanche 7 Avril',
                  data: item,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
