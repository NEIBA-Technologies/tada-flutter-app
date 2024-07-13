import 'package:flutter/material.dart';

String? validateField(TextEditingController? controller, String? label, {bool isDropdown = false}) {
  if (controller?.text.isEmpty ?? true) {
    if (isDropdown) {
      return 'Please select something for ${label ?? ""}';
    } else {
      return 'Please enter something for ${label ?? ""}';
    }
  }
  return null;
}
