import 'dart:convert';

class Survey {
  Survey(
      {required this.id,
      this.cdate,
      this.place,
      this.type,
      this.state,
      this.source,
      this.survey,
      this.ctime,
      this.comment,
      this.results,
      this.checkin,
      this.checkout,
      this.address,
      this.city,
      this.country,
      this.phone,
      this.cell,
      this.email,
      this.vipcode,
      this.clientname,
      this.docname,
      this.clientid,
      this.gender,
      this.nationality,
      this.agency,
      this.companyid,
      this.cscore,
      this.cno,
      this.price,
      this.currency,
      this.stateid,
      required this.rdate,
      required this.ruser,
      this.company,
      this.commentitem,
      this.resultid,
      this.channel,
      this.reservationid,
      this.staffid,
      this.statement,
      this.srdate,
      this.sruser,
      this.guestcomment,
      this.guestreply,
      this.department,
      this.field1,
      this.field2,
      this.field3,
      this.departmentid,
      this.commentsourceid,
      this.notifiername,
      this.surveyname,
      this.typeid});

  DateTime? cdate;
  String? place;
  String? type;
  String? state;
  String? source;
  String? survey;
  int id;
  DateTime? ctime;
  String? comment;
  String? results;
  DateTime? checkin;
  DateTime? checkout;
  String? address;
  String? city;
  String? country;
  String? phone;
  String? cell;
  String? email;
  String? vipcode;
  String? clientname;
  String? docname;
  int? clientid;
  String? gender;
  String? nationality;
  String? agency;
  int? companyid;
  String? cscore;
  String? cno;
  double? price;
  String? currency;
  int? stateid;
  DateTime rdate;
  String ruser;
  String? company;
  String? commentitem;
  int? resultid;
  String? channel;
  int? reservationid;
  int? staffid;
  String? statement;
  String? guestcomment;
  String? guestreply;
  String? department;
  String? field1;
  String? field2;
  String? field3;
  int? departmentid;
  int? commentsourceid;
  String? notifiername;
  int? typeid;
  String? sruser;
  DateTime? srdate;
  String? surveyname;

  factory Survey.fromJson(String str) => Survey.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Survey.fromMap(Map<String, dynamic> json) => Survey(
      id: json["ID"],
      cdate: json["CDATE"] == null ? null : DateTime.parse(json["CDATE"]),
      place: json["PLACE"],
      type: json["TYPE"],
      state: json["STATE"],
      source: json["SOURCE"],
      ctime: json["CTIME"] == null ? null : DateTime.parse(json["CTIME"]),
      comment: json["COMMENT"],
      results: json["RESULTS"],
      checkin: json["CHECKIN"] == null ? null : DateTime.parse(json["CHECKIN"]),
      checkout:
          json["CHECKOUT"] == null ? null : DateTime.parse(json["CHECKOUT"]),
      address: json["ADDRESS"],
      city: json["CITY"],
      country: json["COUNTRY"],
      phone: json["PHONE"],
      cell: json["CELL"],
      email: json["EMAIL"],
      vipcode: json["VIPCODE"],
      clientname: json["CLIENTNAME"],
      docname: json["DOCNAME"],
      clientid: json["CLIENTID"],
      gender: json["GENDER"],
      nationality: json["NATIONALITY"],
      agency: json["AGENCY"],
      companyid: json["COMPANYID"],
      cscore: json["CSCORE"],
      cno: json["CNO"],
      price:
          json["PRICE"] == null ? 0.0 : double.parse(json["PRICE"].toString()),
      currency: json["CURRENCY"],
      stateid: json["STATEID"],
      rdate: DateTime.parse(json["RDATE"]),
      ruser: json["RUSER"],
      company: json["COMPANY"],
      commentitem: json["COMMENTITEM"],
      resultid: json["RESULTID"],
      channel: json["CHANNEL"],
      reservationid: json["RESERVATIONID"],
      staffid: json["STAFFID"],
      statement: json["STATEMENT"],
      srdate: json["SRDATE"] == null ? null : DateTime.parse(json["SRDATE"]),
      sruser: json["SRUSER"],
      guestcomment: json["GUESTCOMMENT"],
      guestreply: json["GUESTREPLY"],
      department: json["DEPARTMENT"],
      field1: json["FIELD1"],
      field2: json["FIELD2"],
      field3: json["FIELD3"],
      departmentid: json["DEPARTMENTID"],
      commentsourceid: json["COMMENTSOURCEID"],
      notifiername: json["NOTIFIERNAME"],
      surveyname: json["SNAME"],
      typeid: json["TYPEID"]);

  Map<String, dynamic> toMap() => {
        "CDATE": cdate?.toIso8601String(),
        "PLACE": place,
        "TYPE": type,
        "STATE": state,
        "SOURCE": source,
        "ID": id,
        "CTIME": ctime?.toIso8601String(),
        "COMMENT": comment,
        "RESULTS": results,
        "CHECKIN": checkin?.toIso8601String(),
        "CHECKOUT": checkout?.toIso8601String(),
        "ADDRESS": address,
        "CITY": city,
        "COUNTRY": country,
        "PHONE": phone,
        "CELL": cell,
        "EMAIL": email,
        "VIPCODE": vipcode,
        "CLIENTNAME": clientname,
        "DOCNAME": docname,
        "CLIENTID": clientid,
        "GENDER": gender,
        "NATIONALITY": nationality,
        "AGENCY": agency,
        "COMPANYID": companyid,
        "CSCORE": cscore,
        "CNO": cno,
        "PRICE": price,
        "CURRENCY": currency,
        "STATEID": stateid,
        "RDATE": rdate.toIso8601String(),
        "RUSER": ruser,
        "COMPANY": company,
        "COMMENTITEM": commentitem,
        "RESULTID": resultid,
        "CHANNEL": channel,
        "RESERVATIONID": reservationid,
        "STAFFID": staffid,
        "STATEMENT": statement,
        "GUESTCOMMENT": guestcomment,
        "GUESTREPLY": guestreply,
        "DEPARTMENT": department,
        "FIELD1": field1,
        "FIELD2": field2,
        "FIELD3": field3,
        "DEPARTMENTID": departmentid,
        "COMMENTSOURCEID": commentsourceid,
        "NOTIFIERNAME": notifiername,
        "TYPEID": typeid
      };
}
