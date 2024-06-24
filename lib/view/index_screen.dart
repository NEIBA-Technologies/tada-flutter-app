import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tada/components/params/RouterArguments.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/view/fragments/setting_fragment.dart';
import 'package:tada/view/fragments/shopping_fragment.dart';

import '../components/bottomnavigationwidget.dart';
import '../core/constants.dart';
import '../core/shared/modals.dart';
import 'fragments/demande_fragment.dart';
import 'fragments/home_fragment.dart';

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

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: context.theme.scaffoldBackgroundColor,
        systemNavigationBarColor: const Color(0xFFFDF7F1),
      ),
      child: WillPopScope(
        onWillPop: () async => await Modals.showAlertClose(context) ?? false,
        child: Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFDF7F1),
              boxShadow: boxShadowSM,
            ),
            height: kBottomNavigationBarHeight * 1.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...ButtomNavigationList.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  return Expanded(
                    child: GestureDetector(
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
      ),
    );
  }
}

final List<Map<String, dynamic>> fragmentList = [
  {'target': FragmentTarget.HOME, 'fragment': const HomeFragment()},
  {'target': FragmentTarget.REQUEST, 'fragment': const DemandeFragment()},
  {
    'target': FragmentTarget.SHOPPING_CART,
    'fragment': const ShoppingFragment()
  },
  {'target': FragmentTarget.SETTING, 'fragment': const SettingFragment()},
];
