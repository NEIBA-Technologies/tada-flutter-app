
import 'package:flutter/material.dart'
    show BuildContext, TextTheme, Theme, ThemeData;
import 'package:intl/intl.dart' show NumberFormat, DateFormat;


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

extension CurrencyFormater on String {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
// locale eu or fr_FR
  String formatCurrency({String locale = "fr", int decimalDigits = 0}) {
    if (isEmpty || toLowerCase() == "null") return "";

    return NumberFormat.currency(
            locale: locale, decimalDigits: decimalDigits, symbol: "XOF",)
        .format(double.parse(this));
  }
}

extension NumberFormater on num {
  String simpleCurrency({String locale = "fr", int decimalDigits = 0}) {
    final input = NumberFormat.simpleCurrency(
            locale: locale, decimalDigits: decimalDigits, name: "")
        .format(this);
    return input;
  }
}

extension DateFormater on DateTime {
  String yyyyMd() {
    return DateFormat('yyyy-MM-dd', 'fr').format(this);
  }

  String hhmm() {
    return DateFormat('HH:mm', 'fr').format(this);
  }


  String hummanShort() {
    return DateFormat('dd LLL y à HH:mm', 'fr').format(this);
  }
}
