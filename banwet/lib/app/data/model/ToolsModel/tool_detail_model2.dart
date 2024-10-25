// class ToolDetailsModel2 {
//   ToolDetailsModel2({
//     required this.status,
//     required this.data,
//   });
//   late final bool status;
//   late final Data data;

//   ToolDetailsModel2.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = Data.fromJson(json['data'] ?? "");
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['status'] = status;
//     return data;
//   }
// }

// class Data {
//   Data({
//     required this.toolId,
//     required this.name,
//     required this.price,
//     required this.categoryName,
//     required this.categoryId,
//     required this.description,
//     required this.ownedQty,
//     required this.totalTransferredIn,
//     required this.totalTransferredOut,
//     required this.totalRentedIn,
//     required this.totalRentedReturned,
//     required this.totalRemainsTransfer,
//     required this.totalRemainsRent,
//     required this.totalQtyRemains,
//     required this.editable,
//     required this.availableLocations,
//     required this.transferInLog,
//     required this.transferOutLog,
//     required this.rentLog,
//     required this.transferToLocations,
//     required this.rentreturnedLogs,
//   });
//   late final String toolId;
//   late final String name;
//   late final String price;
//   late final String categoryName;
//   late final String categoryId;
//   late final String description;
//   late final String ownedQty;
//   late final String totalTransferredIn;
//   late final String totalTransferredOut;
//   late final String totalRentedIn;
//   late final String totalRentedReturned;
//   late final int totalRemainsTransfer;
//   late final int totalRemainsRent;
//   late final int totalQtyRemains;
//   late final int editable;
//   late final List<AvailableLocations> availableLocations;
//   late final List<TransferInLog> transferInLog;
//   late final List<TransferOutLog> transferOutLog;
//   late final List<RentLog>? rentLog;
//   late final List<TransferToLocations> transferToLocations;
//   late final List<RentReturnedLog> rentreturnedLogs;
//   // Data.fromJson(Map<String, dynamic> json) {
//   //   toolId = json['tool_id'];
//   //   name = json['name'];
//   //   price = json['price'];
//   //   categoryName = json['category_name'];
//   //   categoryId = json['category_id'];
//   //   description = json['description'];
//   //   ownedQty = json['owned_qty'];
//   //   totalTransferredIn = json['total_transferred_in'];
//   //   totalTransferredOut = json['total_transferred_out'];
//   //   totalRentedIn = json['total_rented_in'];
//   //   totalRentedReturned = json['total_rented_returned'];
//   //   totalRemainsTransfer = json['total_remains_transfer'];
//   //   totalRemainsRent = json['total_remains_rent'];
//   //   totalQtyRemains = json['total_qty_remains'];
//   //   editable = json['editable'];
//   //   availableLocations = List.from(json['available_locations'])
//   //       .map((e) => AvailableLocations.fromJson(e))
//   //       .toList();
//   //   transferInLog = List.from(json['transfer_in_log'])
//   //       .map((e) => TransferInLog.fromJson(e))
//   //       .toList();
//   //   transferOutLog = List.from(json['transfer_out_log'])
//   //       .map((e) => TransferOutLog.fromJson(e))
//   //       .toList();
//   //   rentLog =
//   //       List.from(json['rent_log']).map((e) => RentLog.fromJson(e)).toList();
//   //   transferToLocations = List.from(json['transfer_to_locations'])
//   //       .map((e) => TransferToLocations.fromJson(e))
//   //       .toList();

