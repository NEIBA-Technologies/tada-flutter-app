import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/carte.dart';
import 'package:tada/views/mapping/mapping_instantane1.dart';
import 'package:tada/views/notification.dart';
import 'package:tada/views/enquet_terrain/enquet_terrain1.dart';
import 'package:tada/views/tache_d_information/tache_info1.dart';
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
          'Missions ',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "SoraSB",
          ),
        ),
        actions: [
          ContinuingButton(
            width: 84,
            height: 28,
            text: 'Carte',
            fontSize: 12,
            borderRadius: 31,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Carte())
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>  NotificationsPage(),
                    transitionsBuilder: (_, animation, __, child) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: SvgPicture.asset(
                'asset/images/icon/notif_Icon.svg',
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: const Text(
                  'Missions continues',
                  style: TextStyle(
                    fontSize: 16, 
                    fontFamily: "SoraSB"
                    ),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MappingInstantane1()),
                  );
                },
                child: const CustomCard(
                  title: 'Mapping spontané',
                  description: 'Enregistrez les points clés dans votre entourage.',
                  leftSvgPath: 'asset/images/icon/cam_Icon.svg',
                  rightSvgPath: null,
                  bottomText1: '20,00 XOF',
                  bottomText2: '',
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
                  title: 'Tâche d’information',
                  description: 'Epinglé pour avoir toujours de meilleurs informations sur vous.',
                  leftSvgPath: 'asset/images/icon/profil_yellow_Icon.svg', 
                  rightSvgPath: null,
                  bottomText1: '500,00 XOF',
                  leftBackgroundColor: Color(0xfffFF6E6),
                  width: 361,
                  height: 105,
                  borderRadius: 4.0,
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TacheInfo1()),
                  );
                },
                child: const CustomCard(
                  title: 'Guide des meilleurs partiques',
                  description: 'Epinglé pour avoir toujours de meilleurs informations sur vous',
                  leftSvgPath: 'asset/images/icon/book_Icon.svg',
                  bottomText1: 'Non payé',
                  rightSvgPath: null,
                  leftBackgroundColor: Color(0xfffFF6E6),
                  width: 361,
                  height: 105,
                  borderRadius: 4.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: const Text(
                  'Missions disponibles',
                  style: TextStyle(fontSize: 16, fontFamily: "SoraSB"),
                ),
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EnquetTerrain1()),
                  );
                },
                child: const CustomCard(
                  title: 'Enquête terrain',
                  description: 'Se rendre dans un magasin pour collecter des données',
                  leftSvgPath: 'asset/images/icon/crisis_alert.svg',
                  rightSvgPath: 'asset/images/icon/enregistre_Icon.svg',
                  bottomText2: '20 à 30 min 1 jour restant',
                  bottomText1: '1000,00 XOF',
                  leftBackgroundColor: Color(0xffFFEFED),
                  width: 361,
                  height: 105,
                  borderRadius: 4.0,
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}


