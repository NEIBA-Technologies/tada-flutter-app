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

  static Future<bool?> showAlertClose(
    BuildContext context, {
    String? message,
  }) {
    return showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("Êtes-vous prêt à quitter l'application ?"),
        content: const Text(
            "Il est possible que vos produits ajoutés au panier soient perdus."),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'Continuer',
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(
              'Quitter',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  static Future<DateTime?> showBottomModalSelectDate(
    BuildContext context, {
    DateTime? initialDateTime,
    DateTime? maximumDateSelected,
    DateTime? minimumDateSelected,
    CupertinoDatePickerMode? mode,
    required DateTime selectedDate,
    required Function(DateTime) onDateTimeChanged,
    double? height,
  }) {
    return showModalBottomSheet<DateTime>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (_, setState) {
          return Container(
            padding: const EdgeInsets.all(10 * 2),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.clear),
                    )
                  ],
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (dateTimeChanged) {
                      /* if (dateTimeChanged
                          .isBefore(maximumDateSelected ?? DateTime.now())) {
                        // quand les dates postérieur au maximumDateSelected sont désactivé;
                        selectedDate = dateTimeChanged;
                      }*/
                      selectedDate = dateTimeChanged;
                      setState(() {});
                    },
                    initialDateTime: initialDateTime,
                    mode: mode ?? CupertinoDatePickerMode.date,
                    use24hFormat: true,
                    minimumDate: minimumDateSelected,
                    dateOrder: DatePickerDateOrder.dmy,
                    maximumDate: maximumDateSelected,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context, selectedDate);
                          },
                          child: const Text("Appliquer")),
                    )
                  ],
                ),
              ],
            ),
          );
        });
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
