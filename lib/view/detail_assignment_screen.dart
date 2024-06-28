import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';

import '../components/layouts/default_page.dart';
import '../components/others_widget/app_buttom_widget.dart';
import '../components/others_widget/space_height_custom.dart';
import '../core/app_assets_link.dart';
import '../core/models/assignment.dart';
import '../core/utils/helpers.dart';

class DetailAssignmentScreen extends StatefulWidget {
  DetailAssignmentScreen({super.key, required this.data});

  Assignment? data;

  @override
  State<DetailAssignmentScreen> createState() => _DetailAssignmentScreenState();
}

class _DetailAssignmentScreenState extends State<DetailAssignmentScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultPage(
      titlePage: '${widget.data?.title}',
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          children: [
            SizedBox(
              // height: size.height * 0.5,
              child: Center(
                child:
                    Helpers.getImage(widget.data!.picture, fit: BoxFit.contain),
              ),
            ),
            const SpaceHeightCustom(),
            Text("${widget.data?.description}"),
            const SpaceHeightCustom(
              breakPoint: BreakPoint.sm,
            ),
            Row(
              children: [
                const Expanded(
                    flex: 2,
                    child: Text("Temps estimé",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                  child: Row(
                    children: [
                      Helpers.getSvg(AppAssetLink.clock),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("${widget.data?.duration}"),
                    ],
                  ),
                )
              ],
            ),
            const SpaceHeightCustom(),
            Row(
              children: [
                const Expanded(
                    flex: 2,
                    child: Text("Jours restants",
                        style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(
                  child: Row(
                    children: [
                      Helpers.getSvg(AppAssetLink.calendar),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("${widget.data?.time}"),
                    ],
                  ),
                )
              ],
            ),
            const SpaceHeightCustom(),
            Row(
              children: [
                const Expanded(
                    flex: 2,
                    child: Text(
                      "Gain",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Expanded(
                  child: Row(
                    children: [
                      Helpers.getSvg(AppAssetLink.bank),
                      const SizedBox(
                        width: 6,
                      ),
                      Text("${widget.data?.gain}"),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomsheet: AppButtonWidget(
          onPressed: () {
            if (widget.data?.route != null)
              Navigator.pushNamed(context, widget.data!.route!,
                  arguments: widget.data);
          },
          label: "Commencer"),
    );
  }
}
