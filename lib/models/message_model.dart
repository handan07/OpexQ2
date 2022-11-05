// To parse this JSON data, do
//
//     final lost = lostFromMap(jsonString);

import 'dart:convert';

class Message {
  Message(
      {required this.id,
      required this.rdate,
      required this.senddate,
      required this.sendtime,
      this.success,
      this.jobsubject,
      this.jobbody,
      required this.jobtype,
      this.mastertable,
      this.masterid});

  int id;
  DateTime rdate;
  DateTime senddate;
  DateTime sendtime;
  bool? success;
  String? jobsubject;
  String? jobbody;
  String jobtype;
  String? mastertable;
  int? masterid;

  factory Message.fromJson(String str) => Message.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Message.fromMap(Map<String, dynamic> json) => Message(
      id: json["ID"],
      rdate: DateTime.parse(json["RDATE"]),
      senddate: DateTime.parse(json["SENDDATE"]),
      sendtime: DateTime.parse(json["SENDTIME"]),
      success: json["SUCCESS"],
      jobsubject: json["JOBSUBJECT"],
      jobbody: json["JOBBODY"],
      jobtype: json["JOBTYPE"],
      mastertable: json["MASTERTABLE"],
      masterid: json["MSATERID"]);
}
