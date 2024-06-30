import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/core/models/page_route_setting.dart';

import '../../../components/others_widget/icon_close.dart';
import '../../../core/constants.dart';

class DisplayContentScreen extends StatefulWidget {
  final PageRouteSetting params;

  const DisplayContentScreen({super.key, required this.params});

  @override
  State<DisplayContentScreen> createState() => _DisplayContentScreenState();
}

class _DisplayContentScreenState extends State<DisplayContentScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: widget.params.title,
      actions: [IconClose()],
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: const Column(children: [Text('Contenu')]),
      ),
    );
  }
}
