import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/widgets/app_button.dart';
import 'package:tada/widgets/custom_card.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

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
            text: 'Carte',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Home Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DetailPage()),
                // );
              },
              child: const CustomCard(
                title: 'Card 1 Title',
                description: 'Card 1 Description',
                leftSvgPath: 'asset/images/cam_Icon.svg',
                rightSvgPath: null,
                bottomText1: '10 000fr',
                bottomText2: '2h ago',
                leftBackgroundColor: Color(0xfffFF6E6),
                width: 361,
                height: 105,
                borderRadius: 4.0,
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DetailPage()),
                // );
              },
              child: const CustomCard(
                title: 'Card 2 Title',
                description: 'Card 2 Description',
                leftSvgPath: 'asset/images/cam_Icon.svg',
                rightSvgPath: null, // Sans image à droite
                leftBackgroundColor: Color(0xfffFF6E6),
                width: 361,
                height: 105,
                borderRadius: 4.0,
              ),
            ),
            const SizedBox(height: 16.0),

            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DetailPage()),
                // );
              },
              child: const CustomCard(
                title: 'Card 2 Title',
                description: 'Card 2 Description',
                leftSvgPath: 'asset/images/book_Icon.svg',
                rightSvgPath: null, // Sans image à droite
                leftBackgroundColor: Color(0xfffFF6E6),
                width: 361,
                height: 105,
                borderRadius: 4.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text('Missions disponibles'),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DetailPage()),
                // );
              },
              child: const CustomCard(
                title: 'Card 2 Title',
                description: 'Card 2 Description',
                leftSvgPath: 'asset/images/crisis_alert.svg',
                rightSvgPath: 'asset/images/enregistre_Icon.svg', // Sans image à droite
                leftBackgroundColor: Color(0xffFFEFED),
                width: 361,
                height: 105,
                borderRadius: 4.0,
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const DetailPage()),
                // );
              },
              child: const CustomCard(
                title: 'Card 2 Title',
                description: 'Card 2 Description',
                leftSvgPath: 'asset/images/crisis_alert.svg',
                rightSvgPath: 'asset/images/enregistre_Icon.svg', // Sans image à droite
                leftBackgroundColor: Color(0xffFFEFED),
                width: 361,
                height: 105,
                borderRadius: 4.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
