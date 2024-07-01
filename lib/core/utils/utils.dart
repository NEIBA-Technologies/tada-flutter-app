import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
    BorderRadius,

    BoxDecoration,
    BuildContext,
    Color,
    Colors,
    Column,
    Container,
    CrossAxisAlignment,
    EdgeInsets,
    Icons,
    InkWell,
    MainAxisAlignment,
    Navigator,
    Radius,
    RoundedRectangleBorder,
    ScaffoldMessenger,
    SnackBar,
    SnackBarAction,
    StatefulBuilder,
    Text,
    TextButton,
    TextStyle,

        showModalBottomSheet;

const List<String> imagesExtensions = ["png", "jpeg", "gif", "jpg", "tiff"];
int fromGallery = 0;
int fromCamera = 1;

scaffoldMessenger(
  context,
  String message, {
  Color? color,
  VoidCallback? onPressedAction,
  String? labelAction,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration ?? const Duration(milliseconds: 4000),
      content: Text(message),
      backgroundColor: color ?? Colors.red,
      action: SnackBarAction(
          label: labelAction ?? "",
          onPressed: () {
            if (onPressedAction != null) {
              onPressedAction();
            }
          }),
    ),
  );
}

class Modals {
  static void showCupertinoSnackBar({
    required BuildContext context,
    required String title,
    required String message,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      barrierDismissible: true,
      filter: ImageFilter.blur(tileMode: TileMode.clamp),
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(title),
        message: Text(message),
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 4000),
      () {
        Navigator.of(context).pop();
      },
    );
  }



}

class StringUtil {
  static bool isValidEmail(String str) {
    final emailRegExp = RegExp(
        r"^^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return emailRegExp.hasMatch(str);
  }

  static String hashValue(String payload) {
    // List<int> passwordEncode = utf8.encode(payload);
    // Digest passwordDigest = sha512256.convert(passwordEncode);
    // return passwordDigest.toString();
    return "";
  }
}
