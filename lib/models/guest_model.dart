// To parse this JSON data, do
//
//     final clientReservation = clientReservationFromMap(jsonString);

import 'dart:convert';

class Guest {
  Guest(
      {this.id,
      required this.reservationstate,
      this.adult,
      this.roomnumber,
      this.address,
      this.country,
      this.nation,
      this.zipcode,
      this.city,
      this.bdate,
      this.roomtype,
      this.chdN,
      this.infN,
      this.free,
      this.clientid,
      this.pension,
      this.reservationid,
      this.checkin,
      this.checkout,
      this.vipcode,
      this.reservationno,
      this.reservationnameid,
      this.agency,
      this.title,
      this.cintime,
      this.couttime,
      this.gender,
      this.checkinnote,
      this.checkoutnote,
      this.repeatcount,
      this.age,
      this.firstname,
      this.lastname,
      this.clientname,
      this.phone,
      this.cell,
      this.email,
      this.extrabed,
      this.cribs,
      this.comment,
      this.lf,
      this.task,
      this.action,
      this.conversation,
      this.follow,
      this.hasbirthday,
      this.review});

  String? reservationstate;
  int? adult;
  String? roomnumber;
  String? address;
  String? country;
  String? nation;
  String? zipcode;
  String? city;
  String? bdate;
  String? roomtype;
  int? chdN;
  int? infN;
  int? free;
  int? clientid;
  String? pension;
  int? reservationid;
  DateTime? checkin;
  DateTime? checkout;
  String? vipcode;
  int? id;
  String? reservationno;
  int? reservationnameid;
  String? agency;
  String? title;
  String? cintime;
  String? couttime;
  String? gender;
  String? checkinnote;
  String? checkoutnote;
  int? repeatcount;
  int? age;
  String? firstname;
  String? lastname;
  String? clientname;
  String? phone;
  String? cell;
  String? email;
  bool? extrabed;
  bool? cribs;
  int? comment;
  int? task;
  int? lf;
  int? action;
  int? conversation;
  int? review;
  int? follow;
  bool? hasbirthday;

  factory Guest.fromJson(String str) => Guest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Guest.fromMap(Map<String, dynamic> json) => Guest(
      id: json["ID"],
      reservationstate: json["RESERVATIONSTATE"],
      adult: json["ADULT"],
      roomnumber: json["ROOMNUMBER"],
      address: json["ADDRESS"],
      country: json["COUNTRY"],
      nation: json["NATION"],
      zipcode: json["ZIPCODE"],
      city: json["CITY"],
      bdate: json["BDATE"],
      roomtype: json["ROOMTYPE"],
      chdN: json["CHD_N"],
      infN: json["INF_N"],
      free: json["FREE"],
      clientid: json["CLIENTID"],
      pension: json["PENSION"],
      reservationid: json["RESERVATIONID"],
      checkin: json["CHECKIN"] == null ? null : DateTime.parse(json["CHECKIN"]),
      checkout:
          json["CHECKOUT"] == null ? null : DateTime.parse(json["CHECKOUT"]),
      vipcode: json["VIPCODE"],
      reservationno: json["RESERVATIONNO"]?.toString(),
      reservationnameid: json["RESERVATIONNAMEID"],
      agency: json["AGENCY"],
      title: json["TITLE"],
      cintime: json["CINTIME"],
      couttime: json["COUTTIME"],
      gender: json["GENDER"],
      checkinnote: json["CHECKINNOTE"],
      checkoutnote: json["CHECKOUTNOTE"],
      repeatcount: json["REPEATCOUNT"] ?? 0,
      age: json["AGE"],
      firstname: json["FIRSTNAME"],
      lastname: json["LASTNAME"],
      clientname: json["CLIENTNAME"],
      phone: json["PHONE"],
      cell: json["CELL"],
      email: json["EMAIL"],
      extrabed: json["EXTRABED"] == 1 ? true : false,
      cribs: json["CRIBS"] == 1 ? true : false,
      comment: json["COMMENT"] ?? 0,
      lf: json["LF"] ?? 0,
      task: json["TASK"] ?? 0,
      conversation: json["CONVERSATION"] ?? 0,
      review: json["REVIEW"] ?? 0,
      follow: json["FOLLOW"] ?? 0,
      action: json["ACTION"] ?? 0,
      hasbirthday: json["HASBIRTHDAY"] == 1 ? true : false);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "RESERVATIONSTATE": reservationstate,
        "ADULT": adult,
        "ROOMNUMBER": roomnumber,
        "ADDRESS": address,
        "COUNTRY": country,
        "NATION": nation,
        "ZIPCODE": zipcode,
        "CITY": city,
        "BDATE": bdate,
        "ROOMTYPE": roomtype,
        "CHD_N": chdN,
        "INF_N": infN,
        "FREE": free,
        "CLIENTID": clientid,
        "PENSION": pension,
        "RESERVATIONID": reservationid,
        "CHECKIN": checkin,
        "CHECKOUT": checkout,
        "VIPCODE": vipcode,
        "RESERVATIONNO": reservationno,
        "AGENCY": agency,
        "TITLE": title,
        "CINTIME": cintime,
        "COUTTIME": couttime,
        "GENDER": gender,
        "CHECKINNOTE": checkinnote,
        "CHECKOUTNOTE": checkoutnote,
        "REPEATCOUNT": repeatcount,
        "AGE": age,
        "FIRSTNAME": firstname,
        "LASTNAME": lastname,
        "CLIENTNAME": clientname,
        "PHONE": phone,
        "CELL": cell,
        "EMAIL": email,
        "EXTRABED": extrabed,
        "CRIBS": cribs,
        "COMMENT": comment,
        "LF": lf,
        "TASK": task,
        "CONVERSATION": conversation,
        "REVIEW": review,
        "FOLLOW": follow,
        "ACTION": action,
        "HASBIRTHDAY": hasbirthday
      };
}


