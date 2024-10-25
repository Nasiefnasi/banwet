// To parse this JSON data, do
//
//     final appupdatemodel = appupdatemodelFromJson(jsonString);

import 'dart:convert';

Appupdatemodel appupdatemodelFromJson(String str) =>
    Appupdatemodel.fromJson(json.decode(str));

String appupdatemodelToJson(Appupdatemodel data) => json.encode(data.toJson());

class Appupdatemodel {
  final String id;
  final int updationStatus;
  final String updationType;
  final String updationLink;

  Appupdatemodel({
    required this.id,
    required this.updationStatus,
    required this.updationType,
    required this.updationLink,
  });

  factory Appupdatemodel.fromJson(Map<String, dynamic> json) => Appupdatemodel(
        id: json["id"],
        updationStatus: json["updation_status"],
        updationType: json["updation_type"],
        updationLink: json["updation_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updation_status": updationStatus,
        "updation_type": updationType,
        "updation_link": updationLink,
      };
}
