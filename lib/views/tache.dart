import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/widgets/app_button.dart';
import 'package:tada/widgets/custom_card.dart';

class Tache extends StatelessWidget {
  const Tache({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                height: 24.0,
                width: 24.0,
              ),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Favoris'),
              Tab(text: 'En attentes'),
              Tab(text: 'Approuvées'),
              Tab(text: 'Rejetées'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //favoris
            Center(
              child: Column(
                children: [
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
                      rightSvgPath: 'asset/images/enregistre_Icon.svg',
                      leftBackgroundColor: Colors.green,
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
                      rightSvgPath: 'asset/images/enregistre_Icon.svg',
                      leftBackgroundColor: Colors.green,
                      width: 361,
                      height: 105,
                      borderRadius: 4.0,
                    ),
                  ),
                ],
              ),
            ),
            //En attentes
            Center(
              child: GestureDetector(
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
                      rightSvgPath: 'asset/images/enregistre_Icon.svg',
                      leftBackgroundColor: Colors.green,
                      width: 361,
                      height: 105,
                      borderRadius: 4.0,
                    ),
                  ),
            ),
            //Approuvées
            Center(
              child: GestureDetector(
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
                      rightSvgPath: 'asset/images/enregistre_Icon.svg',
                      leftBackgroundColor: Colors.green,
                      width: 361,
                      height: 105,
                      borderRadius: 4.0,
                    ),
                  ),
            ),
            //Rejetées
            Center(
              child: GestureDetector(
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
                      rightSvgPath: 'asset/images/enregistre_Icon.svg',
                      leftBackgroundColor: Colors.green,
                      width: 361,
                      height: 105,
                      borderRadius: 4.0,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
