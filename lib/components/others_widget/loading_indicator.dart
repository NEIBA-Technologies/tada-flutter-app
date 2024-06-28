import 'package:flutter/material.dart'
    show
        BuildContext,
        CircularProgressIndicator,
        Color,
        Container,
        EdgeInsets,
        StatelessWidget,
        StrokeCap,
        Widget;

import '../../core/constants.dart';

class LoadingIndicator extends StatelessWidget {
  final Color? color;
  final double width;
  final double height;
  final double strokeWidth;

  const LoadingIndicator(
      {super.key,
      this.color,
      this.strokeWidth = 1.5,
      this.width = 15,
      this.height = 15});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.all(8),
      child: CircularProgressIndicator(
        strokeCap: StrokeCap.round,
        strokeWidth: strokeWidth,
        color: color ?? primaryColor,
      ),
    );
  }
}
