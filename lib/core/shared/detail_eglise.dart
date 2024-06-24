import 'package:flutter/material.dart';
import 'package:simple_grid/simple_grid.dart';
import 'package:tada/components/header_modal.dart';
import 'package:tada/components/items/calendarWidget.dart';
import 'package:tada/components/items/hour_item.dart';
import 'package:tada/components/layout_modal.dart';
import 'package:tada/core/constants.dart';

import 'modals.dart';

class DetailEglise extends StatefulWidget {
  final dynamic data;

  const DetailEglise({super.key, required this.data});

  @override
  State<DetailEglise> createState() => _DetailEgliseState();
}

class _DetailEgliseState extends State<DetailEglise> {
  Map<String, dynamic>? selectedIntentionCategory;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LayoutModal(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          HeaderModal(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.church,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "${widget.data['eglise']}",
                  style: TextStyle(
                      color: yellowColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${widget.data['adresse']}",
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const LocalizedCalendarWidget(),
                  const SizedBox(height: 20),
                  SpGrid(
                      width: size.width,
                      spacing: padding,
                      runSpacing: padding,
                      crossAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.start,
                      runAlignment: WrapAlignment.start,
                      children: [
                        if (widget.data['date'] != null)
                          ...List.generate(widget.data['date'].length, (index) {
                            return SpGridItem(
                                md: 2,
                                sm: 3,
                                xs: 4,
                                child: HourItem(
                                  hour: "${widget.data['date'][index]['hour']}",
                                  press: () async {
                                    await Modals.showModalDemandeMesse(
                                      context,
                                      time: "DIM 05 MAI",
                                      hour: widget.data['date'][index]['hour'],
                                      data: widget.data,
                                    );
                                  },
                                ));
                          })
                      ])
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
