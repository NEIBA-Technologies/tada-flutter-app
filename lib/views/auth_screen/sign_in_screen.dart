import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../components/others_widget/app_buttom_widget.dart';
import '../../components/others_widget/app_form_field.dart';
import '../../components/others_widget/google_button.dart';
import '../../components/others_widget/hero_logo.dart';
import '../../components/others_widget/space_custom.dart';
import '../../core/constants.dart';
import '../../core/router_generator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                        const HeroLogo(),
                        const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                        Text(
                          'Fait plus d’argent avec Tada !',
                          style: context.titleLarge,
                        ),
                        const SpaceHeightCustom(),
                        Text(
                          'Entre tes informations personnelles',
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
                    validator: _validateField,
                  ),
                  const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                  AppFormField(
                    label: 'Mot de passe ',
                    controller: _passwordController,
                    isObscure: true,
                    validator: _validateField,
                  ),
                  const SpaceHeightCustom(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CheckboxMenuButton(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        style: ButtonStyle(
                          padding:
                              const WidgetStatePropertyAll(EdgeInsets.zero),
                          overlayColor:
                              const WidgetStatePropertyAll(Colors.transparent),
                          textStyle: WidgetStatePropertyAll(
                            context.labelSmall.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        child: const Text('Se souvenir de moi'),
                      ),
                      Flexible(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context,
                                RouterGenerator.resetPasswordStepOneRoute);
                          },
                          child: Text('Mot de passe oublié ?',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.labelSmall.copyWith(
                                color: primaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SpaceHeightCustom(breakPoint: BreakPoint.md),
                  AppButtonWidget(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.pushNamed(
                              context, RouterGenerator.indexRoute);
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
                        Navigator.pushNamed(
                            context, RouterGenerator.signUpRoute);
                      },
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text: 'Vous n’avez pas de compte ? ',
                              style: context.titleSmall,
                            ),
                            TextSpan(
                              text: 'Inscription',
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
      ),
    );
  }
}
