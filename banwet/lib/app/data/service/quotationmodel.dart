import 'dart:convert';

SaleQuotationModel saleQuotationModelFromJson(String str) =>
    SaleQuotationModel.fromJson(json.decode(str));

String saleQuotationModelToJson(SaleQuotationModel data) =>
    json.encode(data.toJson());

class SaleQuotationModel {
  final bool status;
  final List<Datum> data;

  SaleQuotationModel({
    required this.status,
    required this.data,
  });

  factory SaleQuotationModel.fromJson(Map<String, dynamic> json) =>
      SaleQuotationModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String quotationId;
  final String quotationNo;
  final String date;
  final String expiryDate;
  final String customerName;
  final String customerAddress;
  final String quotationType;
  final String preparedBy;
  final String quotationSubject;
  final String netTotal;
  final String createdBy;
  final String createdDate;
  final String approvalStatus;
  final String itemDetails;
  final String printUrl;

  Datum({
    required this.quotationId,
    required this.quotationNo,
    required this.date,
    required this.expiryDate,
    required this.customerName,
    required this.customerAddress,
    required this.quotationType,
    required this.preparedBy,
    required this.quotationSubject,
    required this.netTotal,
    required this.createdBy,
    required this.createdDate,
    required this.approvalStatus,
    required this.itemDetails,
    required this.printUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        quotationId: json["quotation_id"],
        quotationNo: json["quotation_no"],
        date: json["date"],
        expiryDate: json["expiry_date"],
        customerName: json["customer_name"],
        customerAddress: json["customer_address"],
        quotationType: json["quotation_type"],
        preparedBy: json["prepared_by"],
        quotationSubject: json["quotation_subject"],
        netTotal: json["net_total"],
        createdBy: json["created_by"],
        createdDate: json["created_date"],
        approvalStatus: json["approval_status"],
        itemDetails: json["item_details"],
        printUrl: json["print_url"],
      );

  Map<String, dynamic> toJson() => {
        "quotation_id": quotationId,
        "quotation_no": quotationNo,
        "date": date,
        "expiry_date": expiryDate,
        "customer_name": customerName,
        "customer_address": customerAddress,
        "quotation_type": quotationType,
        "prepared_by": preparedBy,
        "quotation_subject": quotationSubject,
        "net_total": netTotal,
        "created_by": createdBy,
        "created_date": createdDate,
        "approval_status": approvalStatus,
        "item_details": itemDetails,
        "print_url": printUrl,
      };
}
