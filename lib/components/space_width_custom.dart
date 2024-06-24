import 'package:flutter/widgets.dart' show BuildContext, MediaQuery, SizedBox, StatelessWidget, Widget;

enum BreakPoint {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl,
}

class SpaceWidthCustom extends StatelessWidget {
  final BreakPoint breakPoint;

  const SpaceWidthCustom({
    super.key,
    this.breakPoint = BreakPoint.xs,
  });

  num get getSize {
    switch (breakPoint) {
      case BreakPoint.xs:
        return 20;
      case BreakPoint.sm:
        return 45;
      case BreakPoint.md:
        return 65;
      case BreakPoint.lg:
        return 85;
      case BreakPoint.xl:
        return 105;
      case BreakPoint.xxl:
        return 125;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.aspectRatio * getSize);
  }
}
