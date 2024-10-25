// To parse this JSON data, do
//
//     final stockConsumptionReportModel = stockConsumptionReportModelFromJson(jsonString);

import 'dart:convert';

StockConsumptionReportModel stockConsumptionReportModelFromJson(String str) => StockConsumptionReportModel.fromJson(json.decode(str));

String stockConsumptionReportModelToJson(StockConsumptionReportModel data) => json.encode(data.toJson());

class StockConsumptionReportModel {
    final bool status;
    final List<Datumreport> data;

    StockConsumptionReportModel({
        required this.status,
        required this.data,
    });

    factory StockConsumptionReportModel.fromJson(Map<String, dynamic> json) => StockConsumptionReportModel(
        status: json["status"],
        data: List<Datumreport>.from(json["data"].map((x) => Datumreport.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datumreport {
    final String id;
    final String date;
    final String material;
    final String unit;
    final String consumedQty;
    final String entryApprovalStatus;

    Datumreport({
        required this.id,
        required this.date,
        required this.material,
        required this.unit,
        required this.consumedQty,
        required this.entryApprovalStatus,
    });

    factory Datumreport.fromJson(Map<String, dynamic> json) => Datumreport(
        id: json["id"],
        date: json["date"],
        material: json["material"],
        unit: json["unit"],
        consumedQty: json["consumed_qty"],
        entryApprovalStatus: json["entry_approval_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "material": material,
        "unit": unit,
        "consumed_qty": consumedQty,
        "entry_approval_status": entryApprovalStatus,
    };
}
