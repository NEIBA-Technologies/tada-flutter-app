import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';

import '../../components/others_widget/chip_widget.dart';
import '../../core/app_assets_link.dart';
import '../../core/constants.dart';
import '../../core/utils/helpers.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {

    return ScaffoldPage(
      titlePage: 'Missions',
      actions: [
        Chipwidget(
          label: "Carte",
          onPressed: () {},
        ),
        IconButton(
          onPressed: () {},
          icon: Helpers.getSvg(AppAssetLink.notifSvg),
        )
        // Chipwidget(
        //   label: "Carte",
        //   onPressed: () {},
        //   enabled: false,
        // ),
      ],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: padding * 2),
        child: const Center(
          child: Text('Tada'),
        ),
      ),
    );
  }
}
