import 'dart:io' show File;

import 'package:flutter/material.dart'
    show BuildContext, TextTheme, Theme, ThemeData;
import 'package:intl/intl.dart' show NumberFormat;

import 'utils/utils.dart';


extension ThemeExt on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);
}

extension StringExt on String {
  String _buildReplacement(int total, replace) {
    String s = "";
    List.generate(length - total, (index) => replace ?? "*").map((e) {
      s += e;
    }).toList();
    return s;
  }

  String customReplaceRange(int start, int end, {dynamic replace}) {
    return replaceRange(
        start, length - end, _buildReplacement(start + end, replace));
  }
}

extension DateTimeExt on DateTime {
  String formateToSend() {
    return "${toIso8601String().split("T").first}T00:00:00.000000";
  }
}

extension CurrencyFormater on String {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
// locale eu or fr_FR
  String formatCurrency({String locale = "eu", int decimalDigits = 0}) {
    if (isEmpty || toLowerCase() == "null") return "";

    return NumberFormat.currency(
            locale: locale, decimalDigits: decimalDigits, symbol: "F CFA")
        .format(double.parse(this));
  }
}

extension ExtensionParsing on File {
  bool isImage() {
    return imagesExtensions.any((element) =>
        (path.toLowerCase().contains(element) &&
            path.toLowerCase().lastIndexOf(element) > -1 &&
            path.toLowerCase().lastIndexOf(element) + element.length ==
                path.toLowerCase().length));
  }
}
