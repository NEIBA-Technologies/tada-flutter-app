import 'package:flutter/material.dart';
import 'package:tada/core/app_assets_link.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/utils/helpers.dart';

import '../../../components/others_widget/app_buttom_widget.dart';
import '../../../components/others_widget/app_form_field.dart';
import '../../../components/others_widget/icon_outline.dart';
import '../../../components/others_widget/space_custom.dart';
import '../../../core/router_generator.dart';

class ResetPasswordStepOne extends StatefulWidget {
  const ResetPasswordStepOne({super.key});

  @override
  _ResetPasswordStepOneState createState() => _ResetPasswordStepOneState();
}

class _ResetPasswordStepOneState extends State<ResetPasswordStepOne> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Column(
                      children: [
                        IconOutline(
                          child: Helpers.getSvg(AppAssetLink.keySvg,
                              color: primaryColor),
                        ),
                        const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                        Text(
                          'Mot de passe oublié ?',
                          textAlign: TextAlign.center,
                          style: context.titleLarge,
                        ),
                        const SpaceHeightCustom(),
                        Text(
                          'Nous vous enverrons des instructions de réinitialisation par mail.',
                          textAlign: TextAlign.center,
                          style: context.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeightCustom(
                    breakPoint: BreakPoint.md,
                  ),
                  AppFormField(
                    label: 'Adresse mail',
                    controller: _emailController,
                    keyboard: TextInputType.emailAddress,
                  ),
                  const SpaceHeightCustom(breakPoint: BreakPoint.md),
                  AppButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouterGenerator.resetPasswordStepTwoRoute);
                      },
                      label: "Commencer"),
                  const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: Text("Retour à connexion",
                          style: context.titleSmall),
                      icon: Icon(
                        Icons.arrow_back,
                        color: blackColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
