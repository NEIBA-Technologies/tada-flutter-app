import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
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
            'Mes tâches',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelColor: Color(0xff282828),
            unselectedLabelColor: Color(0xff667085),
            indicatorColor: Color(0xff282828),
            indicatorPadding: EdgeInsets.symmetric(vertical: 12.0),
            labelPadding: EdgeInsets.only(left: 5.0, right: 5.0),
            indicatorWeight: 3,
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
            // Favoris
            SingleChildScrollView(
              child: Center(
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
                        leftSvgPath: 'asset/images/crisis_alert.svg',
                        rightSvgPath: 'asset/images/enregistre_Icon.svg',
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
                        rightSvgPath: 'asset/images/enregistre_Icon.svg',
                        leftBackgroundColor: Color(0xffFFEFED),
                        width: 361,
                        height: 105,
                        borderRadius: 4.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // En attentes
            SingleChildScrollView(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const DetailPage()),
                    // );
                  },
                  child: const CustomCard(
                    title: 'Card 3 Title',
                    description: 'Card 3 Description',
                    leftSvgPath: 'asset/images/crisis_alert.svg',
                    rightSvgPath: null,
                    leftBackgroundColor: Color(0xffFFEFED),
                    width: 361,
                    height: 105,
                    borderRadius: 4.0,
                  ),
                ),
              ),
            ),
            // Approuvées
            SingleChildScrollView(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const DetailPage()),
                    // );
                  },
                  child: const CustomCard(
                    title: 'Card 4 Title',
                    description: 'Card 4 Description',
                    leftSvgPath: 'asset/images/crisis_alert.svg',
                    rightSvgPath: null,
                    leftBackgroundColor: Color(0xffFFEFED),
                    width: 361,
                    height: 105,
                    borderRadius: 4.0,
                  ),
                ),
              ),
            ),
            // Rejetées
            SingleChildScrollView(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const DetailPage()),
                    // );
                  },
                  child: const CustomCard(
                    title: 'Card 5 Title',
                    description: 'Card 5 Description',
                    leftSvgPath: 'asset/images/crisis_alert.svg',
                    rightSvgPath: null,
                    leftBackgroundColor: Color(0xffFFEFED),
                    width: 361,
                    height: 105,
                    borderRadius: 4.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
