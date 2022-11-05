import 'dart:convert';

class LookupItem {
  String? text;
  int? id;
  bool? selected;

  LookupItem(this.id, this.text);

  factory LookupItem.fromJson(String str) =>
      LookupItem.fromMap(json.decode(str));

  factory LookupItem.fromMap(Map<String, dynamic> json) =>
      LookupItem(json["ID"], json["TEXT"]);
}
