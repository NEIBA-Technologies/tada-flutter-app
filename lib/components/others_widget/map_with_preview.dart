import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/extensions.dart';

import '../../core/constants.dart';
import '../../core/models/form_field_assignment.dart';
import 'app_form_field.dart';

class MapWithPreview extends StatefulWidget {
  const MapWithPreview(
      {super.key, required this.data, required this.controller});

  final FormFieldAssignment data;
  final TextEditingController controller;

  @override
  State<MapWithPreview> createState() => _MapWithPreviewState();
}

class _MapWithPreviewState extends State<MapWithPreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.data.label}",
          style: context.labelSmall.copyWith(fontWeight: FontWeight.w700),
        ),
        const SpaceHeightCustom(),
        AbsorbPointer(
          absorbing: true,
          child: AppFormField(
            label: widget.data.label!,
            labelHint: widget.data.hint,
            showLabel: false,
            labelBold: true,
            maxLines: 1,
            keyboard: TextInputType.none,
            surfixIcon: Icon(
              Icons.my_location_outlined,
              color: greyColor,
            ),
          ),
        ),
        const SpaceHeightCustom(),
        Container(
          width: double.infinity,
          height: 130,

          padding: EdgeInsets.all(padding),
          margin: EdgeInsets.only(bottom: 5),
          decoration: ShapeDecoration(
            color: greyColor.shade50,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                width: 1,
                color: greyColor.shade200
              )
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Text(
                    "Aperçu position sur carte",
                    style: context.labelSmall
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 7),
                    decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        )),
                    child: const Text(
                      'Modifier sur la carte',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: fontSecondary,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
