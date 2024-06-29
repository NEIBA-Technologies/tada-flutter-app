import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/app_bar_widget.dart';

class ScaffoldPage extends StatelessWidget {
  final String titlePage;
  final Widget body;
  final List<Widget> actions;
  final Widget? backIcon;
  final Widget? bottomsheet;
  final PreferredSizeWidget? bottom;
  final Color? color;
  bool? canBack;

  ScaffoldPage(
      {super.key,
      required this.titlePage,
      this.actions = const [],
      required this.body,
      this.bottomsheet,
      this.backIcon,
      this.canBack,
      this.color,
      this.bottom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBarWidget(params: this),
      bottomNavigationBar: bottomsheet != null
          ? BottomSheet(
              onClosing: () {},
              builder: (context) => bottomsheet!,
            )
          : null,
      body: body,
    );
  }
}
