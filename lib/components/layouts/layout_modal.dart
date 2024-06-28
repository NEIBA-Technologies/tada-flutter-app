import 'package:flutter/material.dart';

import '../../core/constants.dart';

class LayoutModal extends StatelessWidget {
  final Widget child;
  const LayoutModal({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: size.width,
            constraints: BoxConstraints(
              minHeight: size.height / 1.16,
              maxHeight: size.height / 1.1,
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(radius * 3)),
                ),
                color: Colors.white,
              ),
              child: child
            ),
          ),
        ),
      ),
    );
  }
}
