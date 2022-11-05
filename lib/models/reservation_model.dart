// To parse this JSON data, do
//
//     final reservation = reservationFromMap(jsonString);

import 'dart:convert';

class Reservation {
  Reservation({
    this.id,
    this.resourceid,
    this.resourcetype,
    this.resourcename,
    this.price,
    this.adultprice,
    this.chdprice,
    this.currency,
    this.starttime,
    this.endtime,
    this.capacity,
    this.reservationid,
    this.clientname,
    this.place,
    this.stateid,
    this.state,
    this.checkout,
    this.checked,
    this.checkin,
    this.reservationtype,
    this.specialrequest,
    this.remarks,
  });

  int? id;
  int? resourceid;
  String? resourcetype;
  String? resourcename;
  double? price;
  double? adultprice;
  double? chdprice;
  String? currency;
  DateTime? starttime;
  DateTime? endtime;
  int? capacity;
  int? reservationid;
  String? clientname;
  String? place;
  int? stateid;
  String? state;
  DateTime? checkout;
  bool? checked;
  DateTime? checkin;
  String? reservationtype;
  String? specialrequest;
  String? remarks;

  factory Reservation.fromJson(String str) =>
      Reservation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reservation.fromMap(Map<String, dynamic> json) => Reservation(
        id: json["ID"],
        resourceid: json["RESOURCEID"],
        resourcetype: json["RESOURCETYPE"],
        resourcename: json["RESOURCENAME"],
        price: json["PRICE"],
        adultprice: json["ADULTPRICE"],
        chdprice: json["CHDPRICE"],
        currency: json["CURRENCY"],
        starttime: json["STARTTIME"] == null
            ? null
            : DateTime.parse(json["STARTTIME"]),
        endtime:
            json["ENDTIME"] == null ? null : DateTime.parse(json["ENDTIME"]),
        capacity: json["CAPACITY"],
        reservationid: json["RESERVATIONID"],
        clientname: json["CLIENTNAME"],
        place: json["PLACE"],
        stateid: json["STATEID"],
        state: json["STATE"],
        checkout:
            json["CHECKOUT"] == null ? null : DateTime.parse(json["CHECKOUT"]),
        checked: json["CHECKED"],
        checkin:
            json["CHECKIN"] == null ? null : DateTime.parse(json["CHECKIN"]),
        reservationtype: json["RESERVATIONTYPE"],
        specialrequest: json["SPECIALREQUEST"],
        remarks: json["REMARKS"],
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "RESOURCEID": resourceid,
        "RESOURCETYPE": resourcetype,
        "RESOURCENAME": resourcename,
        "PRICE": price,
        "ADULTPRICE": adultprice,
        "CHDPRICE": chdprice,
        "CURRENCY": currency,
        "STARTTIME": starttime?.toIso8601String(),
        "ENDTIME": endtime?.toIso8601String(),
        "CAPACITY": capacity,
        "RESERVATIONID": reservationid,
        "CLIENTNAME": clientname,
        "PLACE": place,
        "STATEID": stateid,
        "STATE": state,
        "CHECKOUT": checkout?.toIso8601String(),
        "CHECKED": checked,
        "CHECKIN": checkin?.toIso8601String(),
        "RESERVATIONTYPE": reservationtype,
        "SPECIALREQUEST": specialrequest,
        "REMARKS": remarks,
      };
}
