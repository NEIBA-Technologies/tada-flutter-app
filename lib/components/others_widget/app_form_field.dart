import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';

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
    this.showLabel = true,
    this.maxLines,
    this.surfixIcon,
    this.prefixIcon,
    this.validator,
  });

  Widget? surfixIcon;
  Widget? prefixIcon;
  int? maxLines;
  String label;
  bool? labelBold;
  bool? showLabel;
  String? labelHint;
  TextInputType? keyboard;
  TextEditingController? controller;
  bool isObscure;
  final Function()? onTap;
  final String? Function(String?)? validator; // ajout de la fonction validator

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel ?? false) ...[
          Text(
            label,
            style: context.labelSmall.copyWith(
                fontWeight: (labelBold ?? false) ? FontWeight.w700 : null),
          ),
          const SpaceHeightCustom(),
        ],
        TextFormField(
          decoration: InputDecoration(
            hintText: labelHint,
            suffixIcon: surfixIcon,
            prefixIcon: prefixIcon,
          ),
          obscureText: isObscure,
          controller: controller,
          onTap: onTap,
          maxLines: maxLines ?? 1,
          keyboardType: keyboard,
          validator: validator,
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
