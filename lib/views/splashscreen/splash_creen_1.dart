import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/splashscreen/splash_creen_2.dart';
import 'package:tada/widgets/app_button.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 13.0),
            child: TextButton(
              onPressed: () {
                // Action pour le bouton "Sauter"
              },
              child: const Text(
                'Sauter',
                style: TextStyle(
                  color: Color(0xff282828),
                  fontFamily: 'Gilroy',
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xffFFE2B0),
              width: screenWidth * 0.95, 
              height: screenHeight * 0.4, 
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'asset/images/icon/pana.svg',
                width: screenWidth * 0.8,
                height: screenHeight * 0.35,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ouvre ton compte.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'SoraSB',
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Crée ta boutique en un clic Crée ta boutique en un clic Crée ta boutique en un clic',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xff48505E),
                fontFamily: 'Gilroy',
              ),
            ),
            const SizedBox(height: 30),
            const Spacer(), 
            Center(
              child: ContinuingButton(
                width: screenWidth * 0.95,
                height: 48,
                text: 'Continuer',
                fontSize: 16,
                borderRadius: 8,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SplashScreen2()),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xffFF5B4A),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xffF0F1F3),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xffF0F1F3),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
