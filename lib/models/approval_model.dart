// To parse this JSON data, do
//
//     final approval = approvalFromMap(jsonString);

import 'dart:convert';

class Approval {
  Approval({
    required this.id,
    required this.processid,
    required this.processname,
    required this.state,
    required this.recognizer,
    required this.recognizedate,
    required this.stateid,
    required this.processorder,
    this.description,
    required this.requestedby,
    required this.requestdate,
    this.explanation,
    required this.ruser,
    required this.rdate,
    this.totalprocess,
  });

  int id;
  int processid;
  String processname;
  String requestedby;
  DateTime requestdate;
  int processorder;
  String? explanation;
  String recognizer;
  DateTime recognizedate;
  String ruser;
  DateTime rdate;
  int stateid;
  String state;
  String? description;
  int? totalprocess;

  factory Approval.fromJson(String str) => Approval.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Approval.fromMap(Map<String, dynamic> json) => Approval(
      id: json["ID"],
      processid: json["PROCESSID"],
      processname: json["PROCESSNAME"],
      state: json["STATE"],
      recognizer: json["RECOGNIZER"],
      recognizedate: DateTime.parse(json["RECOGNIZEDATE"]),
      stateid: json["STATEID"],
      processorder: json["PROCESSORDER"],
      description: json["DESCRIPTION"],
      requestedby: json["REQUESTEDBY"],
      requestdate: DateTime.parse(json["REQUESTDATE"]),
      explanation: json["EXPLANATION"],
      totalprocess: json["TOTALPROCESS"],
      ruser: json["RUSER"],
      rdate: DateTime.parse(json["RDATE"]));

  // Map<String, dynamic> toMap() => {
  //       "ID": id,
  //       "PROCESSID": processid,
  //       "PROCESSNAME": processname,
  //       "FORMID": formid,
  //       "FORMCONFIGNAME": formconfigname,
  //       "STATE": state,
  //       "RECOGNIZER": recognizer,
  //       "RECOGNIZEDATE": recognizedate?.toIso8601String(),
  //       "STATEID": stateid,
  //       "PROCESSORDER": processorder,
  //       "DESCRIPTION": description,
  //       "COMPANYID": companyid,
  //       "TENANTID": tenantid,
  //       "REQUESTEDBY": requestedby,
  //       "REQUESTDATE": requestdate?.toIso8601String(),
  //       "EXPLANATION": explanation,
  //       "STAFF": staff,
  //       "TOTALPROCESS": totalprocess
  //     };
}
