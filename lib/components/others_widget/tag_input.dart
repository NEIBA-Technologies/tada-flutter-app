import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/extensions.dart';

import '../../core/models/form_field_assignment.dart';

class TagInput extends StatefulWidget {
  final FormFieldAssignment data;
  final TextEditingController controller;

  const TagInput({super.key, required this.data, required this.controller});

  @override
  State<TagInput> createState() => _TagInputState();
}

class _TagInputState extends State<TagInput> {
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
        SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...(this.widget.data.options ?? []).map(
                    (e) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          selectedColor: primaryColor,
                          onSelected: (value) {},
                          label: Text(
                            e.label ?? "",
                            style: context.titleSmall,
                          ),
                          selected: false,
                        ),
                      );
                    },
                  )
                ],
              ),
            )),
      ],
    );
  }
}
