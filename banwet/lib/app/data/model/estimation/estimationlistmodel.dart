// To parse this JSON data, do
//
//     final estimationListModel = estimationListModelFromJson(jsonString);

import 'dart:convert';

EstimationListModel estimationListModelFromJson(String str) => EstimationListModel.fromJson(json.decode(str));

String estimationListModelToJson(EstimationListModel data) => json.encode(data.toJson());

class EstimationListModel {
    final bool? status;
    final List<EstimationList>? data;

    EstimationListModel({
        this.status,
        this.data,
    });

    factory EstimationListModel.fromJson(Map<String, dynamic> json) => EstimationListModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<EstimationList>.from(json["data"]!.map((x) => EstimationList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class EstimationList {
    final String? estimationId;
    final String? estimationNo;
    final String? date;
    final String? estimationTo;
    final String? buyerName;
    final String? netTotal;
    final String? createdBy;
    final String? createdDate;
    final String? itemDetails;
    final String? printUrl;

    EstimationList({
        this.estimationId,
        this.estimationNo,
        this.date,
        this.estimationTo,
        this.buyerName,
        this.netTotal,
        this.createdBy,
        this.createdDate,
        this.itemDetails,
        this.printUrl,
    });

    factory EstimationList.fromJson(Map<String, dynamic> json) => EstimationList(
        estimationId: json["estimation_id"],
        estimationNo: json["estimation_no"],
        date: json["date"],
        estimationTo: json["estimation_to"],
        buyerName:json["buyer_name"],
        netTotal: json["net_total"],
        createdBy:json["created_by"],
        createdDate:json["created_date"],
        itemDetails: json["item_details"],
        printUrl: json["print_url"],
    );

    Map<String, dynamic> toJson() => {
        "estimation_id": estimationId,
        "estimation_no": estimationNo,
        "date": date,
        "estimation_to": estimationTo,
        "buyer_name": buyerName,
        "net_total": netTotal,
        "created_by":createdBy,
        "created_date":createdDate,
        "item_details": itemDetails,
        "print_url": printUrl,
    };
}

// enum BuyerName {
//     CALICUT,
//     GENOVA2
// }

// final buyerNameValues = EnumValues({
//     "Calicut": BuyerName.CALICUT,
//     "genova2": BuyerName.GENOVA2
// });

// enum CreatedBy {
//     DRIVER
// }

// final createdByValues = EnumValues({
//     "Driver": CreatedBy.DRIVER
// });

// enum Date {
//     THE_01112024,
//     THE_31012023
// }

// final dateValues = EnumValues({
//     "01-11-2024": Date.THE_01112024,
//     "31-01-2023": Date.THE_31012023
// });

// enum EstimationTo {
//     BRANCH,
//     CUSTOMER
// }

// final estimationToValues = EnumValues({
//     "branch": EstimationTo.BRANCH,
//     "customer": EstimationTo.CUSTOMER
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//             reverseMap = map.map((k, v) => MapEntry(v, k));
//             return reverseMap;
//     }
// }
