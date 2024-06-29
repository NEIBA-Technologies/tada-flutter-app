import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';

import '../../../components/others_widget/app_buttom_widget.dart';
import '../../../components/others_widget/space_height_custom.dart';
import '../../../core/app_assets_link.dart';
import '../../../core/constants.dart';
import '../../../core/utils/helpers.dart'; // Assurez-vous d'importer flutter_svg

class ResetPasswordStepFour extends StatelessWidget {
  const ResetPasswordStepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Column(
                    children: [
                      Helpers.getSvg(
                        AppAssetLink.successSvg,
                        height: MediaQuery.of(context).size.width / 2.5,
                      ),
                      const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                      Text(
                        'Mot de passe réinitialisé',
                        style: context.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const SpaceHeightCustom(),
                      Text(
                        'Votre mot de passe a été réinitialisé avec succès. Cliquez ci-dessous pour vous connecter comme par magie.',
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
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouterGenerator.signInRoute,
                        (route) => false,
                      );
                    },
                    label: "Commencer"),
                const SpaceHeightCustom(breakPoint: BreakPoint.md),
                Container(
                  alignment: Alignment.center,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouterGenerator.signInRoute,
                        (route) => false,
                      );
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
    );
  }
}
