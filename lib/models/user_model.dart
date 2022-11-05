// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
  User({
    this.id,
    this.userName,
    this.title,
    this.managerId,
    this.chiefId,
    this.phoneNumber,
    this.email,
    this.status,
    this.language,
    this.expireDate,
    this.imageName,
    this.roleId,
    this.account,
    this.companyid,
    this.departmentId,
    this.departmentGroupId,
    this.the2Fastate,
    this.userCode,
    this.birthDate,
    this.activeDirectoryLogin,
    this.taskregion,
    this.departmentGroupIdDepgroup,
    this.roleIdRolename,
    this.managerIdUserName,
    this.chiefIdUserName,
    this.companyidName,
    this.departmentIdDepartment,
  });

  final int? id;
  final String? userName;
  final String? title;
  final int? managerId;
  final int? chiefId;
  final String? phoneNumber;
  final String? email;
  final bool? status;
  final String? language;
  final DateTime? expireDate;
  final String? imageName;
  final int? roleId;
  final String? account;
  final int? companyid;
  final int? departmentId;
  final int? departmentGroupId;
  final int? the2Fastate;
  final String? userCode;
  final DateTime? birthDate;
  final bool? activeDirectoryLogin;
  final String? taskregion;
  final String? departmentGroupIdDepgroup;
  final String? roleIdRolename;
  final String? managerIdUserName;
  final String? chiefIdUserName;
  final String? companyidName;
  final String? departmentIdDepartment;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
      id: json["Id"],
      userName: json["UserName"],
      title: json["Title"],
      managerId: json["ManagerId"],
      chiefId: json["ChiefId"],
      phoneNumber: json["PhoneNumber"],
      email: json["Email"],
      status: json["Status"],
      language: json["Language"],
      expireDate: json["ExpireDate"],
      imageName: json["ImageName"],
      roleId: json["RoleId"],
      account: json["Account"],
      companyid: json["COMPANYID"],
      departmentId: json["DepartmentId"],
      departmentGroupId: json["DepartmentGroupId"],
      the2Fastate: json["2FASTATE"],
      userCode: json["UserCode"],
      birthDate: json["BirthDate"],
      activeDirectoryLogin: json["ActiveDirectoryLogin"],
      taskregion: json["TASKREGION"],
      departmentGroupIdDepgroup: json["DepartmentGroupId_DEPGROUP"],
      roleIdRolename: json["RoleId_ROLENAME"],
      managerIdUserName: json["ManagerId_UserName"],
      chiefIdUserName: json["ChiefId_UserName"],
      companyidName: json["COMPANYID_NAME"],
      departmentIdDepartment: json["DepartmentId_DEPARTMENT"]);

  Map<String, dynamic> toMap() => {
        "Id": id,
        "UserName": userName,
        "Title": title,
        "ManagerId": managerId,
        "ChiefId": chiefId,
        "PhoneNumber": phoneNumber,
        "Email": email,
        "Status": status,
        "Language": language,
        "ExpireDate": expireDate,
        "ImageName": imageName,
        "RoleId": roleId,
        "Account": account,
        "COMPANYID": companyid,
        "DepartmentId": departmentId,
        "DepartmentGroupId": departmentGroupId,
        "2FASTATE": the2Fastate,
        "UserCode": userCode,
        "BirthDate": birthDate,
        "ActiveDirectoryLogin": activeDirectoryLogin,
        "TASKREGION": taskregion,
        "DepartmentGroupId_DEPGROUP": departmentGroupIdDepgroup,
        "RoleId_ROLENAME": roleIdRolename,
        "ManagerId_UserName": managerIdUserName,
        "ChiefId_UserName": chiefIdUserName,
        "COMPANYID_NAME": companyidName,
        "DepartmentId_DEPARTMENT": departmentIdDepartment
      };
}
