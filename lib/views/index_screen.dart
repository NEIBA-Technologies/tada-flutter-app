import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tada/components/params/router_arguments.dart';
import 'package:tada/core/app_assets_link.dart';
import 'package:tada/views/accounts/account_screen.dart';

import '../components/others_widget/bottom_navigation_widget.dart';
import '../core/constants.dart';
import '../core/shared/modals.dart';
import 'buisness/buisness_screen.dart';
import 'home/home_screen.dart';
import 'tasks/task_screen.dart';

class IndexScreen extends StatefulWidget {
  final RouterArguments? arguments;

  const IndexScreen({super.key, this.arguments});

  @override
  State<IndexScreen> createState() => _IndexScreen();
}

class _IndexScreen extends State<IndexScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    if (widget.arguments != null && widget.arguments!.fragmentTarget != null) {
      _selectedIndex = fragmentList.indexWhere(
          (element) => element["target"] == widget.arguments!.fragmentTarget!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    return WillPopScope(
      onWillPop: () async => await Modals.showAlertClose(context) ?? false,
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: boxShadowSM,
          ),
          height: kBottomNavigationBarHeight * 1.3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ...fragmentList.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: ButtomNavigationWidget(
                        label: item['label'],
                        iconPath: item['iconPath'],
                        selected: _selectedIndex == index),
                  ),
                );
              }),
            ],
          ),
        ),
        body: SafeArea(
          child: fragmentList[_selectedIndex]['fragment'],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> fragmentList = [
  {
    'iconPath': AppAssetLink.homeSvg,
    'target': FragmentTarget.HOME,
    'fragment': const HomeScreen(),
    'label': "Accueil"
  },
  {
    'iconPath': AppAssetLink.taskSvg,
    'target': FragmentTarget.TASK,
    'fragment': const TaskScreen(),
    'label': "Tâches"
  },
  {
    'iconPath': AppAssetLink.walletSvg,
    'target': FragmentTarget.BUSINESS,
    'fragment': const BusinessScreen(),
    'label': "Portefeuille"
  },
  {
    'iconPath': AppAssetLink.userSvg,
    'target': FragmentTarget.ACCOUNT,
    'fragment': const AccountScreen(),
    'label': "Compte"
  },
];
