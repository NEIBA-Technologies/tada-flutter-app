import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/widgets/app_button.dart';

class Carte extends StatelessWidget {
  const Carte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Mission',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          ContinuingButton(
            width: 78,
            height: 28,
            text: 'Liste',
            fontSize: 10,
            borderRadius: 31,
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const SplashScreen2())
              // );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgPicture.asset(
              'asset/images/notif_Icon.svg',
              height: 17.48,
              width: 20.0,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/carte.png'), // Remplacez par le chemin de votre image de fond
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Image.asset(
              'asset/images/Loaction.png', // Remplacez par le chemin de votre image de superposition
              width: 100, // Ajustez la taille selon vos besoins
              height: 100, // Ajustez la taille selon vos besoins
            ),
          ),
        ],
      ),
    );
  }
}
