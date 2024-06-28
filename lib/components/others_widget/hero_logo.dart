import 'package:flutter/material.dart';

import '../../core/app_assets_link.dart';
import '../../core/utils/helpers.dart';

class HeroLogo extends StatelessWidget {
  const HeroLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Logo",
      child: SizedBox(
        width: 50,
        height: 50,
        child: Helpers.getSvg(AppAssetLink.logoSvg),
      ),
    );
  }
}
