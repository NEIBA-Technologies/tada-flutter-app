import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/utils/helpers.dart';

import '../../core/constants.dart';
import 'space_height_custom.dart';

// ignore: must_be_immutable
class ButtomNavigationWidget extends StatefulWidget {
  const ButtomNavigationWidget({
    super.key,
    required this.label,
    required this.iconPath,
    required this.selected,
  });

  final String label;
  final String iconPath;
  final bool selected;

  @override
  State<ButtomNavigationWidget> createState() => _ButtomNavigationWidgetState();
}

class _ButtomNavigationWidgetState extends State<ButtomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Helpers.getSvg(
          widget.iconPath,
          color: widget.selected ? primaryColor : greyColor,
          height: 22,
        ),
        const SpaceHeightCustom(),
        Flexible(
          child: Text(
            widget.label,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: context.textTheme.labelMedium!.copyWith(
                color: widget.selected ? primaryColor : greyColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
