import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  List<Widget>? actions;
  final Widget title;
  final Widget? backIcon;
  bool? canBack = false;

  AppBarWidget({
    super.key,
    this.actions,
    required this.title,
    this.backIcon,
    this.canBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 15,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: blackColor, size: 17),
      leading: (canBack ?? false)
          ? (backIcon ??
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ))
          : null,
      title: title,
      actions: actions,
    );
  }

  @override
  // TODO: implement child
  Widget get child => const SizedBox();

  @override
  Size get preferredSize => const Size(kToolbarHeight, kToolbarHeight);
}
