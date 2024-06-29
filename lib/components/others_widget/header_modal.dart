import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'icon_barre_drag.dart';
import 'icon_close.dart';

class HeaderModal extends StatelessWidget {
  final Color? backgorundColor;
  final Widget child;

  const HeaderModal({super.key, this.backgorundColor, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.width / 2.1,
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(radius * 3)),
            color: backgorundColor ?? primaryColor,
          ),
          child: child,
        ),
        Positioned(
          top: 20,
          left: padding * 2,
          child:
              const Align(alignment: Alignment.centerLeft, child: IconClose()),
        ),
        const Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: IconBarreDrag(),
        )
      ],
    );
  }
}
