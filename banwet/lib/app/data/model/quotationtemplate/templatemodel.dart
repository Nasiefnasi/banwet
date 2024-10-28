// To parse this JSON data, do
//
//     final quotationTemplateModel = quotationTemplateModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

QuotationTemplateModel quotationTemplateModelFromJson(String str) =>
    QuotationTemplateModel.fromJson(json.decode(str));

String quotationTemplateModelToJson(QuotationTemplateModel data) =>
    json.encode(data.toJson());

class QuotationTemplateModel {
  final bool? status;
  final List<Quotationtempla>? data;

  QuotationTemplateModel({
    this.status,
    this.data,
  });

  factory QuotationTemplateModel.fromJson(Map<String, dynamic> json) =>
      QuotationTemplateModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Quotationtempla>.from(
                json["data"]!.map((x) => Quotationtempla.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Quotationtempla {
  final String? templateId;
  final String? templateNo;
  final String? title;
  final String? subTitle;
  final String? description;
  final String? products;
  final String? unitPrice;
  final String? warranty;
  final String? methodOfApplication;
  final String? notes;
  final String? createdBy;
  final DateTime? createdDate;
  final String? deleteStatus;

  RxBool istrue = false.obs;

  Quotationtempla({
    this.templateId,
    this.templateNo,
    this.title,
    this.subTitle,
    this.description,
    this.products,
    this.unitPrice,
    this.warranty,
    this.methodOfApplication,
    this.notes,
    this.createdBy,
    this.createdDate,
    this.deleteStatus,
  });

  factory Quotationtempla.fromJson(Map<String, dynamic> json) =>
      Quotationtempla(
        templateId: json["template_id"],
        templateNo: json["template_no"],
        title: json["title"],
        subTitle: json["sub_title"],
        description: json["description"],
        products: json["products"],
        unitPrice: json["unit_price"],
        warranty: json["warranty"],
        methodOfApplication: json["method_of_application"],
        notes: json["notes"],
        createdBy: json["created_by"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        deleteStatus: json["delete_status"],
      );

  Map<String, dynamic> toJson() => {
        "template_id": templateId,
        "template_no": templateNo,
        "title": title,
        "sub_title": subTitle,
        "description": description,
        "products": products,
        "unit_price": unitPrice,
        "warranty": warranty,
        "method_of_application": methodOfApplication,
        "notes": notes,
        "created_by": createdBy,
        "created_date": createdDate?.toIso8601String(),
        "delete_status": deleteStatus,
      };
}
