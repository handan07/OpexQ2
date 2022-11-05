import 'dart:convert';

import 'package:flutter/material.dart';

class ListPage {
  ListPage(
      {required this.id,
      required this.name,
      required this.color,
      required this.header,
      required this.baseObject,
      required this.tabs,
      required this.editTabs,
      required this.initialvalue,
      required this.sort,
      required this.homeRoute,
      required this.listRoute,
      required this.editRoute,
      required this.headerEdit,
      required this.visible});

  int id;
  String name;
  String header;
  String baseObject;
  List<String> tabs;
  List<String> editTabs;
  List<String> sort;
  String homeRoute;
  String listRoute;
  String editRoute;
  String headerEdit;
  bool visible;
  Color color;
  Map<String, dynamic> initialvalue;

  factory ListPage.fromJson(String str) => ListPage.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory ListPage.fromMap(Map<String, dynamic> json) => ListPage(
      id: json["ID"],
      name: json["NAME"],
      color: json["COLOR"],
      header: json["HEADER"],
      baseObject: json["BASEOBJECT"],
      tabs: json["TABS"],
      editTabs: json["EDITTABS"],
      initialvalue: json["INITIALVALUE"],
      sort: json["SORT"],
      homeRoute: json["HOMEROUTE"],
      listRoute: json["LISTROUTE"],
      editRoute: json["EDITROUTE"],
      headerEdit: json["HEADEREDIT"],
      visible: json["VISIBLE"]);
}
