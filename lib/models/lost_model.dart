// To parse this JSON data, do
//
//     final lost = lostFromMap(jsonString);

import 'dart:convert';

class Lost {
  Lost(
      {required this.id,
      required this.rdate,
      required this.ruser,
      this.lfplace,
      this.lfperson,
      this.lftype,
      required this.lfdate,
      this.property,
      this.propertytype,
      this.propertyinfo,
      this.propertycolor,
      this.propertymake,
      this.propertymodel,
      this.propertygender,
      this.propertystore,
      this.status,
      this.clientid,
      this.clientname,
      this.agency,
      this.checkin,
      this.checkout,
      this.phone,
      this.email,
      this.imagelink,
      this.deliverydate,
      this.deliveryperson,
      this.deliverystaffid,
      this.deliverytype,
      this.place,
      this.reservationid,
      this.vipcode,
      this.gender,
      this.cell,
      this.address,
      this.city,
      this.country,
      this.nationality,
      this.destroydate,
      this.destroyruser,
      this.destroystaff,
      this.destroydescription,
      this.docno,
      this.isvaluable,
      this.waituntil,
      this.description,
      this.repeatcount});

  int id;
  DateTime rdate;
  String ruser;
  String? lfplace;
  String? lfperson;
  String? lftype;
  DateTime lfdate;
  String? property;
  String? propertytype;
  String? propertyinfo;
  String? propertycolor;
  String? propertymake;
  String? propertymodel;
  String? propertygender;
  String? propertystore;
  String? status;
  int? clientid;
  String? clientname;
  String? agency;
  DateTime? checkin;
  DateTime? checkout;
  String? phone;
  String? email;
  String? imagelink;
  DateTime? deliverydate;
  String? deliveryperson;
  int? deliverystaffid;
  String? deliverytype;
  String? place;
  int? reservationid;
  String? vipcode;
  String? gender;
  String? cell;
  String? address;
  String? city;
  String? country;
  String? nationality;
  DateTime? destroydate;
  String? destroyruser;
  String? destroystaff;
  String? destroydescription;
  String? docno;
  bool? isvaluable;
  DateTime? waituntil;
  String? description;
  int? repeatcount;

  factory Lost.fromJson(String str) => Lost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lost.fromMap(Map<String, dynamic> json) => Lost(
      id: json["ID"],
      rdate: DateTime.parse(json["RDATE"]),
      ruser: json["RUSER"],
      lfplace: json["LFPLACE"],
      lfperson: json["LFPERSON"],
      lftype: json["LFTYPE"],
      lfdate: DateTime.parse(json["LFDATE"]),
      property: json["PROPERTY"],
      propertytype: json["PROPERTYTYPE"],
      propertyinfo: json["PROPERTYINFO"],
      propertycolor: json["PROPERTYCOLOR"],
      propertymake: json["PROPERTYMAKE"],
      propertymodel: json["PROPERTYMODEL"],
      propertygender: json["PROPERTYGENDER"],
      propertystore: json["PROPERTYSTORE"],
      status: json["STATUS"],
      clientid: json["CLIENTID"],
      clientname: json["CLIENTNAME"],
      agency: json["AGENCY"],
      checkin: json["CHECKIN"] == null ? null : DateTime.parse(json["CHECKIN"]),
      checkout:
          json["CHECKOUT"] == null ? null : DateTime.parse(json["CHECKOUT"]),
      phone: json["PHONE"],
      email: json["EMAIL"],
      imagelink: json["IMAGELINK"],
      deliverydate: json["DELIVERYDATE"] == null
          ? null
          : DateTime.parse(json["DELIVERYDATE"]),
      deliveryperson: json["DELIVERYPERSON"],
      deliverystaffid: json["DELIVERYSTAFFID"],
      deliverytype: json["DELIVERYTYPE"],
      place: json["PLACE"],
      reservationid: json["RESERVATIONID"],
      vipcode: json["VIPCODE"],
      gender: json["GENDER"],
      cell: json["CELL"],
      address: json["ADDRESS"],
      city: json["CITY"],
      country: json["COUNTRY"],
      nationality: json["NATIONALITY"],
      destroydate: json["DESTROYDATE"] == null
          ? null
          : DateTime.parse(json["DESTROYDATE"]),
      destroyruser: json["DESTROYRUSER"],
      destroystaff: json["DESTROYSTAFF"],
      destroydescription: json["DESTROYDESCRIPTION"],
      docno: json["DOCNO"],
      isvaluable: json["ISVALUABLE"],
      waituntil:
          json["WAITUNTIL"] == null ? null : DateTime.parse(json["WAITUNTIL"]),
      description: json["DESCRIPTION"],
      repeatcount: json["REPEATCOUNT"]);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "RDATE": rdate,
        "RUSER": ruser,
        "LFPLACE": lfplace,
        "LFPERSON": lfperson,
        "LFTYPE": lftype,
        "LFDATE": lfdate,
        "PROPERTY": property,
        "PROPERTYTYPE": propertytype,
        "PROPERTYINFO": propertyinfo,
        "PROPERTYCOLOR": propertycolor,
        "PROPERTYMAKE": propertymake,
        "PROPERTYMODEL": propertymodel,
        "PROPERTYGENDER": propertygender,
        "PROPERTYSTORE": propertystore,
        "STATUS": status,
        "CLIENTID": clientid,
        "CLIENTNAME": clientname,
        "AGENCY": agency,
        "CHECKIN": checkin,
        "CHECKOUT": checkout,
        "PHONE": phone,
        "EMAIL": email,
        "IMAGELINK": imagelink,
        "DELIVERYDATE": deliverydate,
        "DELIVERYPERSON": deliveryperson,
        "DELIVERYSTAFFID": deliverystaffid,
        "DELIVERYTYPE": deliverytype,
        "PLACE": place,
        "RESERVATIONID": reservationid,
        "VIPCODE": vipcode,
        "GENDER": gender,
        "CELL": cell,
        "ADDRESS": address,
        "CITY": city,
        "COUNTRY": country,
        "NATIONALITY": nationality,
        "DESTROYDATE": destroydate,
        "DESTROYRUSER": destroyruser,
        "DESTROYSTAFF": destroystaff,
        "DESTROYDESCRIPTION": destroydescription,
        "DOCNO": docno,
        "ISVALUABLE": isvaluable,
        "WAITUNTIL": waituntil,
        "DESCRIPTION": description
      };
}
