import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../core/constants.dart';

class Chipwidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool enabled;

  const Chipwidget({
    super.key,
    required this.onPressed,
    required this.label,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      color:  WidgetStatePropertyAll(enabled ? primaryColor: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      labelStyle: context.textTheme.titleSmall!
          .copyWith(color: enabled ? Colors.white : blackColor, fontSize: 13),
      side: BorderSide.none,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}
