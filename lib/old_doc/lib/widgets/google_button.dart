import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final VoidCallback onPressed;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius; 

  const GoogleButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = const Color(0xff48505E),
    this.width = 368,
    this.height = 44,
    this.fontSize = 16.0,
    this.borderColor = const Color(0xffB9BDC7),
    this.borderWidth = 1,
    this.borderRadius = 8.0, 
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        'asset/images/icon/Google.svg',
        height: 24,
        width: 24,
      ),
      label: Text(
        'Continuer avec Google',
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontFamily: 'SoraR'
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height), // Taille minimale du bouton
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor, width: borderWidth), // Bordure
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius), // Arrondi des bords
        ),
      ),
    );
  }
}
