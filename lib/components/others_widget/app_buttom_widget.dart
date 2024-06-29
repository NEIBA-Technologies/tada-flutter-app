import 'package:flutter/material.dart';

import '../../core/constants.dart';

enum SizeButton {
  xs,
  sm,
}

enum StyleButton { ORANGE, DARK }

class StyleButtonColor {
  Color buttomColor = Colors.black;
  Color labelColor = Colors.white;

  StyleButtonColor({required this.buttomColor, required this.labelColor});
}

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.onPressed,
      this.label = "Commencer",
    this.sizeButton = SizeButton.sm,
    this.styleButton = StyleButton.ORANGE,
  });

  final Function()? onPressed;
  final String label;
  final SizeButton sizeButton;
  final StyleButton styleButton;

  double get sizePadding {
    switch (sizeButton) {
      case SizeButton.xs:
        return padding;
      case SizeButton.sm:
        return padding * 1.2;
      default:
        return padding;
    }
  }

  StyleButtonColor get styleButtonColor {
    switch (styleButton) {
      case StyleButton.ORANGE:
        return StyleButtonColor(
          buttomColor: primaryColor,
          labelColor: Colors.white,
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
    return MaterialButton(
      onPressed: onPressed,
      elevation: .7,
      color: styleButtonColor.buttomColor,
      padding: EdgeInsets.all(sizePadding),
      textColor: styleButtonColor.labelColor,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
      ),
    );
  }
}
