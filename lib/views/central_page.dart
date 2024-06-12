import 'package:flutter/material.dart';
import 'package:tada/views/accueil.dart';
import 'package:tada/views/portefeuil.dart';
import 'package:tada/views/profil.dart';
import 'package:tada/views/tache.dart';
import 'package:tada/widgets/bottom_bar.dart';
//import 'home_tab.dart';
//import 'search_tab.dart';
//import 'notifications_tab.dart';
//import 'profile_tab.dart';

class CentralPage extends StatefulWidget {
  const CentralPage({super.key});

  @override
  _CentralPageState createState() => _CentralPageState();
}

class _CentralPageState extends State<CentralPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const <Widget>[
          Accueil(),
          Tache(),
          Portefeuil(),
          Profil(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        items: [
          BottomBarItem(iconPath: 'asset/images/Home_Icon.svg', label: 'Home'),
          BottomBarItem(iconPath: 'asset/images/Tache_Icon.svg', label: 'Tâche'),
          BottomBarItem(iconPath: 'asset/images/Walet_Icon.svg', label: 'Portefeuil'),
          BottomBarItem(iconPath: 'asset/images/Profil_Icon.svg', label: 'Profile'),
        ],
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
