import 'package:flutter/material.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/extensions.dart';

import '../../core/models/form_field_assignment.dart';

class DropdwonInput extends StatefulWidget {
  final FormFieldAssignment data;
  final TextEditingController controller;

  const DropdwonInput(
      {super.key, required this.data, required this.controller});

  @override
  State<DropdwonInput> createState() => _DropdwonInputState();
}

class _DropdwonInputState extends State<DropdwonInput> {
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
        Container(
          width: double.infinity,
          height: 45,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: DropdownMenu(
            width: double.infinity,
            expandedInsets: EdgeInsets.zero,
            textStyle: const TextStyle(fontSize: 13),
            menuStyle: MenuStyle(
              backgroundColor: const WidgetStatePropertyAll(Colors.white),
              shadowColor:
                  WidgetStatePropertyAll(context.theme.cardTheme.shadowColor),
              elevation: const WidgetStatePropertyAll(8),
            ),
            hintText: widget.data.hint,
            controller: widget.controller,
            dropdownMenuEntries: (widget.data.options ?? [])
                .map(
                  (e) => DropdownMenuEntry(
                    value: '${e.value}',
                    label: "${e.label}",
                  ),
                )
                .toList(),
            onSelected: (value) {
              // setState(() {
              // _status = value;
              // });
            },
          ),
        ),
      ],
    );
  }
}
