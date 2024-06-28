import 'package:flutter/material.dart';
import 'package:tada/components/layouts/scaffold_page.dart';

import '../../components/assignment_item_widget.dart';
import '../../components/others_widget/chip_widget.dart';
import '../../components/others_widget/space_height_custom.dart';
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
          onPressed: () {
            
          },
          icon: Helpers.getSvg(AppAssetLink.notifSvg),
        )
        // Chipwidget(
        //   label: "Carte",
        //   onPressed: () {},
        //   enabled: false,
        // ),
      ],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          const SpaceHeightCustom(),
         Text('Missions continues'),
          const SpaceHeightCustom(),
          
          ...assignmentContinues.map((e){
            return GestureDetector(
              child: AssignmentItemWidget(
                color: Colors.amber,
                data: e, ),
            );
          }),
           const SpaceHeightCustom(),
         Text('Missions disponibles'),
          const SpaceHeightCustom(),

           ...assignmentAvailable.map((e){
            return GestureDetector(
              child: AssignmentItemWidget(
                color: primaryColor,
                data: e, ),
            );
          }),
         ],
        ),
      ),
    );
  }
}
