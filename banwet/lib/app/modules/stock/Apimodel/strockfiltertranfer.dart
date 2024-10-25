// To parse this JSON data, do
//
//     final stocktransferFiltermodel = stocktransferFiltermodelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

StocktransferFiltermodel stocktransferFiltermodelFromJson(String str) =>
    StocktransferFiltermodel.fromJson(json.decode(str));

String stocktransferFiltermodelToJson(StocktransferFiltermodel data) =>
    json.encode(data.toJson());

class StocktransferFiltermodel {
  final bool status;
  final List<Stocktransferdata> data;

  StocktransferFiltermodel({
    required this.status,
    required this.data,
  });

  factory StocktransferFiltermodel.fromJson(Map<String, dynamic> json) =>
      StocktransferFiltermodel(
        status: json["status"],
        data: List<Stocktransferdata>.from(json["data"].map((x) => Stocktransferdata.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Stocktransferdata {
  TextEditingController? count = TextEditingController(text: "0");
  final String stockId;
  final String materialId;
  final String unitId;
  final String unitName;
  final String stockName;
  final int availableQty;
  final String locationId;
  final String locationName;

  Stocktransferdata({
    this.count,
    required this.stockId,
    required this.materialId,
    required this.unitId,
    required this.unitName,
    required this.stockName,
    required this.availableQty,
    required this.locationId,
    required this.locationName,
  });

  factory Stocktransferdata.fromJson(Map<String, dynamic> json) => Stocktransferdata(
        stockId: json["stock_id"],
        materialId: json["material_id"],
        unitId: json["unit_id"],
        unitName: json["unit_name"],
        stockName: json["stock_name"],
        availableQty: json["available_qty"],
        locationId: json["location_id"],
        locationName: json["location_name"],
      );

  Map<String, dynamic> toJson() => {
        "stock_id": stockId,
        "material_id": materialId,
        "unit_id": unitId,
        "unit_name": unitName,
        "stock_name": stockName,
        "available_qty": availableQty,
        "location_id": locationId,
        "location_name": locationName,
      };
}
