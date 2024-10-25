class LabourListModel {
  bool? status;
  List<LabourData>? data;

  LabourListModel({this.status, this.data});

  LabourListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <LabourData>[];
      json['data'].forEach((v) {
        data!.add(new LabourData.fromJson(v));
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

class LabourData {
  String? labourId;
  String? labourName;
  String? contactNo;
  String? workType;
  String? workTypeId;
  int? opBalance;
  String? fixedWageStatus;
  dynamic dailyWage;
  String? labourType;
  int? editable;
  String? contactNo2;
  String? address;
  String? aadharNo;
  String? photo;

  LabourData(
      {this.labourId,
      this.labourName,
      this.contactNo,
      this.workType,
      this.workTypeId,
      this.opBalance,
      this.fixedWageStatus,
      this.dailyWage,
      this.labourType,
      this.editable,
      this.contactNo2,
      this.address,
      this.aadharNo,
      this.photo});

  LabourData.fromJson(Map<String, dynamic> json) {
    labourId = json['labour_id'];
    labourName = json['labour_name'];
    contactNo = json['contact_no'];
    workType = json['work_type'];
    workTypeId = json['work_type_id'];
    opBalance = json['op_balance'];
    fixedWageStatus = json['fixed_wage_status'];
    dailyWage = json['daily_wage'];
    labourType = json['labour_type'];
    editable = json['editable'];
    contactNo2 = json['contact_no_2'];
    address = json['address'];
    aadharNo = json['aadhar_no'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labour_id'] = this.labourId;
    data['labour_name'] = this.labourName;
    data['contact_no'] = this.contactNo;
    data['work_type'] = this.workType;
    data['work_type_id'] = this.workTypeId;
    data['op_balance'] = this.opBalance;
    data['fixed_wage_status'] = this.fixedWageStatus;
    data['daily_wage'] = this.dailyWage;
    data['labour_type'] = this.labourType;
    data['editable'] = this.editable;
    data['contact_no_2'] = this.contactNo2;
    data['address'] = this.address;
    data['aadhar_no'] = this.aadharNo;
    data['photo'] = this.photo;
    return data;
  }
}
