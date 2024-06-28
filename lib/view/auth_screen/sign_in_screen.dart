import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../components/app_buttom_widget.dart';
import '../../components/app_form_field.dart';
import '../../components/google_button.dart';
import '../../components/hero_logo.dart';
import '../../components/space_height_custom.dart';
import '../../core/constants.dart';
import '../../core/router_generator.dart';
import '../../old_doc/lib/widgets/app_textfield.dart';

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

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required bool obscureText,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
        CustomTextField(
          obscureText: obscureText,
          width: 361,
          height: 44,
        ),
      ],
    );
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
                          style: context.textTheme.titleLarge,
                        ),
                        const SpaceHeightCustom(),
                        Text(
                          'Entre tes informations personnelles',
                          style: context.textTheme.titleMedium,
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
                  const SpaceHeightCustom(breakPoint: BreakPoint.sm),
                  AppFormField(
                    label: 'Mot de passe ',
                    controller: _passwordController,
                    isObscure: true,
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
                            context.textTheme.labelSmall!.copyWith(
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
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => const ForgetPSW1())
                            // );
                          },
                          child: Text('Mot de passe oublié ?',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.labelSmall!.copyWith(
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
                        Navigator.pushReplacementNamed(
                            context, RouterGenerator.signUpRoute);
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
                              style: context.textTheme.titleSmall,
                            ),
                            TextSpan(
                              text: 'Inscription',
                              style: context.textTheme.titleSmall!
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
