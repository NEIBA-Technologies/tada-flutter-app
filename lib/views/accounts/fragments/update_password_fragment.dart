import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/validator/validate.dart';

import '../../../components/others_widget/app_buttom_widget.dart';
import '../../../components/others_widget/app_form_field.dart';
import '../../../components/others_widget/icon_close.dart';
import '../../../core/constants.dart';

class UpdatePasswordFragment extends StatefulWidget {
  const UpdatePasswordFragment({super.key});

  @override
  State<UpdatePasswordFragment> createState() => _UpdatePasswordFragmentState();
}

class _UpdatePasswordFragmentState extends State<UpdatePasswordFragment> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: "Modifier le mot de passe",
      actions: [IconClose()],
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
              Navigator.pop(context);
              }
            },
            label: "Enregister"),
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
                label: 'Ancien mot de passe',
                controller: _oldPasswordController,
                isObscure: true,
                validator: (value) => validateRequiredField(value, 'Ancien mot de passe'),
                
              ),
              const SpaceHeightCustom(),
              AppFormField(
                label: 'Nouveau mot de passe',
                controller: _newPasswordController,
                isObscure: true,
                validator: (value) => validateRequiredField(value, 'Nouveau mot de passe'),
              ),
              const SpaceHeightCustom(),
              AppFormField(
                label: 'Confirmer le mot de passe',
                controller: _confirmPasswordController,
                isObscure: true,
                validator: (value) => validateRequiredField(value, 'Confirmer le mot de passe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
