import 'dart:convert';

import '../constants.dart';

class Assignment {
  final String title;
  final String icon;
  final int? price;
  final String detail;
  final String? duration;
  final String? time;
  final bool? favoris;
  // final Documenttitle value;

  Assignment({
    required this.title,
    required this.icon,
    required this.price,
    required this.detail,
    required this.duration,
    required this.time,
    required this.favoris,
    // required this.value,
  });

  factory Assignment.fromJson(String str) =>
      Assignment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Assignment.fromMap(Map<String, dynamic> json) => Assignment(
        title: json["title"],
        icon: json["icon"],
        price: json["price"],
        detail: json["detail"],
        duration: json["duration"],
        time: json["time"],
        favoris: json["favoris"],
        // value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "icon": icon,
        "price": price,
        "detail": detail,
        "duration": duration,
        "time": time,
        "favoris": favoris,
        // "value": value,
      };
}
