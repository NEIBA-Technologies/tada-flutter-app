import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/components/others_widget/space_custom.dart';

import '../../../components/others_widget/app_buttom_widget.dart';
import '../../../components/others_widget/app_form_field.dart';
import '../../../components/others_widget/icon_close.dart';
import '../../../core/constants.dart';

class ReportProblemFragment extends StatefulWidget {
  const ReportProblemFragment({super.key});

  @override
  State<ReportProblemFragment> createState() => _ReportProblemFragmentState();
}

class _ReportProblemFragmentState extends State<ReportProblemFragment> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: "Signaler un problème",
      actions: [IconClose()],
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(
            onPressed: () {
              Navigator.pop(context);
            },
            label: "Soumettre"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SpaceHeightCustom(breakPoint: BreakPoint.md),
              AppFormField(
                label: 'Titre',
                controller: _titleController,
              ),
              const SpaceHeightCustom(),
              AppFormField(
                label: 'Description',
                controller: _descriptionController,
                maxLines: 4
              ),
            ],
          ),
        ),
      ),
    );
  }
}
