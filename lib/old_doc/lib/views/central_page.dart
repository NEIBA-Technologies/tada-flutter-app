// import 'package:flutter/material.dart';
//
// import '../widgets/bottom_bar.dart';
// import 'accueil.dart';
// import 'portefeuil/portefeuil.dart';
// import 'profile/profil.dart';
// import 'tache.dart';
// class CentralPage extends StatefulWidget {
//   const CentralPage({super.key});
//
//   @override
//   _CentralPageState createState() => _CentralPageState();
// }
//
// class _CentralPageState extends State<CentralPage> {
//   int _currentIndex = 0;
//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];
//
//   // Liste des indices pour lesquels afficher la BottomBar
//   final List<int> _bottomBarVisibleIndices = [0,1, 2, 3]; // Affiche sur Tache, Portefeuil, Profil
//
//   void _onTabTapped(int index) {
//     if (index == _currentIndex) {
//       _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
//     } else {
//       setState(() {
//         _currentIndex = index;
//       });
//     }
//   }
//
//   Widget _buildOffstageNavigator(int index) {
//     return Offstage(
//       offstage: _currentIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//             builder: (context) {
//               switch (index) {
//                 case 0:
//                   return const Accueil();
//                 case 1:
//                   return const Tache();
//                 case 2:
//                   return Portefeuil();
//                 case 3:
//                   return const Profil();
//                 default:
//                   return const Accueil();
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool bottomBarVisible = _bottomBarVisibleIndices.contains(_currentIndex);
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           _buildOffstageNavigator(0),
//           _buildOffstageNavigator(1),
//           _buildOffstageNavigator(2),
//           _buildOffstageNavigator(3),
//         ],
//       ),
//       bottomNavigationBar: bottomBarVisible
//           ? BottomBar(
//               items: [
//                 BottomBarItem(iconPath: 'asset/images/icon/Home_Icon.svg', label: 'Home'),
//                 BottomBarItem(iconPath: 'asset/images/icon/Tache_Icon.svg', label: 'Tâche'),
//                 BottomBarItem(iconPath: 'asset/images/icon/Walet_Icon.svg', label: 'Portefeuil'),
//                 BottomBarItem(iconPath: 'asset/images/icon/Profil_Icon.svg', label: 'Profile'),
//               ],
//               currentIndex: _currentIndex,
//               onTap: _onTabTapped,
//             )
//           : null,
//     );
//   }
// }
