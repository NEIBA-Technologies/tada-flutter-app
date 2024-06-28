import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../../components/others_widget/app_buttom_widget.dart';
import '../../../components/others_widget/app_form_field.dart';
import '../../../components/others_widget/icon_outline.dart';
import '../../../components/others_widget/space_height_custom.dart';
import '../../../core/app_assets_link.dart';
import '../../../core/constants.dart';
import '../../../core/router_generator.dart';
import '../../../core/utils/helpers.dart';

class ResetPasswordStepThree extends StatefulWidget {
  const ResetPasswordStepThree({Key? key}) : super(key: key);

  @override
  _ResetPasswordStepThreeState createState() => _ResetPasswordStepThreeState();
}

class _ResetPasswordStepThreeState extends State<ResetPasswordStepThree> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
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
                          'Définir un nouveau mot de passe',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleLarge,
                        ),
                        const SpaceHeightCustom(),
                        Text(
                          'Votre nouveau mot de passe doit être différent des mots de passe précédemment utilisés.',
                          textAlign: TextAlign.center,
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeightCustom(
                    breakPoint: BreakPoint.md,
                  ),
                  AppFormField(
                    label: 'Mot de passe',
                    controller: _passwordController,
                    keyboard: TextInputType.visiblePassword,
                    isObscure: true,
                  ),
                  Text('Doit contenir au moins 8 caractères.',style: context.textTheme.labelSmall,),
                  const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                  AppFormField(
                    label: 'Mot de passe ',
                    controller: _passwordController,
                    isObscure: true,
                  ),
                  const SpaceHeightCustom(breakPoint: BreakPoint.md),
                  AppButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RouterGenerator.resetPasswordStepFourRoute);
                      },
                      label: "Commencer"),
                  const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,RouterGenerator.signInRoute,(route) => false,);
                      },
                      label: Text("Retour à connexion",
                          style: context.textTheme.titleSmall),
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
