import 'dart:convert';

class OptionsFormFieldAssignment {
  final String? label;
  final String? value;

  OptionsFormFieldAssignment({
    this.label,
    this.value,
  });

  OptionsFormFieldAssignment copyWith({
    String? label,
    String? value,
  }) =>
      OptionsFormFieldAssignment(
        label: label ?? this.label,
        value: value ?? this.value,
      );

  factory OptionsFormFieldAssignment.fromJson(String str) =>
      OptionsFormFieldAssignment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OptionsFormFieldAssignment.fromMap(Map<String, dynamic> json) =>
      OptionsFormFieldAssignment(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "label": label,
        "value": value,
      };
}
