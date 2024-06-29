import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/app_bar_widget.dart';

class ScaffoldPage extends StatelessWidget {
  final String titlePage;
  final Widget body;
  final List<Widget> actions;
  final Widget? bottomsheet;
  final Color? color;
   bool? canBack;

  ScaffoldPage(
      {super.key,
      required this.titlePage,
      this.actions = const [],
      required this.body,
      this.bottomsheet,
      this.canBack,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBarWidget(
        canBack: canBack,
        title: Text(
          titlePage,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        actions: actions,
      ),
      bottomSheet: bottomsheet != null
          ? BottomSheet(
              onClosing: () {},
              builder: (context) => bottomsheet!,
            )
          : null,
      body: body,
    );
  }
}
