import 'package:flutter/material.dart';

import '../../core/app_assets_link.dart';
import '../../core/constants.dart';
import '../../core/utils/helpers.dart';

class TaskFragment extends StatefulWidget {
  const TaskFragment({super.key});

  @override
  State<TaskFragment> createState() => _TaskFragmentState();
}

class _TaskFragmentState extends State<TaskFragment> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 15,
        title: Row(
          children: [
            const Flexible(
              child: Text(
                'Mes tâches',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 5),

          ],
        ),

      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: padding * 2),
          child: const Center(
            child: Text('Tada'),
          )),
    );
  }
}
