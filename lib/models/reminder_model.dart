// To parse this JSON data, do
//
//     final lost = lostFromMap(jsonString);

import 'dart:convert';

class Reminder {
  Reminder(
      {required this.id,
      required this.rdate,
      required this.ruser,
      this.checked,
      this.explanation,
      required this.reminderdate,
      required this.remindertime,
      this.mastertable,
      this.masterid});

  int id;
  DateTime rdate;
  String ruser;
  bool? checked;
  String? explanation;
  DateTime reminderdate;
  DateTime remindertime;
  String? mastertable;
  int? masterid;

  factory Reminder.fromJson(String str) => Reminder.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reminder.fromMap(Map<String, dynamic> json) => Reminder(
      id: json["ID"],
      rdate: DateTime.parse(json["RDATE"]),
      ruser: json["RUSER"],
      checked: json["CHECKED"],
      explanation: json["EXPLANATION"],
      reminderdate: DateTime.parse(json["REMINDERDATE"]),
      remindertime: DateTime.parse(json["REMINDERTIME"]),
      mastertable: json["MASTERTABLE"],
      masterid: json["MSATERID"]);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "RDATE": rdate.toIso8601String(),
        "RUSER": ruser,
        "CHECKED": checked,
        "EXPLANATION": explanation,
        "REMINDERDATE": reminderdate,
        "REMINDERTIME": remindertime,
        "MASTERTABLE": mastertable,
        "MASTERID": masterid
      };
}
