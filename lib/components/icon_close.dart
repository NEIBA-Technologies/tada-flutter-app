import 'package:flutter/material.dart';

class IconClose extends StatelessWidget {
  const IconClose({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        margin: const EdgeInsets.only(right: 10),
        decoration: ShapeDecoration(
          color: Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      ),
    );
  }
}
