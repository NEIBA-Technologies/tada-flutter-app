import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';

import '../../core/constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  List<Widget>? actions;
  String? title;
  Widget? backIcon;
  PreferredSizeWidget? bottom;
  bool? canBack = false;

  final ScaffoldPage params;

  AppBarWidget({
    super.key,
    required this.params,
  }) {
    actions = params.actions;
    title = params.titlePage;
    backIcon = params.backIcon;
    canBack = params.canBack;
    bottom = params.bottom;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 15,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: blackColor, size: 17),
      bottom: bottom,
      leading: (canBack ?? false)
          ? (backIcon ??
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ))
          : null,
      title: Text(
        "$title",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement child
  Widget get child => const SizedBox();

  @override
  Size get preferredSize =>
      Size(double.infinity, kToolbarHeight * (bottom != null ? 1.3 : 1));
}
