import 'dart:convert';

class ListGroup {
  ListGroup(
      {this.id,
      this.title,
      this.count,
      });

  int? id;
  String? title;
  int? count;

  factory ListGroup.fromJson(String str) => ListGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListGroup.fromMap(Map<String, dynamic> json) => ListGroup(
      id: json["ID"],
      title: json["TITLE"],
      count: json["COUNT"] ?? true);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "TITLE": title,
        "COUNT": count
      };
}
