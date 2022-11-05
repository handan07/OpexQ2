// To parse this JSON data, do
//
//     final lost = lostFromMap(jsonString);

import 'dart:convert';

class Handbook {
  Handbook(
      {required this.id,
      required this.rdate,
      required this.ruser,
      required this.subject,
      required this.lang,
      this.type,
      this.url});

  int id;
  DateTime rdate;
  String ruser;
  String subject;
  String lang;
  String? type;
  String? url;

  factory Handbook.fromJson(String str) => Handbook.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Handbook.fromMap(Map<String, dynamic> json) => Handbook(
        id: json["ID"],
        rdate: DateTime.parse(json["RDATE"]),
        ruser: json["RUSER"],
        subject: json["SUBJECT"],
        lang: json["LANG"],
        type: json["TYPE"],
        url: json["URL"],
      );
}
