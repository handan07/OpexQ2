// To parse this JSON data, do
//
//     final roomrack = roomrackFromMap(jsonString);

import 'dart:convert';

class Roomrack {
  Roomrack({
    required this.id,
    required this.roomid,
    required this.roomno,
    this.roomtype,
    required this.roomstateid,
    this.roomstate,
    this.extraroomstateid,
    this.extraroomstate,
    this.bedtype,
    this.view,
    this.floor,
    this.location,
    this.maid,
    this.maidchef,
    this.inhouseagency,
    this.inhouseresid,
    this.clientid,
    this.inhousename,
    this.inhousepax,
    this.inhouseadult,
    this.inhousechd,
    this.inhouseinf,
    this.inhouseviptype,
    this.inhousecheckoutdate,
    this.inhousecheckindate,
    this.latecheckouttime,
    this.roomavailability,
    this.inhouserepeat,
    this.request,
    this.maintenance,
    this.nationality,
    this.arrivaltime,
    this.inhousehasbirthday,
    this.inhouseIsshared,
    this.arrivalagency,
    this.arrivalresid,
    this.arrivalname,
    this.arrivalpax,
    this.arrivalviptype,
    this.qtime,
    this.arrivalcheckoutdate,
    this.arrivalcheckindate,
    this.arrivaladult,
    this.arrivalrepeat,
    this.arrivalhasbirthday,
    this.arrivalchd,
    this.arrivalinf,
    this.departureagency,
    this.departureresid,
    this.departurename,
    this.departurepax,
    this.departureviptype,
    this.departuretime,
    this.departurehasbirthday,
    // this.sumFull,
    // this.sumEmpty,
    // this.sumArrival,
    // this.sumDepart,
    // this.sumClean,
    // this.sumDirty,
    // this.sumMaintaince,
    // this.sumConfirmed,
    // this.sumTouched,
    // this.sumClosed,
    // this.connectiontype,
    // this.lastcheckout,
    this.minibarstateid,
    this.guestcomment,
  });

  int id;
  int roomid;
  String roomno;
  String? roomtype;
  int roomstateid;
  String? roomstate;
  int? extraroomstateid;
  String? extraroomstate;
  String? bedtype;
  String? view;
  String? floor;
  String? location;
  int? maid;
  int? maidchef;
  String? inhouseagency;
  int? inhouseresid;
  int? clientid;
  String? inhousename;
  int? inhousepax;
  int? inhouseadult;
  int? inhousechd;
  int? inhouseinf;
  String? inhouseviptype;
  DateTime? inhousecheckoutdate;
  DateTime? inhousecheckindate;
  String? latecheckouttime;
  String? roomavailability;
  int? inhouserepeat;
  int? request;
  int? maintenance;
  String? nationality;
  String? arrivaltime;
  bool? inhousehasbirthday;
  bool? inhouseIsshared;
  String? arrivalagency;
  int? arrivalresid;
  String? arrivalname;
  int? arrivalpax;
  String? arrivalviptype;
  String? qtime;
  DateTime? arrivalcheckoutdate;
  DateTime? arrivalcheckindate;
  int? arrivaladult;
  int? arrivalrepeat;
  bool? arrivalhasbirthday;
  int? arrivalchd;
  int? arrivalinf;
  String? departureagency;
  int? departureresid;
  String? departurename;
  int? departurepax;
  String? departureviptype;
  String? departuretime;
  bool? departurehasbirthday;
  // int? sumFull;
  // int? sumEmpty;
  // int? sumArrival;
  // int? sumDepart;
  // int? sumClean;
  // int? sumDirty;
  // int? sumMaintaince;
  // int? sumConfirmed;
  // int? sumTouched;
  // int? sumClosed;
  // String? connectiontype;
  // DateTime? lastcheckout;
  int? minibarstateid;
  int? guestcomment;

