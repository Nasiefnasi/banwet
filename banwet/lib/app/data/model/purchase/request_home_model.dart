class RequestHomeModel {
  bool? status;
  List<Homedetailsdata>? data;

  RequestHomeModel({this.status, this.data});

  RequestHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Homedetailsdata>[];
      json['data'].forEach((v) {
        data!.add(new Homedetailsdata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Homedetailsdata {
  String? delivery_date;
  String? orderId;
  String? type;
  String? orderDate;
  String? supplierId;
  String? supplierName;
  int? billCreatedStatus;
  String? workId;
  String? vehicleNo;
  int? showCreatedUser;
  String? createdBy;
  String? createdDate;
  String? approvalStatus;
  int? correctedStatus;
  int? approvalEnabled;
  int? editableStatus;
  var totalAmount;
  var entryApprovalStatus;

  Homedetailsdata(
      {this.orderId,
      this.delivery_date,
      this.type,
      this.orderDate,
      this.supplierId,
      this.supplierName,
      this.billCreatedStatus,
      this.workId,
      this.vehicleNo,
      this.showCreatedUser,
      this.createdBy,
      this.createdDate,
      this.approvalStatus,
      this.correctedStatus,
      this.approvalEnabled,
      this.editableStatus,
      this.totalAmount,
      this.entryApprovalStatus});

  Homedetailsdata.fromJson(Map<String, dynamic> json) {
    delivery_date = json["delivery_date"];
    orderId = json['order_id'];
    type = json['type'];
    orderDate = json['order_date'];
    supplierId = json['supplier_id'];
    supplierName = json['supplier_name'];
    billCreatedStatus = json['bill_created_status'];
    workId = json['work_id'];
    vehicleNo = json['vehicle_no'];
    showCreatedUser = json['show_created_user'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    approvalStatus = json['approval_status'];
    correctedStatus = json['corrected_status'];
    approvalEnabled = json['approval_enabled'];
    editableStatus = json['editable_status'];
    totalAmount = json['total_amount'];
    entryApprovalStatus = json['entry_approval_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[''] = this.delivery_date;
    data['order_id'] = this.orderId;
    data['type'] = this.type;
    data['order_date'] = this.orderDate;
    data['supplier_id'] = this.supplierId;
    data['supplier_name'] = this.supplierName;
    data['bill_created_status'] = this.billCreatedStatus;
    data['work_id'] = this.workId;
    data['vehicle_no'] = this.vehicleNo;
    data['show_created_user'] = this.showCreatedUser;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['approval_status'] = this.approvalStatus;
    data['corrected_status'] = this.correctedStatus;
    data['approval_enabled'] = this.approvalEnabled;
    data['editable_status'] = this.editableStatus;
    data['total_amount'] = this.totalAmount;
    data['entry_approval_status'] = this.entryApprovalStatus;
    return data;
  }
}
