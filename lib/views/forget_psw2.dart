import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Assurez-vous d'importer flutter_svg
import 'package:tada/views/forget_psw3.dart';
import 'package:tada/widgets/app_button.dart';

class ForgetPSW2 extends StatelessWidget {
  const ForgetPSW2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'asset/images/retour.svg', // Assurez-vous que le chemin est correct
            height: 24,
            width: 24,
            color: Colors.black,
          ),
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
                  SvgPicture.asset(
                    'asset/images/mail.svg', 
                    width: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Consultez vos mails',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  const Text(
                    'Nous avons envoyé un lien de réinitialisation du mot de passe à name@yourmail.com',
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
                text: 'Ouvrir vos mails',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Vous n’avez pas reçu de mail?',
                  style: TextStyle(color: Colors.black),
                ),
                //const SizedBox(width: 5), // Espacement entre les textes
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Cliquez pour renvoyer',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
