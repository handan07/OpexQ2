import 'dart:convert';

class CheckList {
  CheckList({
    required this.id,
    required this.mdate,
    required this.confirmed,
    required this.checkname,
    this.belongto,
    required this.ruser,
    required this.rdate,
    this.notes,
  });

  final int id;
  final DateTime mdate;
  final bool confirmed;
  final String checkname;
  final String? belongto;
  final String ruser;
  final DateTime rdate;
  final String? notes;

  factory CheckList.fromJson(String str) => CheckList.fromMap(json.decode(str));

  factory CheckList.fromMap(Map<String, dynamic> json) => CheckList(
      id: json["ID"],
      mdate: DateTime.parse(json["MDATE"]),
      confirmed: json["CONFIRMED"] == 1 ? true : false,
      checkname: json["CHECKNAME"] ?? "",
      belongto: json["BELONGTO"],
      ruser: json["RUSER"],
      rdate: DateTime.parse(json["RDATE"]),
      notes: json["NOTES"]);
}
