import 'dart:convert';

class Summary {
  int id;
  String title;
  int amount;

  Summary(this.id, this.title, this.amount);

  factory Summary.fromJson(String str) => Summary.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Summary.fromMap(Map<String, dynamic> json) => Summary(
        json["ID"],
        json["TITLE"],
        json["AMOUNT"] ?? 0,
      );

  Map<String, dynamic> toMap() => {"ID": id, "TITLE": title, "AMOUNT": amount};
}