//   //   rentreturnedLogs = List.from(json['rent_return_log']).map(
//   //     (e) => RentReturnedLog.fromJson((e)).toList(),
//   //   );
//   // }
//   Data.fromJson(Map<String, dynamic> json) {
//     toolId = json['tool_id'];
//     name = json['name'];
//     price = json['price'];
//     categoryName = json['category_name'];
//     categoryId = json['category_id'];
//     description = json['description'];
//     ownedQty = json['owned_qty'];
//     totalTransferredIn = json['total_transferred_in'];
//     totalTransferredOut = json['total_transferred_out'];
//     totalRentedIn = json['total_rented_in'];
//     totalRentedReturned = json['total_rented_returned'];
//     totalRemainsTransfer = json['total_remains_transfer'];
//     totalRemainsRent = json['total_remains_rent'];
//     totalQtyRemains = json['total_qty_remains'];
//     editable = json['editable'];
//     availableLocations = List.from(json['available_locations'])
//         .map((e) => AvailableLocations.fromJson(e))
//         .toList();
//     transferInLog = List.from(json['transfer_in_log'])
//         .map((e) => TransferInLog.fromJson(e))
//         .toList();
//     transferOutLog = List.from(json['transfer_out_log'])
//         .map((e) => TransferOutLog.fromJson(e))
//         .toList();
//     rentLog = json['rent_log'] != null
//         ? List.from(json['rent_log']).map((e) => RentLog.fromJson(e)).toList()
//         : null;
//     transferToLocations = List.from(json['transfer_to_locations'])
//         .map((e) => TransferToLocations.fromJson(e))
//         .toList();

//     rentreturnedLogs = List.from(json['rent_return_log'])
//         .map((e) => RentReturnedLog.fromJson(e))
//         .toList();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['tool_id'] = toolId;
//     data['name'] = name;
//     data['price'] = price;
//     data['category_name'] = categoryName;
//     data['category_id'] = categoryId;
//     data['description'] = description;
//     data['owned_qty'] = ownedQty;
//     data['total_transferred_in'] = totalTransferredIn;
//     data['total_transferred_out'] = totalTransferredOut;
//     data['total_rented_in'] = totalRentedIn;
//     data['total_rented_returned'] = totalRentedReturned;
//     data['total_remains_transfer'] = totalRemainsTransfer;
//     data['total_remains_rent'] = totalRemainsRent;
//     data['total_qty_remains'] = totalQtyRemains;
//     data['editable'] = editable;
//     data['available_locations'] =
//         availableLocations.map((e) => e.toJson()).toList();
//     data['transfer_in_log'] = transferInLog.map((e) => e.toJson()).toList();
//     data['transfer_out_log'] = transferOutLog.map((e) => e.toJson()).toList();
//     data['rent_log'] = rentLog;
//     data['transfer_to_locations'] =
//         transferToLocations.map((e) => e.toJson()).toList();
//     return data;
//   }
// }

// class AvailableLocations {
//   AvailableLocations({
//     required this.id,
//     required this.name,
//     required this.availableQty,
//   });
//   late final int id;
//   late final String name;
//   late final int availableQty;

//   AvailableLocations.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     availableQty = json['available_qty'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['available_qty'] = availableQty;
//     return data;
//   }
// }

// class RentLog {
//   String? entryApprovalStatus;
//   String? rentPrice;
//   String? returnStatus;
//   String? id;
//   String? rentedFrom;
//   String? rentedQty;
//   String? rentedDate;
//   String? totalReturnedQty;
//   String? balanceToReturn;
//   List<ReturnedLog>? returnedLog;
//   String? status;

//   RentLog(
//       {this.entryApprovalStatus,
//       this.rentPrice,
//       this.returnStatus,
//       this.id,
//       this.rentedFrom,
//       this.rentedQty,
//       this.rentedDate,
//       this.totalReturnedQty,
//       this.balanceToReturn,
//       this.returnedLog,
//       this.status});

//   RentLog.fromJson(Map<String, dynamic> json) {
//     entryApprovalStatus = json['entry_approval_status'];
//     rentPrice = json['rent_price'];
//     returnStatus = json['return_status'];
//     id = json['id'];
//     rentedFrom = json['rented_from'];
//     rentedQty = json['rented_qty'];
//     rentedDate = json['rented_date'];
//     totalReturnedQty = json['total_returned_qty'];
//     balanceToReturn = json['balance_to_return'];
//     if (json['returned_log'] != null) {
//       returnedLog = <ReturnedLog>[];
//       json['returned_log'].forEach((v) {
//         returnedLog!.add(ReturnedLog.fromJson(v));
//       });
//     }
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['entry_approval_status'] = entryApprovalStatus;
//     data['rent_price'] = rentPrice;
//     data['return_status'] = returnStatus;
//     data['id'] = id;
//     data['rented_from'] = rentedFrom;
//     data['rented_qty'] = rentedQty;
//     data['rented_date'] = rentedDate;
//     data['total_returned_qty'] = totalReturnedQty;
//     data['balance_to_return'] = balanceToReturn;
//     if (returnedLog != null) {
//       data['returned_log'] = returnedLog!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = status;
//     return data;
//   }
// }

