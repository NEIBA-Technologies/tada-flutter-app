import 'package:flutter/cupertino.dart';
import 'package:tada/components/others_widget/space_custom.dart';
import 'package:tada/core/extensions.dart';
import 'package:tada/core/models/form_field_assignment.dart';
import 'package:tada/core/validator/validate.dart';

import '../../core/shared/modals.dart';
import 'app_form_field.dart';

class DatetimeStartEndInput extends StatefulWidget {
  final FormFieldAssignment data;
  Function(DateTime value) onChanged;

  TextEditingController controller;

  DatetimeStartEndInput({
    super.key,
    required this.onChanged,
    required this.data,
    required this.controller,
  });

  @override
  State<DatetimeStartEndInput> createState() => _DatetimeStartEndInputState();
}

class _DatetimeStartEndInputState extends State<DatetimeStartEndInput> {
  List<String> hints = [];

  @override
  void initState() {
    hints = widget.data.hint!.split('|');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${widget.data.label}",
          style: context.labelSmall.copyWith(fontWeight: FontWeight.w700),
        ),
        const SpaceHeightCustom(),
        Row(children: [
          ...List.generate(
            hints.length + 1,
            (index) {
              if (index == 1) return const SpaceWidthCustom();
              return Expanded(
                child: GestureDetector(
                  onTap: () async {
                    var res = await Modals.showBottomModalSelectDate(
                      context,
                      selectedDate: DateTime.now(),
                      mode: CupertinoDatePickerMode.time,
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
                      label: "",
                      showLabel: false,
                      labelHint: index == 0 ? hints.first : hints[index - 1],
                      labelBold: true,
                      maxLines: 1,
                      validator: (value) => validateRequiredField(value, ""),
                      keyboard: TextInputType.none,
                    ),
                  ),
                ),
              );
            },
          )
        ]),
      ],
    );
  }
}