  factory Roomrack.fromJson(String str) => Roomrack.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory Roomrack.fromMap(Map<String, dynamic> json) => Roomrack(
        id: json["ID"],
        roomid: json["ROOMID"],
        roomno: json["ROOMNO"],
        roomtype: json["ROOMTYPE"],
        roomstateid: json["ROOMSTATEID"],
        roomstate: json["ROOMSTATE"],
        extraroomstateid: json["EXTRAROOMSTATEID"],
        extraroomstate: json["EXTRAROOMSTATE"],
        bedtype: json["BEDTYPE"],
        view: json["VIEW"],
        floor: json["FLOOR"],
        location: json["LOCATION"],
        maid: json["MAID"],
        maidchef: json["MAIDCHEF"],
        inhouseagency: json["INHOUSEAGENCY"],
        inhouseresid: json["INHOUSERESID"],
        clientid: json["CLIENTID"],
        inhousename: json["INHOUSENAME"],
        inhousepax: json["INHOUSEPAX"],
        inhouseadult: json["INHOUSEADULT"],
        inhousechd: json["INHOUSECHD"],
        inhouseinf: json["INHOUSEINF"],
        inhouseviptype: json["INHOUSEVIPTYPE"],
        inhousecheckoutdate: json["INHOUSECHECKOUTDATE"] == null
            ? null
            : DateTime.parse(json["INHOUSECHECKOUTDATE"]),
        inhousecheckindate: json["INHOUSECHECKINDATE"] == null
            ? null
            : DateTime.parse(json["INHOUSECHECKINDATE"]),
        latecheckouttime: json["LATECHECKOUTTIME"],
        roomavailability: json["ROOMAVAILABILITY"],
        inhouserepeat: json["INHOUSEREPEAT"],
        request: json["REQUEST"],
        maintenance: json["MAINTENANCE"],
        nationality: json["NATIONALITY"],
        arrivaltime: json["ARRIVALTIME"],
        inhousehasbirthday: json["INHOUSEHASBIRTHDAY"],
        inhouseIsshared: json["INHOUSE_ISSHARED"],
        arrivalagency: json["ARRIVALAGENCY"],
        arrivalresid: json["ARRIVALRESID"],
        arrivalname: json["ARRIVALNAME"],
        arrivalpax: json["ARRIVALPAX"],
        arrivalviptype: json["ARRIVALVIPTYPE"],
        qtime: json["QTIME"],
        arrivalcheckoutdate: json["ARRIVALCHECKOUTDATE"] == null
            ? null
            : DateTime.parse(json["ARRIVALCHECKOUTDATE"]),
        arrivalcheckindate: json["ARRIVALCHECKINDATE"] == null
            ? null
            : DateTime.parse(json["ARRIVALCHECKINDATE"]),
        arrivaladult: json["ARRIVALADULT"],
        arrivalrepeat: json["ARRIVALREPEAT"],
        arrivalhasbirthday: json["ARRIVALHASBIRTHDAY"],
        arrivalchd: json["ARRIVALCHD"],
        arrivalinf: json["ARRIVALINF"],
        departureagency: json["DEPARTUREAGENCY"],
        departureresid: json["DEPARTURERESID"],
        departurename: json["DEPARTURENAME"],
        departurepax: json["DEPARTUREPAX"],
        departureviptype: json["DEPARTUREVIPTYPE"],
        departuretime: json["DEPARTURETIME"],
        departurehasbirthday: json["DEPARTUREHASBIRTHDAY"],
        // sumFull: json["SUM_FULL"],
        // sumEmpty: json["SUM_EMPTY"],
        // sumArrival: json["SUM_ARRIVAL"],
        // sumDepart: json["SUM_DEPART"],
        // sumClean: json["SUM_Clean"],
        // sumDirty: json["SUM_Dirty"],
        // sumMaintaince: json["SUM_Maintaince"],
        // sumConfirmed: json["SUM_Confirmed"],
        // sumTouched: json["SUM_Touched"],
        // sumClosed: json["SUM_Closed"],
        // connectiontype: json["CONNECTIONTYPE"],
        // lastcheckout: json["LASTCHECKOUT"],
        minibarstateid: json["MINIBARSTATEID"],
        guestcomment: json["GUESTCOMMENT"],
      );

