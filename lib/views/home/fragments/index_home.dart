import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';

import '../../../components/items/assignment_item_widget.dart';
import '../../../components/layouts/scaffold_page.dart';
import '../../../components/others_widget/chip_widget.dart';
import '../../../components/others_widget/space_height_custom.dart';
import '../../../core/app_assets_link.dart';
import '../../../core/constants.dart';
import '../../../core/utils/helpers.dart';
import '../home_screen.dart';

class IndexHome extends StatefulWidget {
  const IndexHome({super.key});

  @override
  State<IndexHome> createState() => _IndexHomeState();
}

class _IndexHomeState extends State<IndexHome> {
  bool displayCard = true;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: 'Missions',
      actions: [
        Chipwidget(
          label: displayCard ? "Liste" : "Carte",
          onPressed: () {
            setState(() {
              displayCard = !displayCard;
            });
          },
        ),
        IconButton(
          onPressed: () {
            navigationInHomeTo(PageViewIndex().notification);
          },
          icon: Helpers.getSvg(AppAssetLink.notifSvg),
        )
      ],
      body: Visibility(
        visible: displayCard,
        replacement: const MissionDisplayMap(),
        child: const MissionDisplayCard(),
      ),
    );
  }
}

class MissionDisplayCard extends StatelessWidget {
  const MissionDisplayCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SpaceHeightCustom(breakPoint: BreakPoint.sm),
          Text(
            'Missions continues',
            style: context.labelLarge,
          ),
          const SpaceHeightCustom(),
          ...assignmentContinues.map((e) {
            return AssignmentItemWidget(
              color: yellowAccentColor,
              data: e,
            );
          }),
          const SpaceHeightCustom(),
          Text(
            'Missions disponibles',
            style: context.labelLarge,
          ),
          const SpaceHeightCustom(),
          ...assignmentAvailable.map((e) {
            return AssignmentItemWidget(
              color: primaryColor,
              data: e,
              canSetBookmark: true,
            );
          }),
        ],
      ),
    );
  }
}

class MissionDisplayMap extends StatelessWidget {
  const MissionDisplayMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Map'));
  }
}
