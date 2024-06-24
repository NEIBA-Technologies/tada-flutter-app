import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../core/constants.dart';

// ignore: must_be_immutable
class HourItem extends StatelessWidget {
  HourItem({
    super.key,
    required this.hour,
    required this.press,
  });

  final String hour;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9),
        decoration: BoxDecoration(
            color: greenColor.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(radius))),
        child: Text(
          hour,
          style: context.textTheme.labelMedium!.copyWith(
            color: greenColor
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
