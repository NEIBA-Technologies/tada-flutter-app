import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/old_doc/lib/widgets/app_button.dart';

import '../../../old_doc/lib/widgets/app_textfield.dart';

class ResetPasswordStepThree extends StatefulWidget {
  const ResetPasswordStepThree({Key? key}) : super(key: key);

  @override
  _ResetPasswordStepThreeState createState() => _ResetPasswordStepThreeState();
}

class _ResetPasswordStepThreeState extends State<ResetPasswordStepThree> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'asset/images/icon/key.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Définir un nouveau mot de passe',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Votre nouveau mot de passe doit être différent des mots de passe précédemment utilisés.',
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  label: 'Nouveau mot de passe',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez entrer votre nouveau mot de passe';
                    }
                    return null;
                  },
                ),
                _buildTextField(
                  label: 'Confirmer le mot de passe',
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Veuillez confirmer votre mot de passe';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ContinuingButton(
                  width: 361,
                  height: 48,
                  text: 'Réinitialiser le mot de passe',
                  fontSize: 16,
                  borderRadius: 8,
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const ForgetPSW4()),
                    // );
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Retour à la page de connexion
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'asset/images/icon/retour.svg',
                        height: 11.67,
                        width: 11.67,
                        color: const Color(0xff48505E),
                      ),
                      const SizedBox(width: 4), // Espacement entre l'image et le texte
                      const Text(
                        'Retour à connexion',
                        style: TextStyle(color: Color(0xff48505E)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
