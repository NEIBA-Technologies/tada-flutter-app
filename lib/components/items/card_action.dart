import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../core/constants.dart';

class CardAction extends StatelessWidget {
  final Color color;
  final String title;
  final String? surfix;
  final Icon? surfixIcon;
  final Widget? prefixIcon;

  CardAction(
      {super.key,
      required this.title,
      required this.color,
      this.surfix,
      this.prefixIcon,
      this.surfixIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      surfaceTintColor: color,
      child: Padding(
        padding: EdgeInsets.all(padding * 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null) Container(
                margin: EdgeInsets.only(right: 10),
                child: prefixIcon!),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: context.titleSmall,
              ),
            ),
            if (surfix != null)
              Expanded(
                child: Text(
                  surfix!,
                  textAlign: TextAlign.end,
                  style: context.labelLarge,
                ),
              ),
            if (surfixIcon != null) Container(
                margin: EdgeInsets.only(left: 10),
                child: surfixIcon!),
          ],
        ),
      ),
    );
  }
}
