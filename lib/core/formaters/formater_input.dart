import 'package:flutter/services.dart';
import 'package:tada/core/extensions.dart';

class UpperCaseFirstLetter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String text = newValue.text;
    return newValue.copyWith(
      text:
          '${text.substring(0, 1).toUpperCase()}${text.substring(1, text.length)}',
    );
  }
}

class UpperCaseAllLetter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String text = newValue.text;
    return newValue.copyWith(
      text: text.toUpperCase(),
    );
  }
}

class FormateAmountCurrency extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String text = newValue.text
        .split(',')
        .first
        .split(".")
        .join("")
        .formatCurrency(symbol: "", decimalDigits: 1);
    return newValue.copyWith(text: text);
  }
}
