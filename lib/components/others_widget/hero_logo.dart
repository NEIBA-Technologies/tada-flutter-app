import 'package:flutter/material.dart';

import '../../core/app_assets_link.dart';
import '../../core/utils/helpers.dart';

class HeroLogo extends StatelessWidget {
  final double size;

  const HeroLogo({super.key, this.size = 50});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Logo",
      child: SizedBox(
        width: size,
        height: size,
        child: Helpers.getSvg(AppAssetLink.logoSvg),
      ),
    );
  }
}
