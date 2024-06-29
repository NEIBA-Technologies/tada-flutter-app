import 'package:flutter/material.dart';

import '../../core/constants.dart';

class IconClose extends StatelessWidget {
  VoidCallback? onPressed;

  IconClose({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            Navigator.of(context);
          },
      icon: Icon(Icons.close, color: blackColor),
    );
  }
}
