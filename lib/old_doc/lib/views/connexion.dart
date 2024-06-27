import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/app_textfield.dart';
import '../widgets/google_button.dart';
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'asset/images/icon/Logomark.svg', // chemin vers votre fichier SVG
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Fait plus d’argent avec Tada  !',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const Text(
                      'Entre tes informations personnelles ',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Adresse mail',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre adresse mail';
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: 'Mot de passe',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (bool? value) {
                          setState(() {
                            _rememberMe = value ?? false;
                          });
                        },
                        checkColor: Colors.white, // Couleur de la coche
                        activeColor: Colors.red, // Couleur du fond lorsque coché
                      ),

                      const Text('Se souvenir de moi'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => const ForgetPSW1())
                      // );
                    },
                    child: const Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            //   Center(
            //   child: ContinuingButton(
            //     width: 361,
            //     height: 48,
            //     text: 'Continuer',
            //     fontSize: 16,
            //     borderRadius: 8,
            //     onPressed: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => const SignInForm())
            //       );
            //     },
            //   ),
            // ),
              const SizedBox(height: 10),
              GoogleButton(
                onPressed: () {
                  // Action pour le bouton "Continuer avec Google"
                },
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Vous n’avez pas de compte ?',
                    style: TextStyle(color: Colors.black),
                  ),
                  Spacer(), // Pour séparer les deux textes
                  Text(
                    'Inscription',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
