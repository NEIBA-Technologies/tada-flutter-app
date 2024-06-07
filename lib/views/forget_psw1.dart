import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/forget_psw2.dart';
import 'package:tada/widgets/app_button.dart';
import 'package:tada/widgets/app_textfield.dart';

class ForgetPSW1 extends StatefulWidget {
  const ForgetPSW1({super.key});

  @override
  _ForgetPSW1State createState() => _ForgetPSW1State();
}

class _ForgetPSW1State extends State<ForgetPSW1> {
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
                      'Mot de passe oublié ?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const Text(
                      'Nous vous enverrons des instructions de réinitialisation par mail.',
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
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ContinuingButton(
                      width: 361,
                      height: 48,
                      text: 'Envoyer',
                      fontSize: 16,
                      borderRadius: 8,
                      onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgetPSW2())
                        );
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
