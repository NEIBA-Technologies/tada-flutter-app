import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assurez-vous d'importer flutter_svg
import 'package:tada/views/forget_psw3.dart';
import 'package:tada/widgets/app_button.dart';

class ForgetPSW4 extends StatelessWidget {
  const ForgetPSW4({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'asset/images/greencheck.png', 
                    width: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    ' Mot de passe réinitialisé',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const Text(
                    'Votre mot de passe a été réinitialisé avec succès. Cliquez ci-dessous pour vous connecter comme par magie.',
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
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
                          MaterialPageRoute(builder: (context) => const ForgetPSW3())
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
                      'asset/images/retour.svg', // Assurez-vous que le chemin est correct
                      height: 24,
                      width: 24,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4), // Espacement entre l'image et le texte
                    const Text(
                      'Retour à la connexion',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
