import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';

//import 'package:tada/core/constants.dart';

// ignore: must_be_immutable
class AppFormField extends StatelessWidget {
  AppFormField({
    super.key,
    required this.label,
    this.labelHint,
    this.keyboard,
    this.controller,
    this.onTap,
    this.isObscure = false,
    this.labelBold = false,  
    this.maxLines,
  });

  int? maxLines;
  String label;
  bool? labelBold;
  String? labelHint;
  TextInputType? keyboard;
  TextEditingController? controller;
  bool isObscure;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.labelSmall
              .copyWith(fontWeight: (labelBold ?? false) ? FontWeight.w700:  null),
        ),
        const SpaceHeightCustom(),
        TextFormField(
          decoration: InputDecoration(hintText: labelHint),
          obscureText: isObscure,
          controller: controller,
          onTap: onTap,
          maxLines: maxLines ?? 1,
          keyboardType: keyboard,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: blackColor,
          ),
        ),
      ],
    );
  }
}
