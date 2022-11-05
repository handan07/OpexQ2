import 'dart:convert';

class SelectItem {
  String text;
  String id;

  SelectItem(this.id, this.text);

  factory SelectItem.fromJson(String str) =>
      SelectItem.fromMap(json.decode(str));

  factory SelectItem.fromMap(Map<String, dynamic> json) =>
      SelectItem(json["ID"].toString(), json["TEXT"]);
}
