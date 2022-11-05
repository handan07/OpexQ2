import 'dart:convert';

class TaskLog {
  TaskLog(
      {required this.id,
      required this.callid,
      required this.state,
      this.staff,
      required this.ruser,
      required this.odate,
      this.filename,
      this.subject,
      this.tdescription,
      this.tag,
      this.pdate,
      this.ptime,
      this.grade,
      required this.stateid});

  final int id;
  final int callid;
  final String state;
  final String? staff;
  final String ruser;
  final DateTime odate;
  final String? filename;
  final String? subject;
  final String? tdescription;
  final String? tag;
  final DateTime? pdate;
  final DateTime? ptime;
  final int? grade;
  final int stateid;

  factory TaskLog.fromJson(String str) => TaskLog.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TaskLog.fromMap(Map<String, dynamic> json) => TaskLog(
      id: json["ID"],
      callid: json["CALLID"],
      state: json["STATE"],
      staff: json["STAFF"],
      ruser: json["RUSER"],
      odate: DateTime.parse(json["ODATE"]),
      filename: json["FILENAME"],
      subject: json["SUBJECT"],
      tdescription: json["TDESCRIPTION"],
      tag: json["TAG"],
      pdate: json["PDATE"] != null ? DateTime.parse(json["PDATE"]) : null,
      ptime: json["PTIME"] != null ? DateTime.parse(json["PTIME"]) : null,
      grade: json["GRADE"],
      stateid: json["STATEID"]);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "CALLID": callid,
        "STATE": state,
        "STAFF": staff,
        "RUSER": ruser,
        "ODATE": odate,
        "FILENAME": filename,
        "SUBJECT": subject,
        "TDESCRIPTION": tdescription,
        "TAG": tag,
        "PDATE": pdate,
        "PTIME": ptime,
        "GRADE": grade,
        "STATEID": stateid
      };
}
