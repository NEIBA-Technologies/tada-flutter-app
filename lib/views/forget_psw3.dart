import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/forget_psw4.dart';
// import 'package:tada/views/connexion.dart';
import 'package:tada/widgets/app_button.dart';
import 'package:tada/widgets/app_textfield.dart';

class ForgetPSW3 extends StatefulWidget {
  const ForgetPSW3({super.key});

  @override
  _ForgetPSW3State createState() => _ForgetPSW3State();
}

class _ForgetPSW3State extends State<ForgetPSW3> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                      'asset/images/key.svg',  
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Définir un nouveau mot de passe',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const Text(
                      'Votre nouveau mot de passe doit être différent des mots de passe précédemment utilisés.',
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Mot de passe',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),
              _buildTextField(
                label: 'Mot de passe',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
              child: ContinuingButton(
                width: 361,
                height: 48,
                text: 'Réinitialiser le mot de passe',
                fontSize: 16,
                borderRadius: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ForgetPSW4())
                  );
                },
              ),
            ),
              const SizedBox(height: 10),
              Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Retour à la page de connexion
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                            'asset/images/retour.svg',
                            height: 11.67,
                            width: 11.67,
                            color: const Color(0xff48505E),
                          ),
                          const SizedBox(width: 4), // Espacement entre l'image et le texte
                          const Text(
                            'Retour à connexion',
                            style: TextStyle(color:  Color(0xff48505E)),
                          ),
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
