import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/visite_de_magasin2.dart';
import 'package:tada/widgets/app_button.dart';

class VisiteDeMagasin1 extends StatefulWidget {
  const VisiteDeMagasin1({super.key});

  @override
  _VisiteDeMagasin1State createState() => _VisiteDeMagasin1State();
}

class _VisiteDeMagasin1State extends State<VisiteDeMagasin1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mission',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0), // Height of the Divider
          child: Container(
            color: Colors.grey, // Color of the Divider
            height: 1.0,
          ),
        ),
      ),
      extendBody: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 361,
                height: 168,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: AssetImage('asset/images/profil_picture.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Merci de participer à cette mission de visite de magasin. Votre contribution est essentielle pour nous aider à collecter des informations précises et à jour sur les magasins de nos clients. Veuillez répondre aux questions suivantes avec soin et précision.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            // Structure de colonnes et de lignes avec image SVG et texte
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRow(
                  question: 'Première question :',
                  answer: 'Votre réponse 1',
                  svgImagePath: 'asset/images/horloge_Icon.svg',
                ),
                const SizedBox(height: 10),
                _buildRow(
                  question: 'Deuxième question :',
                  answer: 'Votre réponse 2',
                  svgImagePath: 'asset/images/calendar_Icon.svg',
                ),
                const SizedBox(height: 10),
                _buildRow(
                  question: 'Troisième question :',
                  answer: 'Votre réponse 3',
                  svgImagePath: 'asset/images/money_Icon.svg',
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ContinuingButton(
                    width: 361,
                    height: 48,
                    text: 'Continuer',
                    fontSize: 16,
                    borderRadius: 8,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const VisiteDeMagasin2())
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow({
    required String question,
    required String answer,
    required String svgImagePath,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              svgImagePath,
              height: 24,
              width: 24,
              color: Colors.black, // Optionnel : changer la couleur de l'icône
            ),
            const SizedBox(width: 8),
            Text(answer),
          ],
        ),
      ],
    );
  }
}
