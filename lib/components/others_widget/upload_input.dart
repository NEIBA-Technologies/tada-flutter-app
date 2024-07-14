import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/models/form_field_assignment.dart';
import 'package:tada/core/validator/validate.dart';

import 'app_form_field.dart';

class UploadInput extends StatefulWidget {
  final FormFieldAssignment data;
  Function(dynamic? value) onChanged;

  UploadInput({
    super.key,
    required this.onChanged,
    required this.data,
  });

  @override
  State<UploadInput> createState() => _UploadInputState();
}

class _UploadInputState extends State<UploadInput> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: AppFormField(
        label: widget.data.label!,
        labelHint: widget.data.hint,
        labelBold: true,
        maxLines: 1,
        validator: (value) => validateRequiredField(value, widget.data.label!),
        keyboard: TextInputType.none,
        surfixIcon: Icon(
          Icons.camera_alt_outlined,
          color: greyColor,
        ),
      ),
    );
  }
}
