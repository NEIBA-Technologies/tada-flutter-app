import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
}
