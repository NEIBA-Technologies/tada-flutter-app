import 'package:flutter/material.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/models/form_field_assignment.dart';

class RadioInput extends StatefulWidget {
  final FormFieldAssignment data;
  final dynamic selected;
  Function(String? value) onChanged;

  RadioInput({
    super.key,
    required this.onChanged,
    required this.data,
    this.selected,
  });

  @override
  State<RadioInput> createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.data.label}",
          style: context.labelSmall.copyWith(fontWeight: FontWeight.w700),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: (widget.data.options ?? []).map(
              (it) {
                return Flexible(
                  child: RadioListTile<String>(
                    value: '${it.value}',
                    groupValue: widget.selected,
                    onChanged: widget.onChanged,
                    title: Text(
                      '${it.label}',
                      style: context.labelSmall.copyWith(),
                    ),
                    contentPadding: EdgeInsets.zero,
                    dense: false,
                  ),
                );
              },
            ).toList()),
      ],
    );
  }
}
