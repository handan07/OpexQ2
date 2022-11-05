// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class WhatsAppUser {
  WhatsAppUser(
      {required this.id,
      required this.staffName,
      this.imageName,
      this.department,
      required this.isAdmin});

  final int id;
  final String staffName;
  final String? imageName;
  final String? department;
  final bool isAdmin;

  factory WhatsAppUser.fromJson(String str) =>
      WhatsAppUser.fromMap(json.decode(str));

  factory WhatsAppUser.fromMap(Map<String, dynamic> json) => WhatsAppUser(
      id: json["ID"],
      staffName: json["STAFFNAME"],
      department: json["DEPARTMENT"],
      isAdmin: json["ISADMIN"] ?? false,
      imageName: json["IMAGENAME"] ?? "");
}
