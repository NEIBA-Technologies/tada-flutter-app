import 'package:flutter/material.dart';

class IconBarreDrag extends StatelessWidget {
  const IconBarreDrag({super.key});

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 3,
        width: MediaQuery.of(context).size.width / 6,
        decoration: ShapeDecoration(
            color: Colors.white12,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
