// To parse this JSON data, do
//
//     final documents = documentsFromMap(jsonString);

import 'dart:convert';

class Document {
  Document({
    this.id,
    this.hotelid,
    this.portalid,
    this.thumbnailurl,
    this.fileurl,
    this.title,
    this.filesize,
    this.mimetype,
    this.sourcetable,
    this.sourcetableid,
    this.createdate,
    this.stduserid,
    this.binarydata,
    this.ruser,
    this.rdate,
  });

  final int? id;
  final int? hotelid;
  final int? portalid;
  final String? thumbnailurl;
  final String? fileurl;
  final String? title;
  final int? filesize;
  final String? mimetype;
  final String? sourcetable;
  final String? sourcetableid;
  final DateTime? createdate;
  final int? stduserid;
  final dynamic binarydata;
  final String? ruser;
  final DateTime? rdate;

  factory Document.fromJson(String str) => Document.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Document.fromMap(Map<String, dynamic> json) => Document(
        id: json["ID"],
        hotelid: json["HOTELID"],
        portalid: json["PORTALID"],
        thumbnailurl: json["THUMBNAILURL"],
        fileurl: json["FILEURL"],
        title: json["TITLE"],
        filesize: json["FILESIZE"],
        mimetype: json["MIMETYPE"],
        sourcetable: json["SOURCETABLE"],
        sourcetableid: json["SOURCETABLEID"],
        createdate: json["CREATEDATE"] == null
            ? null
            : DateTime.parse(json["CREATEDATE"]),
        stduserid: json["STDUSERID"],
        binarydata: json["BINARYDATA"],
        ruser: json["RUSER"],
        rdate: DateTime.parse(json["RDATE"]),
      );

  Map<String, dynamic> toMap() => {
        "ID": id,
        "HOTELID": hotelid,
        "PORTALID": portalid,
        "THUMBNAILURL": thumbnailurl,
        "FILEURL": fileurl,
        "TITLE": title,
        "FILESIZE": filesize,
        "MIMETYPE": mimetype,
        "SOURCETABLE": sourcetable,
        "SOURCETABLEID": sourcetableid,
        "CREATEDATE": createdate?.toIso8601String(),
        "STDUSERID": stduserid,
        "BINARYDATA": binarydata,
        "RUSER": ruser,
        "RDATE": rdate?.toIso8601String(),
      };
}
