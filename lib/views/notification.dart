import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:tada/widgets/bottom_bar.dart';

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Bar Example'),
      ),
      body: Center(
        child: Text('Current Index: $_currentIndex'),
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
