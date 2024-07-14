import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../../components/others_widget/app_buttom_widget.dart';
import '../../../components/others_widget/icon_outline.dart';
import '../../../components/others_widget/space_custom.dart';
import '../../../core/app_assets_link.dart';
import '../../../core/constants.dart';
import '../../../core/router_generator.dart';
import '../../../core/utils/helpers.dart';

class ResetPasswordStepTwo extends StatelessWidget {
    ResetPasswordStepTwo({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

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
                          child: Helpers.getSvg(AppAssetLink.mailSvg,
                              color: primaryColor),
                        ),
                        const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                        Text(
                          'Consultez vos mails',
                          textAlign: TextAlign.center,
                          style: context.titleLarge,
                        ),
                        const SpaceHeightCustom(),
                        Text(
                          'Nous avons envoyé un lien de réinitialisation du mot de passe à name@yourmail.com',
                          textAlign: TextAlign.center,
                          style: context.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SpaceHeightCustom(
                    breakPoint: BreakPoint.md,
                  ),

                  const SpaceHeightCustom(breakPoint: BreakPoint.md),
                  AppButtonWidget(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, RouterGenerator.resetPasswordStepThreeRoute);
                        }
                      },
                      label: "Commencer"),
                  const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                  Container(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {

                      },
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Vous n’avez pas reçu de mail? ',
                              style: context.titleSmall,
                            ),
                            TextSpan(
                              text: 'Cliquez pour renvoyer',
                              style: context.titleSmall
                                  .copyWith(color: primaryColor),
                            ),
                          ])),
                    ),
                  ),

                  const SpaceHeightCustom(breakPoint: BreakPoint.md),

                  Container(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,RouterGenerator.signInRoute,(route) => false,);
                      },
                      label: Text("Retour à la connexion",
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
