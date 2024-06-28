import 'package:flutter/material.dart';

import '../../components/layouts/scaffold_page.dart';
import '../../core/constants.dart';

class TaskFragment extends StatefulWidget {
  const TaskFragment({super.key});

  @override
  State<TaskFragment> createState() => _TaskFragmentState();
}

class _TaskFragmentState extends State<TaskFragment> {
  @override
  Widget build(BuildContext context) {

    return ScaffoldPage(
      titlePage: 'Mes tâches',
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding * 2),
          child: const Center(
            child: Text('Tada'),
          )),
    );
  }
}
