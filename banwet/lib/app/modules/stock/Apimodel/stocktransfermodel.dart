// To parse this JSON data, do
//
//     final stocktransferModel = stocktransferModelFromJson(jsonString);

import 'dart:convert';

StocktransferModel stocktransferModelFromJson(String str) =>
    StocktransferModel.fromJson(json.decode(str));

String stocktransferModelToJson(StocktransferModel data) =>
    json.encode(data.toJson());

class StocktransferModel {
  final bool status;
  final List<Dataa> data;

  StocktransferModel({
    required this.status,
    required this.data,
  });

  factory StocktransferModel.fromJson(Map<String, dynamic> json) =>
      StocktransferModel(
        status: json["status"],
        data: List<Dataa>.from(json["data"].map((x) => Dataa.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Dataa {
  final String locationId;
  final String locationName;
  final String locationYpe;

  Dataa({
    required this.locationId,
    required this.locationName,
    required this.locationYpe,
  });

  factory Dataa.fromJson(Map<String, dynamic> json) => Dataa(
        locationId: json["location_id"],
        locationName: json["location_name"],
        locationYpe: json["location_ype"],
      );

  Map<String, dynamic> toJson() => {
        "location_id": locationId,
        "location_name": locationName,
        "location_ype": locationYpe,
      };
}
