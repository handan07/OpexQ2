import 'dart:convert';

class CallCenter {
  CallCenter(
      {required this.id,
      this.callid,
      required this.status,
      this.clientid,
      required this.crmid,
      this.guestname,
      this.guestphone,
      required this.lastreceivedtime,
      required this.lastreceiveddate,
      required this.hasbirthday,
      this.messagetext,
      required this.messagetype,
      this.displayname,
      this.agentname,
      this.internalparty,
      required this.typeid,
      this.msisnd,
      required this.isActive});

  final int id;
  final String? callid;
  String status;
  final int? clientid;
  final String? guestname;
  final String? guestphone;
  final int crmid;
  final String? lastreceivedtime;
  final DateTime lastreceiveddate;
  final bool hasbirthday;
  final String? messagetext;
  final String messagetype;
  final String? displayname;
  final String? agentname;
  final String? internalparty;
  final int typeid;
  final String? msisnd;
  final bool isActive;

  factory CallCenter.fromJson(String str) =>
      CallCenter.fromMap(json.decode(str));

  factory CallCenter.fromMap(Map<String, dynamic> json) => CallCenter(
      id: json["ID"],
      callid: json["CALLID"] ?? "",
      status: json["STATUS"] ?? "",
      clientid: json["CLIENTID"] ?? 0,
      guestname: json["GUESTNAME"] ?? "",
      guestphone: json["GUESTPHONE"] ?? "",
      crmid: json["CRMID"] ?? 0,
      lastreceivedtime: json["LASTRECEIVEDTIME"] ?? "",
      lastreceiveddate: DateTime.parse(json["LASTRECEIVEDDATE"]),
      hasbirthday: json["HASBIRTHDAY"] == 1 ? true : false,
      messagetext: json["MESSAGETEXT"] ?? "",
      messagetype: json["MESSAGETYPE"] ?? "text",
      displayname: json["DISPLAYNAME"] ?? "",
      agentname: json["AGENTNAME"] ?? "",
      internalparty: json["INTERNALPARTY"] ?? "",
      typeid: json["TYPEID"] ?? 2,
      msisnd: json["MSISND"] ?? "",
      isActive: json["ISACTIVE"] ?? false);
}