// class TransferInLog {
//   TransferInLog({
//     required this.entryApprovalStatus,
//     required this.transferredQty,
//     required this.transferDate,
//     required this.remarks,
//     required this.location,
//   });
//   late final String entryApprovalStatus;
//   late final String transferredQty;
//   late final String transferDate;
//   late final String remarks;
//   late final String location;

//   TransferInLog.fromJson(Map<String, dynamic> json) {
//     entryApprovalStatus = json['entry_approval_status'];
//     transferredQty = json['transferred_qty'];
//     transferDate = json['transfer_date'];
//     remarks = json['remarks'];
//     location = json['location'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['entry_approval_status'] = entryApprovalStatus;
//     data['transferred_qty'] = transferredQty;
//     data['transfer_date'] = transferDate;
//     data['remarks'] = remarks;
//     data['location'] = location;
//     return data;
//   }
// }

// class TransferOutLog {
//   TransferOutLog({
//     required this.entryApprovalStatus,
//     required this.transferredQty,
//     required this.transferDate,
//     required this.remarks,
//     required this.location,
//   });
//   late final String entryApprovalStatus;
//   late final String transferredQty;
//   late final String transferDate;
//   late final String remarks;
//   late final String location;

//   TransferOutLog.fromJson(Map<String, dynamic> json) {
//     entryApprovalStatus = json['entry_approval_status'];
//     transferredQty = json['transferred_qty'];
//     transferDate = json['transfer_date'];
//     remarks = json['remarks'];
//     location = json['location'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['entry_approval_status'] = entryApprovalStatus;
//     data['transferred_qty'] = transferredQty;
//     data['transfer_date'] = transferDate;
//     data['remarks'] = remarks;
//     data['location'] = location;
//     return data;
//   }
// }

// class TransferToLocations {
//   TransferToLocations({
//     required this.id,
//     required this.name,
//   });
//   late final String? id;
//   late final String name;

//   TransferToLocations.fromJson(Map<String, dynamic> json) {
//     id = json['id'].toString();
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }

// class ReturnedLog {
//   String? returnedQty;
//   String? returnedDate;
//   String? createdDate;
//   String? createdBy;

//   ReturnedLog(
//       {this.returnedQty, this.returnedDate, this.createdDate, this.createdBy});

//   ReturnedLog.fromJson(Map<String, dynamic> json) {
//     returnedQty = json['returned_qty'];
//     returnedDate = json['returned_date'];
//     createdDate = json['created_date'];
//     createdBy = json['created_by'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['returned_qty'] = returnedQty;
//     data['returned_date'] = returnedDate;
//     data['created_date'] = createdDate;
//     data['created_by'] = createdBy;
//     return data;
//   }
// }

// class RentReturnedLog {
//   String? rented_from;
//   String? returned_qty;
//   String? returned_date;

//   RentReturnedLog({
//     this.rented_from,
//     this.returned_qty,
//     this.returned_date,
//   });

//   RentReturnedLog.fromJson(Map<String, dynamic> json) {
//     rented_from = json['rented_from'];
//     returned_qty = json['returned_qty'];
//     returned_date = json['returned_date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['rented_from'] = rented_from;
//     data['returned_qty'] = returned_qty;
//     data['returned_date'] = returned_date;

//     return data;
//   }
// }
import 'package:banwet/app/data/model/ToolsModel/tool_detail_model.dart';

