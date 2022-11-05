import 'dart:convert';

class Comment {
  Comment(
      {required this.id,
      required this.cdate,
      this.place,
      this.type,
      this.state,
      this.source,
      this.survey,
      this.surveyid,
      required this.ctime,
      this.comment,
      this.results,
      this.checkin,
      this.checkout,
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
      this.cscore,
      this.cno,
      this.price,
      this.currency,
      this.stateid,
      required this.rdate,
      required this.ruser,
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
      this.departmentid,
      this.commentsourceid,
      this.notifiername,
      this.typeid,
      this.age,
      this.crmid,
      this.repeatcount});

  int id;
  DateTime cdate;
  String? place;
  String? type;
  String? state;
  String? source;
  String? survey;
  int? surveyid;
  DateTime ctime;
  String? comment;
  String? results;
  DateTime? checkin;
  DateTime? checkout;
  //String? address;
  //String? city;
  String? country;
  String? phone;
  String? cell;
  String? email;
  String? vipcode;
  int? repeatcount;
  int? age;
  String? clientname;
  String? docname;
  int? clientid;
  int? crmid;
  String? gender;
  String? nationality;
  String? agency;
  double? cscore;
  String? cno;
  double? price;
  String? currency;
  int? stateid;
  DateTime rdate;
  String ruser;
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

  factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
      id: json["ID"],
      cdate: DateTime.parse(json["CDATE"]),
      place: json["PLACE"],
      type: json["TYPE"],
      state: json["STATE"],
      source: json["SOURCE"],
      ctime: DateTime.parse(json["CTIME"]),
      comment: json["COMMENT"],
      results: json["RESULTS"],
      checkin: json["CHECKIN"] == null ? null : DateTime.parse(json["CHECKIN"]),
      checkout:
          json["CHECKOUT"] == null ? null : DateTime.parse(json["CHECKOUT"]),
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
      cscore: json["CSCORE"] == null ? null : json["CSCORE"] * 1.00,
      cno: json["CNO"],
      price:
          json["PRICE"] == null ? 0.0 : double.parse(json["PRICE"].toString()),
      currency: json["CURRENCY"],
      stateid: json["STATEID"],
      rdate: DateTime.parse(json["RDATE"]),
      ruser: json["RUSER"],
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
      departmentid: json["DEPARTMENTID"],
      commentsourceid: json["COMMENTSOURCEID"],
      notifiername: json["NOTIFIERNAME"],
      typeid: json["TYPEID"],
      age: json["AGE"],
      crmid: json["CRMID"],
      repeatcount: json["REPEATCOUNT"],
      survey: json["SURVEY"],
      surveyid: json["SURVEYID"]);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "CDATE": cdate,
        "PLACE": place,
        "TYPE": type,
        "STATE": state,
        "SOURCE": source,
        "CTIME": ctime,
        "COMMENT": comment,
        "RESULTS": results,
        "CHECKIN": checkin,
        "CHECKOUT": checkout,
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
        "CSCORE": cscore,
        "CNO": cno,
        "PRICE": price,
        "CURRENCY": currency,
        "STATEID": stateid,
        "RDATE": rdate,
        "RUSER": ruser,
        "COMMENTITEM": commentitem,
        "RESULTID": resultid,
        "CHANNEL": channel,
        "RESERVATIONID": reservationid,
        "STAFFID": staffid,
        "STATEMENT": statement,
        "SRDATE": srdate,
        "SRUSER": sruser,
        "GUESTCOMMENT": guestcomment,
        "GUESTREPLY": guestreply,
        "DEPARTMENT": department,
        "DEPARTMENTID": departmentid,
        "COMMENTSOURCEID": commentsourceid,
        "NOTIFIERNAME": notifiername,
        "TYPEID": typeid,
        "AGE": age,
        "CRMID": crmid,
        "REPEATCOUNT": repeatcount,
        "SURVEY": survey,
        "SURVEYID": surveyid
      };
}