  // Map<String, dynamic> toMap() => {
  //       "ID": id,
  //       "ROOMID": roomid,
  //       "ROOMNO": roomno,
  //       "ROOMTYPE": roomtype,
  //       "ROOMSTATEID": roomstateid,
  //       "ROOMSTATE": roomstate,
  //       "EXTRAROOMSTATEID": extraroomstateid,
  //       "EXTRAROOMSTATE": extraroomstate,
  //       "BEDTYPE": bedtype,
  //       "VIEW": view,
  //       "FLOOR": floor,
  //       "LOCATION": location,
  //       "MAID": maid,
  //       "MAIDCHEF": maidchef,
  //       "INHOUSEAGENCY": inhouseagency,
  //       "INHOUSERESID": inhouseresid,
  //       "CLIENTID": clientid,
  //       "INHOUSENAME": inhousename,
  //       "INHOUSEPAX": inhousepax,
  //       "INHOUSEADULT": inhouseadult,
  //       "INHOUSECHD": inhousechd,
  //       "INHOUSEINF": inhouseinf,
  //       "INHOUSEVIPTYPE": inhouseviptype,
  //       "INHOUSECHECKOUTDATE": inhousecheckoutdate?.toIso8601String(),
  //       "INHOUSECHECKINDATE": inhousecheckindate?.toIso8601String(),
  //       "LATECHECKOUTTIME": latecheckouttime,
  //       "ROOMAVAILABILITY": roomavailability,
  //       "INHOUSEREPEAT": inhouserepeat,
  //       "REQUEST": request,
  //       "MAINTENANCE": maintenance,
  //       "NATIONALITY": nationality,
  //       "ARRIVALTIME": arrivaltime,
  //       "INHOUSEHASBIRTHDAY": inhousehasbirthday,
  //       "INHOUSE_ISSHARED": inhouseIsshared,
  //       "ARRIVALAGENCY": arrivalagency,
  //       "ARRIVALRESID": arrivalresid,
  //       "ARRIVALNAME": arrivalname,
  //       "ARRIVALPAX": arrivalpax,
  //       "ARRIVALVIPTYPE": arrivalviptype,
  //       "QTIME": qtime,
  //       "ARRIVALCHECKOUTDATE": arrivalcheckoutdate,
  //       "ARRIVALCHECKINDATE": arrivalcheckindate,
  //       "ARRIVALADULT": arrivaladult,
  //       "ARRIVALREPEAT": arrivalrepeat,
  //       "ARRIVALHASBIRTHDAY": arrivalhasbirthday,
  //       "ARRIVALCHD": arrivalchd,
  //       "ARRIVALINF": arrivalinf,
  //       "DEPARTUREAGENCY": departureagency,
  //       "DEPARTURERESID": departureresid,
  //       "DEPARTURENAME": departurename,
  //       "DEPARTUREPAX": departurepax,
  //       "DEPARTUREVIPTYPE": departureviptype,
  //       "DEPARTURETIME": departuretime,
  //       "DEPARTUREHASBIRTHDAY": departurehasbirthday,
  //       "SUM_FULL": sumFull,
  //       "SUM_EMPTY": sumEmpty,
  //       "SUM_ARRIVAL": sumArrival,
  //       "SUM_DEPART": sumDepart,
  //       "SUM_Clean": sumClean,
  //       "SUM_Dirty": sumDirty,
  //       "SUM_Maintaince": sumMaintaince,
  //       "SUM_Confirmed": sumConfirmed,
  //       "SUM_Touched": sumTouched,
  //       "SUM_Closed": sumClosed,
  //       "CONNECTIONTYPE": connectiontype,
  //       "LASTCHECKOUT": lastcheckout,
  //       "MINIBARSTATEID": minibarstateid,
  //       "GUESTCOMMENT": guestcomment,
  //     };
}
