// To parse this JSON data, do
//
//     final tableReservation = tableReservationFromMap(jsonString);

import 'dart:convert';

class TableReservation {
  TableReservation({
    this.imagefile,
    this.maxpax,
    this.minpax,
    this.pleft,
    this.ptop,
    this.tableno,
    this.id,
    this.stateid,
    this.resdate,
    this.reservationid,
    this.clientname,
    this.clientid,
    this.tableid,
    this.pax,
    this.chd,
    this.total,
    this.currency,
    this.remarks,
    this.specialrequest,
    this.timeslotid,
    this.inf,
    this.reservationtype,
    this.place,
    this.checked,
    this.state,
    this.alacarteid,
    this.restime,
    this.agency,
    this.chdfree,
  });

  String? imagefile;
  int? maxpax;
  int? minpax;
  int? pleft;
  int? ptop;
  String? tableno;
  int? id;
  int? stateid;
  DateTime? resdate;
  int? reservationid;
  String? clientname;
  int? clientid;
  int? tableid;
  int? pax;
  int? chd;
  double? total;
  String? currency;
  String? remarks;
  String? specialrequest;
  int? timeslotid;
  int? inf;
  String? reservationtype;
  String? place;
  bool? checked;
  String? state;
  int? alacarteid;
  String? restime;
  String? agency;
  bool? chdfree;

  factory TableReservation.fromJson(String str) =>
      TableReservation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TableReservation.fromMap(Map<String, dynamic> json) =>
      TableReservation(
        imagefile: json["IMAGEFILE"],
        maxpax: json["MAXPAX"],
        minpax: json["MINPAX"],
        pleft: json["PLEFT"],
        ptop: json["PTOP"],
        tableno: json["TABLENO"],
        id: json["ID"],
        stateid: json["STATEID"],
        resdate:
            json["RESDATE"] == null ? null : DateTime.parse(json["RESDATE"]),
        reservationid: json["RESERVATIONID"],
        clientname: json["CLIENTNAME"],
        clientid: json["CLIENTID"],
        tableid: json["TABLEID"],
        pax: json["PAX"],
        chd: json["CHD"],
        total: json["TOTAL"],
        currency: json["CURRENCY"],
        remarks: json["REMARKS"],
        specialrequest: json["SPECIALREQUEST"],
        timeslotid: json["TIMESLOTID"],
        inf: json["INF"],
        reservationtype: json["RESERVATIONTYPE"],
        place: json["PLACE"],
        checked: json["CHECKED"],
        state: json["STATE"],
        alacarteid: json["ALACARTEID"],
        restime: json["RESTIME"],
        agency: json["AGENCY"],
        chdfree: json["CHDFREE"],
      );

  Map<String, dynamic> toMap() => {
        "IMAGEFILE": imagefile,
        "MAXPAX": maxpax,
        "MINPAX": minpax,
        "PLEFT": pleft,
        "PTOP": ptop,
        "TABLENO": tableno,
        "ID": id,
        "STATEID": stateid,
        "RESDATE": resdate?.toIso8601String(),
        "RESERVATIONID": reservationid,
        "CLIENTNAME": clientname,
        "CLIENTID": clientid,
        "TABLEID": tableid,
        "PAX": pax,
        "CHD": chd,
        "TOTAL": total,
        "CURRENCY": currency,
        "REMARKS": remarks,
        "SPECIALREQUEST": specialrequest,
        "TIMESLOTID": timeslotid,
        "INF": inf,
        "RESERVATIONTYPE": reservationtype,
        "PLACE": place,
        "CHECKED": checked,
        "STATE": state,
        "ALACARTEID": alacarteid,
        "RESTIME": restime,
        "AGENCY": agency,
        "CHDFREE": chdfree,
      };
}

class TimeSlot {
  TimeSlot({
    this.id,
    this.alacarteid,
    this.starttime,
    this.endtime,
    this.capacity,
    this.tenantid,
  });

  int? id;
  int? alacarteid;
  DateTime? starttime;
  DateTime? endtime;
  int? capacity;
  int? tenantid;

  factory TimeSlot.fromMap(Map<String, dynamic> json) => TimeSlot(
        id: json["ID"],
        alacarteid: json["ALACARTEID"],
        starttime: json["STARTTIME"] == null
            ? null
            : DateTime.parse(json["STARTTIME"]),
        endtime:
            json["ENDTIME"] == null ? null : DateTime.parse(json["ENDTIME"]),
        capacity: json["CAPACITY"],
        tenantid: json["TENANTID"],
      );
}
