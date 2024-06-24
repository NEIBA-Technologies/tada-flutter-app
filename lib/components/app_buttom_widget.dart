import 'package:flutter/material.dart';

import '../core/constants.dart';

enum SizeButton {
  xs,
  sm,
}

enum StyleButton { GREEN, DARK }

class StyleButtonColor {
  Color buttomColor = Colors.black;
  Color labelColor = Colors.white;

  StyleButtonColor({required this.buttomColor, required this.labelColor});
}

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.press,
    required this.label,
    this.sizeButton = SizeButton.sm,
    this.styleButton = StyleButton.DARK,
  });

  final Function()? press;
  final String label;
  final SizeButton sizeButton;
  final StyleButton styleButton;

  double get sizePadding {
    switch (sizeButton) {
      case SizeButton.xs:
        return padding;
      case SizeButton.sm:
        return padding * 1.6;
      default:
        return padding;
    }
  }

  StyleButtonColor get styleButtonColor {
    switch (styleButton) {
      case StyleButton.GREEN:
        return StyleButtonColor(
          buttomColor: greenColor.shade100,
          labelColor: greenColor,
        );
      case StyleButton.DARK:
        return StyleButtonColor(
          buttomColor: Colors.black,
          labelColor: Colors.white,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: sizePadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius * 2)),
          color: styleButtonColor.buttomColor,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: styleButtonColor.labelColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
