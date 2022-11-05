import 'dart:convert';

class SelectedItem {
  String text;
  String value;

  SelectedItem(this.value, this.text);

  factory SelectedItem.fromJson(String str) =>
      SelectedItem.fromMap(json.decode(str));

  factory SelectedItem.fromMap(Map<String, dynamic> json) =>
      SelectedItem(json["VALUE"], json["TEXT"]);
}
