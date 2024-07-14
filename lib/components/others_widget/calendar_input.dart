import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tada/core/constants.dart';
import 'package:tada/core/models/form_field_assignment.dart';
import 'package:tada/core/validator/validate.dart';

import '../../core/shared/modals.dart';
import 'app_form_field.dart';

class CalendarInput extends StatefulWidget {
  final FormFieldAssignment data;
  Function(DateTime value) onChanged;

  TextEditingController controller;

  CupertinoDatePickerMode? mode;

  CalendarInput({
    super.key,
    required this.onChanged,
    required this.data,
    required this.controller,
    this.mode,
  });

  @override
  State<CalendarInput> createState() => _CalendarInputState();
}

class _CalendarInputState extends State<CalendarInput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        var res = await Modals.showBottomModalSelectDate(
          context,
          selectedDate: DateTime.now(),
          mode: widget.mode ?? CupertinoDatePickerMode.date,
          minimumDateSelected: DateTime.now(),
          onDateTimeChanged: (p0) {
            // print('PRINT .. ${p0}');
          },
        );
        if (res != null) {
          widget.onChanged(res);
          setState(() {});
        }
      },
      child: AbsorbPointer(
        absorbing: true,
        child: AppFormField(
          label: widget.data.label!,
          labelHint: widget.data.hint,
          labelBold: true,
          maxLines: 1,
          validator: (value) => validateRequiredField(value, widget.data.label!),
          controller: widget.controller,
          keyboard: TextInputType.none,
          surfixIcon: Icon(
            Icons.calendar_today_outlined,
            color: greyColor,
          ),
        ),
      ),
    );
  }
}
