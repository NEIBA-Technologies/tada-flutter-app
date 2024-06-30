import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show BuildContext, ShapeBorder, TextStyle, TextTheme, Theme, ThemeData;
import 'package:intl/intl.dart' show NumberFormat, DateFormat;

import 'models/form_field_assignment.dart';

extension ThemeExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  /// 16 w600 Sora
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  /// 14 w500 Gilroy
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  /// 14 w400 Gilroy
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!; //

  /// 20 w600 Sora
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!; //

  /// 16 w500 Gilroy
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!; //

  /// 14 w600 Sora
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!; //
  ShapeBorder get shape => Theme.of(this).cardTheme.shape!; //
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
  String formatCurrency(
      {String locale = "es", int decimalDigits = 2, String symbol = "XOF"}) {
    if (isEmpty || toLowerCase() == "null") return "";

    return NumberFormat.currency(
            locale: locale, decimalDigits: decimalDigits, symbol: symbol)
        .format(double.parse(this));
  }
}

extension CurrencyFormaterInt on num {
  String formatCurrency(
      {String locale = "es", int decimalDigits = 2, String symbol = "XOF"}) {
    return NumberFormat.currency(
            locale: locale, decimalDigits: decimalDigits, symbol: symbol)
        .format(num.parse(toString()));
  }
}

extension NumberFormater on num {
  String simpleCurrency({String locale = "es", int decimalDigits = 0}) {
    final input = NumberFormat.simpleCurrency(
            locale: locale, decimalDigits: decimalDigits, name: "")
        .format(this);
    return input;
  }
}

extension NumberFormaterString on String {
  String simpleCurrency({String locale = "es", int decimalDigits = 0}) {
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

  String hummanShortWithSplash() {
    return DateFormat('dd/MM/y à HH:mm', 'fr').format(this);
  }
}

extension ListFormFieldAssignmentExt on List<FormFieldAssignment> {
  List<FormFieldAssignment> sortListByStep() {
    sort((a, b) => (a.step ?? 0) - (b.step ?? 0));
    return this;
  }

  List<FormFieldAssignment> orderList() {
    sort((a, b) => (a.order ?? 0) - (b.order ?? 0));
    return this;
  }

  Map<String, List<FormFieldAssignment>> groupByStep() {
    Map<String, List<FormFieldAssignment>> groupItem = {};

    map((e) {
      if (groupItem.containsKey("${e.step}")) {
        groupItem.update(
            '${e.step}', (value) => [...?groupItem["${e.step}"], e]);
      } else {
        groupItem['${e.step}'] = [e];
      }
    }).toList();
    if (kDebugMode) {
      print('groupItem $groupItem $this');
    }
    return groupItem;
  }
}

extension FormFieldAssignmentExt on FormFieldAssignment {
  bool isInputOf(misionType) => (this.misionType ?? "")
      .toUpperCase()
      .split("|")
      .contains(misionType.toUpperCase());
}
