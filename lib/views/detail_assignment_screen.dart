import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tada/components/layouts/scaffold_page.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';

import '../components/others_widget/app_buttom_widget.dart';
import '../components/others_widget/space_custom.dart';
import '../core/app_assets_link.dart';
import '../core/models/assignment.dart';
import '../core/utils/helpers.dart';

class DetailAssignmentScreen extends StatefulWidget {
  DetailAssignmentScreen({super.key, required this.data});

  final Assignment data;

  @override
  State<DetailAssignmentScreen> createState() => _DetailAssignmentScreenState();
}

class _DetailAssignmentScreenState extends State<DetailAssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      titlePage: widget.data.title,
      color: Colors.white,
      canBack: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Helpers.getImage(widget.data.picture),
            ),
            const SpaceHeightCustom(),
            Text(
              "${widget.data.description}",
              style: context.labelMedium.copyWith(fontWeight: FontWeight.w600),
            ),
            const SpaceHeightCustom(
              breakPoint: BreakPoint.sm,
            ),
            _buildRowItem(
              title: "Temps estimé",
              icon: Helpers.getSvg(AppAssetLink.clockSvg),
              value: widget.data.duration,
            ),
            const SpaceHeightCustom(),
            _buildRowItem(
              title: "Jours restants",
              icon: Helpers.getSvg(AppAssetLink.calendarSvg),
              value: widget.data.time,
            ),
            const SpaceHeightCustom(),
            _buildRowItem(
              title: "Gain",
              icon: Helpers.getSvg(AppAssetLink.bankSvg),
              value: '${widget.data.gain}'.formatCurrency(),
            ),
          ],
        ),
      ),
      bottomsheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButtonWidget(
            onPressed: () {
              if (widget.data.route != null) {
                Navigator.pushNamed(context, widget.data!.route!,
                    arguments: widget.data);
              }
            },
            label: "Commencer"),
      ),
    );
  }

  _buildRowItem(
      {required String title, required SvgPicture icon, String? value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.labelLarge,
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 5),
              Text(
                "$value",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        )
      ],
    );
  }
}
