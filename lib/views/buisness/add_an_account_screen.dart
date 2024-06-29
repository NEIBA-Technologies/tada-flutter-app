import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/app_assets_link.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/router_generator.dart';
import 'package:tada/core/utils/helpers.dart';

import '../../components/layouts/scaffold_page.dart';
import '../../components/others_widget/app_buttom_widget.dart';
import '../../components/others_widget/app_form_field.dart';

class AddAnAccountScreen extends StatefulWidget {
  const AddAnAccountScreen({super.key});

  @override
  State<AddAnAccountScreen> createState() => _AddAnAccountScreenState();
}

class _AddAnAccountScreenState extends State<AddAnAccountScreen> {
  TextEditingController _fullNameContoller = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: "Ajouter un compte",
      canBack: true,
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                  context, RouterGenerator.removalWithdrawalRoute);
            },
            label: "Commencer"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 8,
                  child: Helpers.getSvg(AppAssetLink.smartPhoneIconSvg,
                      color: primaryColor, height: 30),
                ),
                const SpaceWidthCustom(),
                Flexible(
                  child: Text(
                    'Enregistrez un compte pour faire vos retraits d’argents',
                    textAlign: TextAlign.start,
                    style: context.labelLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFormField(
                  label: 'Nom du compte',
                  controller: _fullNameContoller,
                  keyboard: TextInputType.text,
                ),
                const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                AppFormField(
                  label: 'Numéro de téléphone',
                  controller: _phoneController,
                  keyboard: TextInputType.phone,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
