import 'dart:convert';

class Menu {
  Menu(
      {this.id,
      this.title,
      this.name,
      this.type,
      this.detail,
      this.items,
      this.route,
      this.icon,
      this.visible});

  int? id;
  String? name;
  String? title;
  String? type;
  String? detail;
  String? items;
  String? route;
  String? icon;
  bool? visible;

  factory Menu.fromJson(String str) => Menu.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Menu.fromMap(Map<String, dynamic> json) => Menu(
      id: json["ID"],
      type: json["MENUTYPE"],
      title: json["title"],
      name: json["NAME"],
      detail: json["DETAIL"],
      route: json["ROUTE"],
      icon: json["ICON"],
      items: json["ITEMS"],
      visible: json["VISIBLE"] ?? true);

  Map<String, dynamic> toMap() => {
        "ID": id,
        "MENUTYPE": type,
        "TITLE": title,
        "DETAIL": detail,
        "ROUTE": route,
        "ICON": icon,
        "ITEMS": items
      };
}
