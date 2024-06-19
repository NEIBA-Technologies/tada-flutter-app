import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/inscription.dart';
import 'package:tada/widgets/app_button.dart';

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
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
              color: const Color(0xffB0E3D5),
              width: screenWidth * 0.95,
              height: screenHeight * 0.4,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                'asset/images/icon/pana3.svg',
                width: screenWidth * 0.8,
                height: screenHeight * 0.35,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Gagne de l’argent !',
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
                    MaterialPageRoute(builder: (context) => const SignUpForm()),
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
                const SizedBox(width: 10),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xffFF5B4A),
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
