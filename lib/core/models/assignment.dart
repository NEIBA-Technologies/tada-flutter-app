import 'dart:convert';

enum MissionType { spontaneous, fieldSurveys, informationTask }

class Assignment {
  final String title;
  final String icon;
  final int? gain;
  final String detail;
  final String? duration;
  final String? time;
  final bool? favoris;
  final String picture;
  final String? description;
  final String? route;
  final MissionType? type;

  Assignment({
    required this.title,
    required this.picture,
    required this.icon,
    required this.gain,
    required this.detail,
    required this.duration,
    required this.time,
    required this.favoris,
    required this.description,
    required this.route,
    this.type,
  });

  factory Assignment.fromJson(String str) =>
      Assignment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Assignment.fromMap(Map<String, dynamic> json) => Assignment(
        title: json["title"],
        icon: json["icon"],
        gain: json["gain"],
        detail: json["detail"],
        duration: json["duration"],
        time: json["time"],
        favoris: json["favoris"],
        description: json["description"],
        picture: json["picture"],
        route: json["route"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "icon": icon,
        "gain": gain,
        "detail": detail,
        "duration": duration,
        "time": time,
        "favoris": favoris,
        "description": description,
        "picture": picture,
        "route": route,
        "type": type,
      };
}
