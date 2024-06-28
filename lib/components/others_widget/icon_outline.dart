import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';

class IconOutline extends StatelessWidget {
  final Widget child;

  const IconOutline({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 50,
      height: 50,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              width: 2,
              color: greyColor.shade200,
            )),
      ),
      child: child,
    );
  }
}
