import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/components/others_widget/icon_close.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/app_assets_link.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/utils/helpers.dart';
import 'package:tada/core/validator/validate.dart';

import '../../../components/others_widget/app_buttom_widget.dart';
import '../../../components/others_widget/app_form_field.dart';

class UpdateAccountFragment extends StatefulWidget {
  const UpdateAccountFragment({super.key});

  @override
  State<UpdateAccountFragment> createState() => _UpdateAccountFragmentState();
}

class _UpdateAccountFragmentState extends State<UpdateAccountFragment> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScaffoldPage(
      titlePage: "Modifier le profil",
      actions: [IconClose()],
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
              Navigator.pop(context);
              }
            },
            label: "Soumettre"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            const SpaceHeightCustom(breakPoint: BreakPoint.lg),
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: SizedBox(
                      width: size.width / 4.4,
                      height: size.width / 4.4,
                      child: Helpers.getImage(AppAssetLink.userAccount)),
                ),
                Positioned(
                  right: 0,
                  bottom: -5,
                  child: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          Icons.mode_edit_outline_outlined,
                          size: 15,
                        )),
                  ),
                ),
              ],
            ),
            const SpaceHeightCustom(breakPoint: BreakPoint.md),
            AppFormField(
              label: 'Nom complet',
              controller: _fullNameController,
              validator: (value) => validateRequiredField(value, 'Nom complet'),
            ),
            const SpaceHeightCustom(),
            AppFormField(
              label: 'Adresse email',
              controller: _emailController,
              validator: (value) => validateRequiredField(value, 'Adresse email'),
            ),
            const SpaceHeightCustom(breakPoint: BreakPoint.lg),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: padding, horizontal: padding * 1.5),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    color: greyColor,
                    width: 2,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    "Ajouter plus d'informations",
                    style: context.labelLarge,
                    textAlign: TextAlign.center,
                  )),
                  Icon(
                    Icons.arrow_forward,
                    color: blackColor,
                    size: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
