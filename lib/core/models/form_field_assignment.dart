import 'options_form_field_assignment.dart';
import 'dart:convert';

enum TypeFormFieldAssignment {
  TEXT,
  COVER,
  DROPDWON,
  MAP,
  MAP_WITH_PREVIEW,
  DATE_TIME,
  RADIO,
  PHONE,
  NUMERIC,
  TEXT_AREA,
  DATE_TIME_START_END,
  TAG
}


class FormFieldAssignment {
  final String? label;
  final String? type;
  final String? hint;
  final String? key;
  final int? order;
  final int? step;
  final dynamic validation;
  final List<OptionsFormFieldAssignment>? options;

  final String? misionType;

  FormFieldAssignment({
    this.label,
    this.type,
    this.hint,
    this.key,
    this.order,
    this.step,
    this.validation,
    this.options,
    this.misionType,
  });

  FormFieldAssignment copyWith({
    String? label,
    String? type,
    String? hint,
    String? key,
    int? order,
    int? step,
    dynamic validation,
    List<OptionsFormFieldAssignment>? options,
    String? misionType,
  }) =>
      FormFieldAssignment(
        label: label ?? this.label,
        type: type ?? this.type,
        hint: hint ?? this.hint,
        key: key ?? this.key,
        order: order ?? this.order,
        step: step ?? this.step,
        validation: validation ?? this.validation,
        options: options ?? this.options,
        misionType: misionType ?? this.misionType,
      );

  factory FormFieldAssignment.fromJson(String str) =>
      FormFieldAssignment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FormFieldAssignment.fromMap(Map<String, dynamic> json) =>
      FormFieldAssignment(
        label: json["label"],
        type: json["type"],
        hint: json["hint"],
        key: json["key"],
        order: json["order"],
        step: json["step"],
        validation: json["validation"],
        options: json["options"] == null ? [] :
        List<OptionsFormFieldAssignment>.from(json["options"]!.map((x) =>
            OptionsFormFieldAssignment(label: x, value: x))
        ).toList(),
        misionType: json["misionType"],
      );

  Map<String, dynamic> toMap() =>
      {
        "label": label,
        "type": type,
        "hint": hint,
        "key": key,
        "order": order,
        "step": step,
        "validation": validation,
        "options": options == null ? [] : List<dynamic>.from(
            options!.map((x) => x)),
        "misionType": misionType,
      };
}

