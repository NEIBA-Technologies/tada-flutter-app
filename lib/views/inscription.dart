import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/connexion.dart';
// import 'package:tada/views/connexion.dart';
import 'package:tada/widgets/app_button.dart';
import 'package:tada/widgets/app_textfield.dart';
import 'package:tada/widgets/google_button.dart'; // Import du widget GoogleButton

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
        const CustomTextField(
          obscureText: false,
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
                      'asset/images/Logomark.svg', // chemin vers votre fichier SVG
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Gagne plus d’argent avec Tada  !',
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
                label: 'Nom',
                controller: _lastNameController,
                keyboardType: TextInputType.name,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: 'Prénom',
                controller: _firstNameController,
                keyboardType: TextInputType.name,
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
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
              _buildTextField(
                label: 'Confirmez le mot de passe',
                controller: _confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez confirmer votre mot de passe';
                  }
                  if (value != _passwordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
              child: ContinuingButton(
                width: 361,
                height: 48,
                text: 'Continuer',
                fontSize: 16,
                borderRadius: 8,
                onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInForm())
                  );
                },
              ),
            ),
              const SizedBox(height: 10),
              GoogleButton(
                onPressed: () {
                  // Action pour le bouton
                }, 
                textColor: const Color(0xff48505E), 
                borderColor: const Color(0xffB9BDC7), 
                borderWidth: 1, 
                borderRadius: 8, 
              ),

              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Vous avez déjà un compte Tada ?',
                    style: TextStyle(color: Colors.black),
                  ),
                  Spacer(), // Pour séparer les deux textes
                  Text(
                    'Connexion',
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
