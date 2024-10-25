// // To parse this JSON data, do
// //
// //     final stockConsumptionListmodel = stockConsumptionListmodelFromJson(jsonString);

import 'dart:convert';

StockConsumptionListmodel stockConsumptionListmodelFromJson(String str) =>
    StockConsumptionListmodel.fromJson(json.decode(str));

String stockConsumptionListmodelToJson(StockConsumptionListmodel data) =>
    json.encode(data.toJson());

class StockConsumptionListmodel {
  final bool status;
  final List<Datums> data;

  StockConsumptionListmodel({
    required this.status,
    required this.data,
  });

  factory StockConsumptionListmodel.fromJson(Map<String, dynamic> json) =>
      StockConsumptionListmodel(
        status: json["status"] ?? false,
        data: List<Datums>.from(json["data"].map((x) => Datums.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datums {
  final String stockId;
  final String materialId;
  final String unitId;
  final String unitName;
  final String stockName;
  final int availableQty;
  final String locationId;
  final String locationName;

  Datums({
    required this.stockId,
    required this.materialId,
    required this.unitId,
    required this.unitName,
    required this.stockName,
    required this.availableQty,
    required this.locationId,
    required this.locationName,
  });

  factory Datums.fromJson(Map<String, dynamic> json) => Datums(
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
// To parse this JSON data, do
//
//     final stockConsumptionListmodel = stockConsumptionListmodelFromJson(jsonString);

// import 'dart:convert';

// StockConsumptionListmodel stockConsumptionListmodelFromJson(String str) => StockConsumptionListmodel.fromJson(json.decode(str));

// String stockConsumptionListmodelToJson(StockConsumptionListmodel data) => json.encode(data.toJson());

// class StockConsumptionListmodel {
//     final bool status;
//     final List<Datum> data;

//     StockConsumptionListmodel({
//         required this.status,
//         required this.data,
//     });

//     factory StockConsumptionListmodel.fromJson(Map<String, dynamic> json) => StockConsumptionListmodel(
//         status: json["status"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     final String stockId;
//     final String materialId;
//     final String unitId;
//     final UnitName unitName;
//     final String stockName;
//     final int availableQty;
//     final String locationId;
//     final LocationName locationName;

//     Datum({
//         required this.stockId,
//         required this.materialId,
//         required this.unitId,
//         required this.unitName,
//         required this.stockName,
//         required this.availableQty,
//         required this.locationId,
//         required this.locationName,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         stockId: json["stock_id"],
//         materialId: json["material_id"],
//         unitId: json["unit_id"],
//         unitName: unitNameValues.map[json["unit_name"]]!,
//         stockName: json["stock_name"],
//         availableQty: json["available_qty"],
//         locationId: json["location_id"],
//         locationName: locationNameValues.map[json["location_name"]]!,
//     );

//     Map<String, dynamic> toJson() => {
//         "stock_id": stockId,
//         "material_id": materialId,
//         "unit_id": unitId,
//         "unit_name": unitNameValues.reverse[unitName],
//         "stock_name": stockName,
//         "available_qty": availableQty,
//         "location_id": locationId,
//         "location_name": locationNameValues.reverse[locationName],
//     };
// }

// enum LocationName {
//     NEW_START
// }

// final locationNameValues = EnumValues({
//     "New Start": LocationName.NEW_START
// });

// enum UnitName {
//     BAG,
//     LOAD,
//     LTR,
//     NOS
// }

// final unitNameValues = EnumValues({
//     "BAG": UnitName.BAG,
//     "LOAD": UnitName.LOAD,
//     "LTR": UnitName.LTR,
//     "Nos": UnitName.NOS
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
