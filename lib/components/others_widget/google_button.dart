import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/utils/helpers.dart';

class GoogleButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final VoidCallback onPressed;
  final double borderRadius;

  const GoogleButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = const Color(0xff48505E),
    this.width = 368,
    this.height = 44,
    this.fontSize = 16.0,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        color: Colors.white,
        padding: EdgeInsets.all(padding * 1.2),
        textColor: greyColor,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: greyColor.shade100, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Helpers.getSvg('assets/svg/Google.svg'),
            SizedBox(width: 10),
            Text(
              'Continuer avec Google',
              style: TextStyle(
                  color: greyColor,
                  fontSize: fontSize,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ));
  }
}
