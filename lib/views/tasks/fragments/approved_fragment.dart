import 'package:flutter/cupertino.dart';

import '../../../components/items/assignment_item_widget.dart';
import '../../../core/constants.dart';

class ApprovedFragment extends StatelessWidget {
  const ApprovedFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(padding),
      child: ListView.builder(
        itemCount: assignmentAvailable.length.clamp(1, 1),
        itemBuilder: (context, index) {
          return AssignmentItemWidget(
            color: primaryColor,
            data: assignmentAvailable[index],
          );
        },
      ),
    );
  }
}
