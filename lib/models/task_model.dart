import 'dart:convert';

class Task {
  Task(
      {required this.id,
      required this.tickettype,
      required this.state,
      this.staff,
      required this.priority,
      this.source,
      this.place,
      this.sgroup,
      this.depgroup,
      required this.subject,
      required this.subjectid,
      required this.department,
      required this.rdate,
      required this.ruser,
      this.tdescription,
      this.notifiername,
      this.luser,
      this.ldate,
      required this.tdate,
      required this.ttime,
      this.warning,
      this.alert,
      this.duration,
      required this.typeid,
      required this.stateid,
      this.staffid,
      required this.priorityid,
      this.placeid,
      this.clientid,
      this.reservationid,
      this.masterjobid,
      this.masterjob,
      required this.departmentid,
      this.tdateEnd,
      this.ttimeEnd,
      this.periodicjob,
      this.comments,
      this.follows,
      this.ruserid,
      this.docname,
      this.deviceid,
      this.age,
      this.agency,
      this.cell,
      this.checkin,
      this.checkout,
      this.clientname,
      this.country,
      this.crmid,
      this.email,
      this.gender,
      this.nationality,
      this.phone,
      this.repeatcount,
      this.room,
      this.vipcode});

  int id;
  String tickettype;
  String state;
  String? staff;
  String priority;
  String? source;
  String? place;
  String? sgroup;
  String? depgroup;
  String subject;
  int subjectid;
  String department;
  DateTime rdate;
  String ruser;
  String? tdescription;
  String? notifiername;
  String? luser;
  DateTime? ldate;
  DateTime tdate;
  DateTime ttime;
  int? warning;
  int? alert;
  int typeid;
  int stateid;
  int? staffid;
  int priorityid;
  int? placeid;
  int? clientid;
  int? crmid;
  int? reservationid;
  int? masterjobid;
  int departmentid;
  DateTime? tdateEnd;
  DateTime? ttimeEnd;
  bool? periodicjob;
  int? comments;
  int? follows;
  int? ruserid;
  String? docname;
  int? deviceid;
  int? duration;
  bool? masterjob;
  String? clientname;
  String? phone;
  String? cell;
  String? email;
  String? country;
  String? gender;
  String? nationality;
  DateTime? checkin;
  DateTime? checkout;
  String? agency;
  String? vipcode;
  String? room;
  int? repeatcount;
  int? age;
  //String? address;
  //String? city;

  factory Task.fromJson(String str) => Task.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Task.fromMap(Map<String, dynamic> json) => Task(
      id: json["ID"],
      tickettype: json["TICKETTYPE"],
      state: json["STATE"],
      staff: json["STAFF"],
      priority: json["PRIORITY"],
      source: json["SOURCE"],
      place: json["PLACE"],
      sgroup: json["SGROUP"],
      depgroup: json["DEPGROUP"],
      subject: json["SUBJECT"],
      subjectid: json["SUBJECTID"],
      department: json["DEPARTMENT"],
      rdate: DateTime.parse(json["RDATE"]),
      ruser: json["RUSER"],
      tdescription: json["TDESCRIPTION"],
      notifiername: json["NOTIFIERNAME"],
      luser: json["LUSER"],
      ldate: json["LDATE"] == null ? null : DateTime.parse(json["LDATE"]),
      tdate: DateTime.parse(json["TDATE"]),
      ttime: DateTime.parse(json["TTIME"]),
      warning: json["WARNING"],
      alert: json["ALERT"],
      typeid: json["TYPEID"],
      stateid: json["STATEID"],
      staffid: json["STAFFID"],
      priorityid: json["PRIORITYID"],
      placeid: json["PLACEID"],
      clientid: json["CLIENTID"],
      reservationid: json["RESERVATIONID"],
      masterjobid: json["MASTERJOBID"],
      masterjob: json["MASTERJOB"],
      departmentid: json["DEPARTMENTID"],
      tdateEnd:
          json["TDATE_END"] == null ? null : DateTime.parse(json["TDATE_END"]),
      ttimeEnd:
          json["TTIME_END"] == null ? null : DateTime.parse(json["TTIME_END"]),
      periodicjob: json["PERIODICJOB"],
      comments: json["COMMENTS"],
      follows: json["FOLLOWS"],
      ruserid: json["RUSERID"],
      docname: json["DOCNAME"],
      deviceid: json["DEVICEID"],
      duration: json["DURATION"],
      age: json["AGE"],
      agency: json["AGENCY"],
      cell: json["CELL"],
      checkin: json["CHECKIN"] == null ? null : DateTime.parse(json["CHECKIN"]),
      checkout:
          json["CHECKOUT"] == null ? null : DateTime.parse(json["CHECKOUT"]),
      clientname: json["CLIENTNAME"],
      country: json["COUNTRY"],
      crmid: json["CRMID"],
      email: json["EMAIL"],
      gender: json["GENDER"],
      nationality: json["NATIONALITY"],
      phone: json["PHONE"],
      repeatcount: json["REPEATCOUNT"],
      room: json["ROOM"],
      vipcode: json["VIPCODE"]);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "TICKETTYPE": tickettype,
        "STATE": state,
        "STAFF": staff,
        "PRIORITY": priority,
        "SOURCE": source,
        "PLACE": place,
        "SGROUP": sgroup,
        "DEPGROUP": depgroup,
        "SUBJECT": subject,
        "SUBJECTID": subjectid,
        "DEPARTMENT": department,
        "RDATE": rdate,
        "RUSER": ruser,
        "TDESCRIPTION": tdescription,
        "NOTIFIERNAME": notifiername,
        "LUSER": luser,
        "LDATE": ldate,
        "TDATE": tdate,
        "TTIME": ttime,
        "WARNING": warning,
        "ALERT": alert,
        "TYPEID": typeid,
        "STATEID": stateid,
        "STAFFID": staffid,
        "PRIORITYID": priorityid,
        "PLACEID": placeid,
        "CLIENTID": clientid,
        "RESERVATIONID": reservationid,
        "MASTERJOBID": masterjobid,
        "DEPARTMENTID": departmentid,
        "TDATE_END": tdateEnd,
        "TTIME_END": ttimeEnd,
        "PERIODICJOB": periodicjob,
        "COMMENTS": comments,
        "FOLLOWS": follows,
        "RUSERID": ruserid,
        "DOCNAME": docname,
        "DEVICEID": deviceid
      };
}
