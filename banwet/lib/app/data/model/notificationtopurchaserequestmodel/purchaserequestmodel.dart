import 'dart:convert';

NotificationToPurchaseRequestModel notificationToPurchaseRequestModelFromJson(
        String str) =>
    NotificationToPurchaseRequestModel.fromJson(json.decode(str));

String notificationToPurchaseRequestModelToJson(
        NotificationToPurchaseRequestModel data) =>
    json.encode(data.toJson());

class NotificationToPurchaseRequestModel {
  final String orderId;
  final String projectName;
  final String supplierId;
  final String supplierName;
  final String orderDate;
  final String vehicleNo;
  final String approvalStatus;
  final int correctedStatus;
  final int approvalEnabled;
  final int editableStatus;
  final int totalAmount;
  final int showCreatedUser;
  final String createdBy;
  final String createdDate;
  final String type;
  final int billCreatedStatus;
  final bool status;
  final String message;
  final List<Item> items;
  final int entryApprovalStatus;

  NotificationToPurchaseRequestModel({
    required this.orderId,
    required this.projectName,
    required this.supplierId,
    required this.supplierName,
    required this.orderDate,
    required this.vehicleNo,
    required this.approvalStatus,
    required this.correctedStatus,
    required this.approvalEnabled,
    required this.editableStatus,
    required this.totalAmount,
    required this.showCreatedUser,
    required this.createdBy,
    required this.createdDate,
    required this.type,
    required this.billCreatedStatus,
    required this.status,
    required this.message,
    required this.items,
    required this.entryApprovalStatus,
  });

  factory NotificationToPurchaseRequestModel.fromJson(
          Map<String, dynamic> json) =>
      NotificationToPurchaseRequestModel(
        orderId: json["order_id"],
        projectName: json["project_name"] ?? "",
        supplierId: json["supplier_id"],
        supplierName: json["supplier_name"],
        orderDate: json["order_date"],
        vehicleNo: json["vehicle_no"],
        approvalStatus: json["approval_status"],
        correctedStatus: json["corrected_status"],
        approvalEnabled: json["approval_enabled"],
        editableStatus: json["editable_status"],
        totalAmount: json["total_amount"],
        showCreatedUser: json["show_created_user"],
        createdBy: json["created_by"],
        createdDate: json["created_date"],
        type: json["type"],
        billCreatedStatus: json["bill_created_status"],
        status: json["status"],
        message: json["message"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        entryApprovalStatus: json["entry_approval_status"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "project_name": projectName,
        "supplier_id": supplierId,
        "supplier_name": supplierName,
        "order_date": orderDate,
        "vehicle_no": vehicleNo,
        "approval_status": approvalStatus,
        "corrected_status": correctedStatus,
        "approval_enabled": approvalEnabled,
        "editable_status": editableStatus,
        "total_amount": totalAmount,
        "show_created_user": showCreatedUser,
        "created_by": createdBy,
        "created_date": createdDate,
        "type": type,
        "bill_created_status": billCreatedStatus,
        "status": status,
        "message": message,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "entry_approval_status": entryApprovalStatus,
      };
}

class Item {
  final String itemId;
  final String materialId;
  final String materialName;
  final String unitId;
  final String unitName;
  final String quantity;
  final String description;

  Item({
    required this.itemId,
    required this.materialId,
    required this.materialName,
    required this.unitId,
    required this.unitName,
    required this.quantity,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        itemId: json["item_id"],
        materialId: json["material_id"],
        materialName: json["material_name"],
        unitId: json["unit_id"],
        unitName: json["unit_name"],
        quantity: json["quantity"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "item_id": itemId,
        "material_id": materialId,
        "material_name": materialName,
        "unit_id": unitId,
        "unit_name": unitName,
        "quantity": quantity,
        "description": description,
      };
}
