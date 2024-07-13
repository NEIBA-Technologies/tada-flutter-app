import 'package:flutter/material.dart';

import '../../components/others_widget/app_buttom_widget.dart';
import '../../components/others_widget/app_form_field.dart';
import '../../components/others_widget/google_button.dart';
import '../../components/others_widget/hero_logo.dart';
import '../../components/others_widget/space_custom.dart';
import '../../core/constants.dart';
import '../../core/extensions.dart';
import '../../core/router_generator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? _validateField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ce champ est requis';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const HeroLogo(),
                      const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                      Text(
                        'Gagne plus d’argent avec Tada  !',
                        style: context.titleLarge,
                      ),
                      const SpaceHeightCustom(),
                      Text(
                        'Entre tes informations personnelles ',
                        style: context.titleMedium,
                      ),
                    ],
                  ),
                ),
                const SpaceHeightCustom(breakPoint: BreakPoint.md),
                AppFormField(
                  label: 'Nom',
                  controller: _firstNameController,
                  validator: _validateField,
                ),
                const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                AppFormField(
                  label: 'Prénom',
                  controller: _lastNameController,
                  validator: _validateField,
                ),
                const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                AppFormField(
                  label: 'Adresse mail',
                  controller: _emailController,
                  keyboard: TextInputType.emailAddress,
                  validator: _validateField,
                ),
                const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                AppFormField(
                  label: 'Mot de passe ',
                  controller: _passwordController,
                  isObscure: true,
                  validator: _validateField,
                ),
                const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                AppFormField(
                  label: 'Confirmez le mot de passe',
                  controller: _confirmPasswordController,
                  isObscure: true,
                  validator: _validateField,
                ),
                const SpaceHeightCustom(breakPoint: BreakPoint.md),
                AppButtonWidget(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.pushReplacementNamed(
                            context, RouterGenerator.signInRoute);
                      }
                    },
                    label: "Commencer"),
                const SpaceHeightCustom(),
                GoogleButton(onPressed: () {}),
                const SpaceHeightCustom(breakPoint: BreakPoint.md),
                Container(
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouterGenerator.signInRoute);
                    },
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'Vous avez déjà un compte Tada ? ',
                            style: context.titleSmall,
                          ),
                          TextSpan(
                            text: 'Connexion',
                            style: context.titleSmall
                                .copyWith(color: primaryColor),
                          ),
                        ])),
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
