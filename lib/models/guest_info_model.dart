import 'dart:convert';

class GuestInfo {
  GuestInfo(
      {required this.id,
      this.room,
      this.address,
      this.country,
      this.nation,
      this.zipcode,
      this.city,
      this.bdate,
      this.clientid,
      this.pension,
      required this.reservationid,
      this.checkin,
      this.checkout,
      this.vipcode,
      this.agency,
      this.title,
      this.gender,
      this.repeatcount,
      this.age,
      this.firstname,
      this.lastname,
      this.clientname,
      this.phone,
      this.cell,
      this.email});

  int id;
  String? room;
  String? address;
  String? country;
  String? nation;
  String? zipcode;
  String? city;
  DateTime? bdate;
  int? clientid;
  String? pension;
  int reservationid;
  DateTime? checkin;
  DateTime? checkout;
  String? vipcode;
  String? agency;
  String? title;
  String? gender;
  int? repeatcount;
  int? age;
  String? firstname;
  String? lastname;
  String? clientname;
  String? phone;
  String? cell;
  String? email;

  factory GuestInfo.fromJson(String str) => GuestInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GuestInfo.fromMap(Map<String, dynamic> json) => GuestInfo(
      id: json["ID"],
      room: json["ROOM"],
      address: json["ADDRESS"],
      country: json["COUNTRY"],
      nation: json["NATION"],
      zipcode: json["ZIPCODE"],
      city: json["CITY"],
      bdate: json["BDATE"]?.toIso8601String(),
      clientid: json["CLIENTID"],
      pension: json["PENSION"],
      reservationid: json["RESERVATIONID"],
      vipcode: json["VIPCODE"],
      agency: json["AGENCY"],
      title: json["TITLE"],
      gender: json["GENDER"],
      repeatcount: json["REPEATCOUNT"],
      age: json["AGE"],
      firstname: json["FIRSTNAME"],
      lastname: json["LASTNAME"],
      clientname: json["CLIENTNAME"],
      phone: json["PHONE"],
      cell: json["CELL"],
      email: json["EMAIL"]);

  Map<String, dynamic> toMap() => {
        "ROOM": room,
        "ADDRESS": address,
        "COUNTRY": country,
        "NATION": nation,
        "ZIPCODE": zipcode,
        "CITY": city,
        "BDATE": bdate,
        "CLIENTID": clientid,
        "PENSION": pension,
        "RESERVATIONID": reservationid,
        "VIPCODE": vipcode,
        "ID": id,
        "AGENCY": agency,
        "TITLE": title,
        "GENDER": gender,
        "REPEATCOUNT": repeatcount,
        "AGE": age,
        "FIRSTNAME": firstname,
        "LASTNAME": lastname,
        "CLIENTNAME": clientname,
        "PHONE": phone,
        "CELL": cell,
        "EMAIL": email
      };
}
