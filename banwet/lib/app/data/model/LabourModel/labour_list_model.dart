class LabourModel {
  bool? status;
  List<LaboursPayData>? labours;

  LabourModel({this.status, this.labours});

  LabourModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['labours'] != null) {
      labours = <LaboursPayData>[];
      json['labours'].forEach((v) {
        labours!.add(new LaboursPayData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.labours != null) {
      data['labours'] = this.labours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LaboursPayData {
  String? labourId;
  String? labourName;
  String? workType;
  String? fixedWageStatus;
  dynamic dailyWage;
  var overtimeRate;
  String? labourType;
  String? groupPosition;
  dynamic currentBalancePersonal;
  int? currentBalanceGroup;
  String? photo;

  LaboursPayData(
      {this.labourId,
        this.labourName,
        this.workType,
        this.fixedWageStatus,
        this.dailyWage,
        this.overtimeRate,
        this.labourType,
        this.groupPosition,
        this.currentBalancePersonal,
        this.currentBalanceGroup,
        this.photo});

  LaboursPayData.fromJson(Map<String, dynamic> json) {
    labourId = json['labour_id'];
    labourName = json['labour_name'];
    workType = json['work_type'];
    fixedWageStatus = json['fixed_wage_status'];
    dailyWage = json['daily_wage'];
    overtimeRate = json['overtime_rate'];
    labourType = json['labour_type'];
    groupPosition = json['group_position'];
    currentBalancePersonal = json['current_balance_personal'];
    currentBalanceGroup = json['current_balance_group'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labour_id'] = this.labourId;
    data['labour_name'] = this.labourName;
    data['work_type'] = this.workType;
    data['fixed_wage_status'] = this.fixedWageStatus;
    data['daily_wage'] = this.dailyWage;
    data['overtime_rate'] = this.overtimeRate;
    data['labour_type'] = this.labourType;
    data['group_position'] = this.groupPosition;
    data['current_balance_personal'] = this.currentBalancePersonal;
    data['current_balance_group'] = this.currentBalanceGroup;
    data['photo'] = this.photo;
    return data;
  }
}
