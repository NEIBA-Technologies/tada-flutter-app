import 'package:flutter/material.dart';

import 'space_height_custom.dart';
//import 'package:tada/core/constants.dart';

// ignore: must_be_immutable
class Formfield extends StatelessWidget {
  Formfield({
    super.key,
    required this.label,
    this.keyboard,
    this.controller,
    this.press,
    this.isObscure = false,
  });

  String label;
  TextInputType? keyboard;
  TextEditingController? controller;
  bool isObscure;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.black54),
        ),
         SpaceHeightCustom(),
        TextFormField(
          obscureText: isObscure,
          controller: controller,
          onTap: press,
          keyboardType: keyboard,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
           decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Color(0xffB9BDC7),
                    width: 0.0,
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
