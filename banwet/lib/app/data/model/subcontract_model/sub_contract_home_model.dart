class SubContractHomeModel {
  bool? status;
  List<Data>? data;

  SubContractHomeModel({this.status, this.data});

  SubContractHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  String? contractId;
  String? subWorkName;
  List<String>? workTypeNames;
  String? contractor;
  String? description;
  String? contractType;
  String? opBalance;
  String? totalBudget;
  int? noOfBills;
  String? billAmount;
  String? billPaidAmount;
  String? advancePaidAmount;
  String? billBalanceAmount;
  String? contractApprovalStatusFlag;
  String? contractApprovalStatus;

  Data(
      {this.contractId,
      this.subWorkName,
      this.workTypeNames,
      this.contractor,
      this.description,
      this.contractType,
      this.opBalance,
      this.totalBudget,
      this.noOfBills,
      this.billAmount,
      this.billPaidAmount,
      this.advancePaidAmount,
      this.billBalanceAmount,
      this.contractApprovalStatusFlag,
      this.contractApprovalStatus});

  Data.fromJson(Map<String, dynamic> json) {
    contractId = json['contract_id'];
    subWorkName = json['sub_work_name'];
    workTypeNames = json['work_type_names'].cast<String>();
    contractor = json['contractor'];
    description = json['description'];
    contractType = json['contract_type'];
    opBalance = json['op_balance'];
    totalBudget = json['total_budget'];
    noOfBills = json['no_of_bills'];
    billAmount = json['bill_amount'];
    billPaidAmount = json['bill_paid_amount'];
    advancePaidAmount = json['advance_paid_amount'];
    billBalanceAmount = json['bill_balance_amount'];
    contractApprovalStatusFlag = json['contract_approval_status_flag'];
    contractApprovalStatus = json['contract_approval_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contract_id'] = this.contractId;
    data['sub_work_name'] = this.subWorkName;
    data['work_type_names'] = this.workTypeNames;
    data['contractor'] = this.contractor;
    data['description'] = this.description;
    data['contract_type'] = this.contractType;
    data['op_balance'] = this.opBalance;
    data['total_budget'] = this.totalBudget;
    data['no_of_bills'] = this.noOfBills;
    data['bill_amount'] = this.billAmount;
    data['bill_paid_amount'] = this.billPaidAmount;
    data['advance_paid_amount'] = this.advancePaidAmount;
    data['bill_balance_amount'] = this.billBalanceAmount;
    data['contract_approval_status_flag'] = this.contractApprovalStatusFlag;
    data['contract_approval_status'] = this.contractApprovalStatus;
    return data;
  }
}

class FixedRate {
  String? work;
  String? fixed_unit;

  String? work_type;
  String? unit;
  String? unitname;
  String? unit_rate;
  String? quantity;
  String? est_amount;
  String? remarks;
  bool? isSelected = false;

  FixedRate(
      {this.work_type,
      this.unitname,
      this.fixed_unit,
      this.work,
      this.unit,
      this.unit_rate,
      this.quantity,
      this.est_amount,
      this.remarks,
      this.isSelected});

  FixedRate.fromJson(Map<String, dynamic> json) {
    work_type = json['work_type'];
    unit = json['unit'];
    unit_rate = json['unit_rate'];
    quantity = json['quantity'];
    est_amount = json['est_amount'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['work_type'] = this.work_type;
    data['unit'] = this.unit;
    data['unit_rate'] = this.unit_rate;
    data['quantity'] = this.quantity;
    data['est_amount'] = this.est_amount;
    data['remarks'] = this.remarks;
    return data;
  }
}

class UniteRate {
  String? unit;
  String? unit_rate;
  String? quantity;

  UniteRate({
    this.unit,
    this.unit_rate,
    this.quantity,
  });

  UniteRate.fromJson(Map<String, dynamic> json) {
    unit = json['unit'];
    unit_rate = json['unit_rate'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit'] = this.unit;
    data['unit_rate'] = this.unit_rate;
    data['quantity'] = this.quantity;
    return data;
  }
}
