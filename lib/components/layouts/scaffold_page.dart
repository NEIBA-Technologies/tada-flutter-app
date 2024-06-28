import 'package:flutter/material.dart';

class ScaffoldPage extends StatelessWidget {
  final String titlePage;
  final Widget body;
  final List<Widget> actions;

  const ScaffoldPage(
      {super.key,
      required this.titlePage,
      this.actions = const [],
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 15,
        automaticallyImplyLeading: false,
        title: Text(
          titlePage,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        actions: actions,
      ),
      body: body,
    );
  }
}
