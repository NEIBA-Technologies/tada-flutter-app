import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final VoidCallback onPressed;

  const GoogleButton({
    Key? key,
    required this.onPressed,
    this.backgroundColor = Colors.red,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 48.0,
    this.fontSize = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        'asset/images/google.svg', // chemin vers votre fichier SVG
        height: 24,
        width: 24,
      ),
      label: Text(
        'Continuer avec Google',
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width, height), // Taille minimale du bouton
        backgroundColor: backgroundColor,
      ),
    );
  }
}
