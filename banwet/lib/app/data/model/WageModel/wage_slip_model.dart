class WageSlipModel {
  bool? status;
  List<SlipData>? data;

  WageSlipModel({this.status, this.data});

  WageSlipModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SlipData>[];
      json['data'].forEach((v) {
        data!.add(new SlipData.fromJson(v));
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

class SlipData {
  String? work_type;
  String? wageId;
  String? labourName;
  String? labourId;
  String? workDate;
  String? workName;
  String? workId;
  String? fixedWageStatus;
  var noOfDays;
  String? noOfLabours;
  String? wagePerDay;
  String? overtimeWage;
  String? overtimeDuration;
  String? extraWage;
  var totalWage;
  String? remarks;
  String? createdBy;
  String? createdDate;
  String? entryApprovalStatus;
  String? taxId;

  SlipData({
    this.wageId,
    this.work_type,
    this.labourName,
    this.labourId,
    this.workDate,
    this.workName,
    this.workId,
    this.fixedWageStatus,
    this.noOfDays,
    this.noOfLabours,
    this.wagePerDay,
    this.overtimeWage,
    this.overtimeDuration,
    this.extraWage,
    this.totalWage,
    this.remarks,
    this.createdBy,
    this.createdDate,
    this.entryApprovalStatus,
    this.taxId,
  });

  SlipData.fromJson(Map<String, dynamic> json) {
    wageId = json['wage_id'];
    work_type = json['work_type'];
    labourName = json['labour_name'];
    labourId = json['labour_id'];
    workDate = json['work_date'];
    workName = json['work_name'];
    workId = json['work_id'];
    fixedWageStatus = json['fixed_wage_status'];
    noOfDays = json['no_of_days'];
    noOfLabours = json['no_of_labours'];
    wagePerDay = json['wage_per_day'];
    overtimeWage = json['overtime_wage'];
    overtimeDuration = json['overtime_duration'];
    extraWage = json['extra_wage'];
    totalWage = json['total_wage'];
    remarks = json['remarks'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    entryApprovalStatus = json['entry_approval_status'];
    taxId = json['tax_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wage_id'] = this.wageId;
    data['work_type'] = this.work_type;
    data['labour_name'] = this.labourName;
    data['labour_id'] = this.labourId;
    data['work_date'] = this.workDate;
    data['work_name'] = this.workName;
    data['work_id'] = this.workId;
    data['fixed_wage_status'] = this.fixedWageStatus;
    data['no_of_days'] = this.noOfDays;
    data['no_of_labours'] = this.noOfLabours;
    data['wage_per_day'] = this.wagePerDay;
    data['overtime_wage'] = this.overtimeWage;
    data['overtime_duration'] = this.overtimeDuration;
    data['extra_wage'] = this.extraWage;
    data['total_wage'] = this.totalWage;
    data['remarks'] = this.remarks;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    data['entry_approval_status'] = this.entryApprovalStatus;
    data['tax_id'] = this.taxId;
    return data;
  }
}
