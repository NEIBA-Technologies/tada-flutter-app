import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/views/accueil.dart';
import 'package:tada/views/notification.dart';
import 'package:tada/widgets/app_button.dart';

class Carte extends StatelessWidget {
  const Carte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        title: const Text(
          'Cartes',
          style: TextStyle(
            fontSize: 20,
            fontFamily: "SoraSB"
          ),
        ),
        actions: [
          ContinuingButton(
            width: 84,
            height: 28,
            text: 'Liste',
            fontSize: 12,
            borderRadius: 31,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Accueil())
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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/image/carte.png'), 
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Image.asset(
              'asset/images/image/Loaction.png', 
              width: 100, 
              height: 100, 
            ),
          ),
        ],
      ),
    );
  }
}
