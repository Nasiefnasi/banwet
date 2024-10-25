// To parse this JSON data, do
//
//     final stockTransferReportModel = stockTransferReportModelFromJson(jsonString);

import 'dart:convert';

StockTransferReportModel stockTransferReportModelFromJson(String str) => StockTransferReportModel.fromJson(json.decode(str));

String stockTransferReportModelToJson(StockTransferReportModel data) => json.encode(data.toJson());

class StockTransferReportModel {
    final bool status;
    final List<Datumtransfer> data;

    StockTransferReportModel({
        required this.status,
        required this.data,
    });

    factory StockTransferReportModel.fromJson(Map<String, dynamic> json) => StockTransferReportModel(
        status: json["status"],
        data: List<Datumtransfer>.from(json["data"].map((x) => Datumtransfer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datumtransfer {
    final String id;
    final String date;
    final String material;
    final String unit;
    final String transferredQty;
    final String transferredFrom;
    final String entryApprovalStatus;

    Datumtransfer({
        required this.id,
        required this.date,
        required this.material,
        required this.unit,
        required this.transferredQty,
        required this.transferredFrom,
        required this.entryApprovalStatus,
    });

    factory Datumtransfer.fromJson(Map<String, dynamic> json) => Datumtransfer(
        id: json["id"],
        date: json["date"],
        material: json["material"],
        unit: json["unit"],
        transferredQty: json["transferred_qty"],
        transferredFrom: json["transferred_from"],
        entryApprovalStatus: json["entry_approval_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "material": material,
        "unit": unit,
        "transferred_qty": transferredQty,
        "transferred_from": transferredFrom,
        "entry_approval_status": entryApprovalStatus,
    };
}


