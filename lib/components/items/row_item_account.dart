import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';

import '../../core/app_assets_link.dart';
import '../../core/utils/helpers.dart';

class RowItemAccount extends StatelessWidget {
  final String title;
  final String subtitle;
  bool isSelected = false;

  RowItemAccount(
      {required this.title,
      required this.subtitle,
      this.isSelected = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isSelected ? const Color(0xffFF5B4A) : Colors.transparent,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Helpers.getSvg(
            AppAssetLink.basketIconSvg,
            height: 30,
            color: blackColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: context.labelLarge),
                Text(subtitle, style: context.titleSmall),
              ],
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: isSelected ? 1 : 0,
            curve: Curves.bounceInOut,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Helpers.getSvg(
                AppAssetLink.redCheckSvg,
                height: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
