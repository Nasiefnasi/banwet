class RequestDetailModel {
  String? orderId;
  String? supplierId;
  String? supplierName;
  String? orderDate;
  String? vehicleNo;
  String? approvalStatus;
  int? correctedStatus;
  int? approvalEnabled;
  int? editableStatus;
  dynamic totalAmount;
  int? showCreatedUser;
  String? createdBy;
  String? createdDate;
  String? type;
  int? billCreatedStatus;
  bool? status;
  String? message;
  List<Items>? items;
  int? entryApprovalStatus;

  RequestDetailModel(
      {this.orderId,
        this.supplierId,
        this.supplierName,
        this.orderDate,
        this.vehicleNo,
        this.approvalStatus,
        this.correctedStatus,
        this.approvalEnabled,
        this.editableStatus,
        this.totalAmount,
        this.showCreatedUser,
        this.createdBy,
        this.createdDate,
        this.type,
        this.billCreatedStatus,
        this.status,
        this.message,
        this.items,
        this.entryApprovalStatus});

  RequestDetailModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    supplierId = json['supplier_id'];
    supplierName = json['supplier_name'];
    orderDate = json['order_date'];
    vehicleNo = json['vehicle_no'];
    approvalStatus = json['approval_status'];
    correctedStatus = json['corrected_status'];
    approvalEnabled = json['approval_enabled'];
    editableStatus = json['editable_status'];
    totalAmount = json['total_amount'];
    showCreatedUser = json['show_created_user'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    type = json['type'];
    billCreatedStatus = json['bill_created_status'];
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    entryApprovalStatus = json['entry_approval_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['supplier_id'] = this.supplierId;
    data['supplier_name'] = this.supplierName;
    data['order_date'] = this.orderDate;
    data['vehicle_no'] = this.vehicleNo;
    data['approval_status'] = this.approvalStatus;
    data['corrected_status'] = this.correctedStatus;
    data['approval_enabled'] = this.approvalEnabled;
    data['editable_status'] = this.editableStatus;
    data['total_amount'] = this.totalAmount;
    data['show_created_user'] = this.showCreatedUser;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['type'] = this.type;
    data['bill_created_status'] = this.billCreatedStatus;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['entry_approval_status'] = this.entryApprovalStatus;
    return data;
  }
}

class Items {
  String? itemId;
  String? materialId;
  String? materialName;
  String? unitId;
  String? unitName;
  String? quantity;
  String? description;

  Items(
      {this.itemId,
        this.materialId,
        this.materialName,
        this.unitId,
        this.unitName,
        this.quantity,
        this.description});

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    materialId = json['material_id'];
    materialName = json['material_name'];
    unitId = json['unit_id'];
    unitName = json['unit_name'];
    quantity = json['quantity'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['material_id'] = this.materialId;
    data['material_name'] = this.materialName;
    data['unit_id'] = this.unitId;
    data['unit_name'] = this.unitName;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    return data;
  }
}
