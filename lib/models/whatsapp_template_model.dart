import 'dart:convert';

class WhatsAppTemplate {
  final int id;
  final String type;
  final String messageName;
  final String? messageBody;
  final String? messageLink;
  final String? lang;
  final String? templatename;
  final String? headerType;
  final String? headerLink;
  final String? messageFooter;
  final bool? active;

  const WhatsAppTemplate({
    required this.id,
    required this.type,
    required this.messageName,
    this.messageBody,
    this.messageLink,
    this.lang,
    this.templatename,
    this.headerType,
    this.headerLink,
    this.messageFooter,
    this.active,
  });

  factory WhatsAppTemplate.fromJson(String str) =>
      WhatsAppTemplate.fromMap(json.decode(str));

  factory WhatsAppTemplate.fromMap(Map<String, dynamic> json) =>
      WhatsAppTemplate(
          id: json["ID"],
          type: json["TYPE"],
          messageName: json["MESSAGENAME"],
          messageBody: json["MESSAGEBODY"],
          messageLink: json["MESSAGELINK"],
          lang: json["LANG"],
          templatename: json["TEMPLATENAME"],
          headerType: json["HEADERTYPE"],
          headerLink: json["HEADERLINK"],
          messageFooter: json["MESSAGEFOOTER"],
          active: json["ACTIVE"] == null ? false : true);
}
