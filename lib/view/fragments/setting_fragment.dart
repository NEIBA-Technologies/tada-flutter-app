import 'package:flutter/material.dart';

import '../../components/icon_shopping_cart.dart';
import '../../core/app_assets_link.dart';
import '../../core/utils/helpers.dart';

class SettingFragment extends StatefulWidget {
  const SettingFragment({super.key});

  @override
  State<SettingFragment> createState() => _SettingFragmentState();
}

class _SettingFragmentState extends State<SettingFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 15,
        title: Row(
          children: [
            const Flexible(
              child: Text(
                "Paramètres",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 5),
            Helpers.getImage(AppAssetLink.hammerAndWrench, width: 18)
          ],
        ),
        actions: [IconShoppingCart()],
      ),
      body: const Center(child: Icon(Icons.settings, size: 40)),
    );
  }
}
