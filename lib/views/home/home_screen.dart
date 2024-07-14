import 'package:flutter/material.dart';
import 'package:tada/views/home/fragments/index_home.dart';

import 'fragments/notification_fragment.dart';

class PageViewIndex {
  final int home = 0;
  final int notification = 1;
  final int list = 2;
  final int map = 3;
}

void navigationInHomeTo(int page) {
  _controllerPageView.animateToPage(
    page,
    duration: const Duration(seconds: 1),
    curve: Curves.linearToEaseOut,
  );
}

PageController _controllerPageView = new PageController();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageViewIndex pageViewIndex = new PageViewIndex();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: PageView(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        controller: _controllerPageView,
        children: const [
          IndexHome(),
          NotificationFragment(),
        ],
      ),
    );
  }
}