// [ID] [int] IDENTITY(1,1) NOT NULL,
// 	[LOCALID] [int] NULL,
// 	[PROFILEID] [int] NULL,
// 	[CHECKIN] [date] NULL,
// 	[CHECKOUT] [date] NULL,
// 	[HOTELID] [int] NULL,
// 	[HOTEL] [nvarchar](250) NULL,
// 	[ROOMNUMBER] [nvarchar](50) NULL,
// 	[ROOMTYPE] [nvarchar](50) NULL,
// 	[PENSION] [nvarchar](50) NULL,
// 	[AGENCY] [nvarchar](250) NULL,
// 	[TOTALRATE] [float] NULL,
// 	[RATECURRENCY] [float] NULL,
// 	[CURRENCY] [nvarchar](5) NULL,
// 	[CLIENTID] [int] NULL,
// 	[CRMGUID] [nvarchar](250) NULL,
// 	[ADULT] [int] NULL,
// 	[CHD_N] [int] NULL,
// 	[INF_N] [int] NULL,
// 	[FREE] [int] NULL,
// 	[RUSER] [nvarchar](256) NULL,
// 	[RDATE] [datetime] NULL,
// 	[FIRSTNAME] [nvarchar](100) NULL,
// 	[LASTNAME] [nvarchar](100) NULL,
// 	[NOTES] [nvarchar](500) NULL,
// 	[RESERVATIONSTATE] [nvarchar](50) NULL,
// 	[COMPANYID] [int] NULL,
// 	[TENANTID] [int] NULL,
// 	[RESERVATIONNAMEID] [int] NULL,
// 	[BDATE] [date] NULL,
// 	[IDNO] [nvarchar](50) NULL,
// 	[NATION] [nvarchar](100) NULL,
// 	[ADDRESS] [nvarchar](250) NULL,
// 	[EMAIL] [nvarchar](250) NULL,
// 	[PHONE] [nvarchar](50) NULL,
// 	[RESERVATIONID] [int] NULL,
// 	[MASTERCLIENT] [bit] NULL,
// 	[ZIPCODE] [nvarchar](50) NULL,
// 	[CITY] [nvarchar](100) NULL,
// 	[COUNTRY] [nvarchar](100) NULL,
// 	[CELL] [nvarchar](50) NULL,
// 	[TITLE] [nvarchar](50) NULL,
// 	[GENDER] [nvarchar](50) NULL,
// 	[CINTIME] [nvarchar](5) NULL,
// 	[COUTTIME] [nvarchar](5) NULL,
// 	[RESERVATIONNO] [nvarchar](50) NULL,
// 	[RESSTATEID] [int] NULL,
// 	[CHECKINNOTE] [nvarchar](1000) NULL,
// 	[CHECKOUTNOTE] [nvarchar](1000) NULL,
// 	[REPEATCOUNT] [int] NULL,
// 	[VIPCODE] [nvarchar](50) NULL,
// 	[AGE] [int] NULL,
// 	[CLIENTNAME] [nvarchar](250) NULL,
// 	[EXPENSE] [float] NULL,
// 	[ACCOMADATION] [float] NULL,
// 	[ROOMCOUNT] [int] NULL,
// 	[STATUS] [nvarchar](20) NULL,
// 	[RESDATE] [date] NULL,
// 	[LANGUAGE] [nvarchar](100) NULL,
// 	[TOTALACTUALRATE] [float] NULL,
// 	[TOTALSALERATE] [float] NULL,
// 	[REDUCTION] [float] NULL,
// 	[RATECODE] [nvarchar](100) NULL,
// 	[EXTRABED] [bit] NULL,
// 	[CRIBS] [bit] NULL,
// 	[INTERVIEWID] [int] NULL,
// 	[PAYMENTOK] [bit] NULL,
// 	[PAYMENTTYPE] [nvarchar](20) NULL,
// 	[REDUCTIONID] [int] NULL,
// 	[SPECIALOFFER] [nvarchar](max) NULL,
// 	[BENEFITIDS] [nvarchar](1000) NULL,
// 	[EXTRABENEFITIDS] [nvarchar](1000) NULL,
// 	[TRANSACTIONID] [nvarchar](250) NULL,
// 	[TRANSACTIONGUID] [uniqueidentifier] NULL,
// 	[EXTERNALGUID] [nvarchar](250) NULL,
// 	[ERRORCODE] [nvarchar](50) NULL,
// 	[ERRORMESSAGE] [nvarchar](max) NULL,
// 	[QTIME] [time](7) NULL,
// 	[PASSPORTNO] [nvarchar](20) NULL,