class ToolDetailsModel2 {
  ToolDetailsModel2({
    required this.status,
    required this.data,
  });

  final bool status;
  final Data data;

  factory ToolDetailsModel2.fromJson(Map<String, dynamic> json) {
    return ToolDetailsModel2(
      status: json['status'] ?? false,
      data: json['data'] != null ? Data.fromJson(json['data']) : Data.empty(),
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  Data({
    required this.toolId,
    required this.name,
    required this.price,
    required this.categoryName,
    required this.categoryId,
    required this.description,
    required this.ownedQty,
    required this.totalTransferredIn,
    required this.totalTransferredOut,
    required this.totalRentedIn,
    required this.totalRentedReturned,
    required this.totalRemainsTransfer,
    required this.totalRemainsRent,
    required this.totalQtyRemains,
    required this.editable,
    required this.availableLocations,
    required this.transferInLog,
    required this.transferOutLog,
    required this.rentLog,
    required this.transferToLocations,
    required this.rentreturnedLogs,
  });

  final String toolId;
  final String name;
  final String price;
  final String categoryName;
  final String categoryId;
  final String description;
  final String ownedQty;
  final String totalTransferredIn;
  final String totalTransferredOut;
  final String totalRentedIn;
  final String totalRentedReturned;
  final int totalRemainsTransfer;
  final int totalRemainsRent;
  final int totalQtyRemains;
  final int editable;
  final List<AvailableLocations> availableLocations;
  final List<TransferInLog> transferInLog;
  final List<TransferOutLog> transferOutLog;
  final List<RentLog>? rentLog;
  final List<TransferToLocations> transferToLocations;
  final List<RentReturnedLog> rentreturnedLogs;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      toolId: json['tool_id'] ?? "",
      name: json['name'] ?? "",
      price: json['price'] ?? "",
      categoryName: json['category_name'] ?? "",
      categoryId: json['category_id'] ?? "",
      description: json['description'] ?? "",
      ownedQty: json['owned_qty'] ?? "",
      totalTransferredIn: json['total_transferred_in'] ?? "",
      totalTransferredOut: json['total_transferred_out'] ?? "",
      totalRentedIn: json['total_rented_in'] ?? "",
      totalRentedReturned: json['total_rented_returned'] ?? "",
      totalRemainsTransfer: json['total_remains_transfer'] ?? 0,
      totalRemainsRent: json['total_remains_rent'] ?? 0,
      totalQtyRemains: json['total_qty_remains'] ?? 0,
      editable: json['editable'] ?? 0,
      availableLocations: (json['available_locations'] as List<dynamic>?)
              ?.map((e) => AvailableLocations.fromJson(e))
              .toList() ??
          [],
      transferInLog: (json['transfer_in_log'] as List<dynamic>?)
              ?.map((e) => TransferInLog.fromJson(e))
              .toList() ??
          [],
      transferOutLog: (json['transfer_out_log'] as List<dynamic>?)
              ?.map((e) => TransferOutLog.fromJson(e))
              .toList() ??
          [],
      rentLog: (json['rent_log'] as List<dynamic>?)
          ?.map((e) => RentLog.fromJson(e))
          .toList(),
      transferToLocations: (json['transfer_to_locations'] as List<dynamic>?)
              ?.map((e) => TransferToLocations.fromJson(e))
              .toList() ??
          [],
      rentreturnedLogs: (json['rent_return_log'] as List<dynamic>?)
              ?.map((e) => RentReturnedLog.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tool_id'] = toolId;
    data['name'] = name;
    data['price'] = price;
    data['category_name'] = categoryName;
    data['category_id'] = categoryId;
    data['description'] = description;
    data['owned_qty'] = ownedQty;
    data['total_transferred_in'] = totalTransferredIn;
    data['total_transferred_out'] = totalTransferredOut;
    data['total_rented_in'] = totalRentedIn;
    data['total_rented_returned'] = totalRentedReturned;
    data['total_remains_transfer'] = totalRemainsTransfer;
    data['total_remains_rent'] = totalRemainsRent;
    data['total_qty_remains'] = totalQtyRemains;
    data['editable'] = editable;
    data['available_locations'] =
        availableLocations.map((e) => e.toJson()).toList();
    data['transfer_in_log'] = transferInLog.map((e) => e.toJson()).toList();
    data['transfer_out_log'] = transferOutLog.map((e) => e.toJson()).toList();
    data['rent_log'] = rentLog?.map((e) => e.toJson()).toList();
    data['transfer_to_locations'] =
        transferToLocations.map((e) => e.toJson()).toList();
    data['rent_return_log'] = rentreturnedLogs.map((e) => e.toJson()).toList();
    return data;
  }

  Data.empty()
      : toolId = "",
        name = "",
        price = "",
        categoryName = "",
        categoryId = "",
        description = "",
        ownedQty = "",
        totalTransferredIn = "",
        totalTransferredOut = "",
        totalRentedIn = "",
        totalRentedReturned = "",
        totalRemainsTransfer = 0,
        totalRemainsRent = 0,
        totalQtyRemains = 0,
        editable = 0,
        availableLocations = [],
        transferInLog = [],
        transferOutLog = [],
        rentLog = [],
        transferToLocations = [],
        rentreturnedLogs = [];
}

class AvailableLocations {
  AvailableLocations({
    required this.id,
    required this.name,
    required this.availableQty,
  });

  final dynamic id;
  final String name;
  final int availableQty;

  factory AvailableLocations.fromJson(Map<String, dynamic> json) {
    return AvailableLocations(
      id: json['id'] ?? "0",
      name: json['name'] ?? "",
      availableQty: json['available_qty'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['available_qty'] = availableQty;
    return data;
  }
}

class RentLog {
  final String? entryApprovalStatus;
  final String? rentPrice;
  final String? returnStatus;
  final String? id;
  final String? rentedFrom;
  final String? rentedQty;
  final String? rentedDate;
  final String? totalReturnedQty;
  final String? balanceToReturn;
  final List<ReturnedLog>? returnedLog;
  final String? status;

  RentLog({
    this.entryApprovalStatus,
    this.rentPrice,
    this.returnStatus,
    this.id,
    this.rentedFrom,
    this.rentedQty,
    this.rentedDate,
    this.totalReturnedQty,
    this.balanceToReturn,
    this.returnedLog,
    this.status,
  });

  factory RentLog.fromJson(Map<String, dynamic> json) {
    return RentLog(
      entryApprovalStatus: json['entry_approval_status'],
      rentPrice: json['rent_price'],
      returnStatus: json['return_status'],
      id: json['id'],
      rentedFrom: json['rented_from'],
      rentedQty: json['rented_qty'],
      rentedDate: json['rented_date'],
      totalReturnedQty: json['total_returned_qty'],
      balanceToReturn: json['balance_to_return'],
      returnedLog: (json['returned_log'] as List<dynamic>?)
          ?.map((e) => ReturnedLog.fromJson(e))
          .toList(),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['entry_approval_status'] = entryApprovalStatus;
    data['rent_price'] = rentPrice;
    data['return_status'] = returnStatus;
    data['id'] = id;
    data['rented_from'] = rentedFrom;
    data['rented_qty'] = rentedQty;
    data['rented_date'] = rentedDate;
    data['total_returned_qty'] = totalReturnedQty;
    data['balance_to_return'] = balanceToReturn;
    if (returnedLog != null) {
      data['returned_log'] = returnedLog!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class RentReturnedLog {
  String rentedFrom;
  String returnedQty;
  String returnedDate;

  RentReturnedLog({
    required this.rentedFrom,
    required this.returnedQty,
    required this.returnedDate,
  });

  RentReturnedLog.fromJson(Map<String, dynamic> json)
      : rentedFrom = json['rented_from'] ?? '',
        returnedQty = json['returned_qty'] ?? '',
        returnedDate = json['returned_date'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rented_from'] = rentedFrom;
    data['returned_qty'] = returnedQty;
    data['returned_date'] = returnedDate;
    return data;
  }
}
