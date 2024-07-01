import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';

class Modals {
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
            "Il est possible que vos donnéé renseigné dans le panier soient perdus."),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () => Navigator.of(context).pop(false),
            child:   Text(
              'Continuer',
              style: TextStyle(
                color: Colors.green
              ),
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
