class LabourModel {
  bool? status;
  List<LaboursPayData>? labours;

  LabourModel({this.status, this.labours});

  LabourModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['labours'] != null) {
      labours = <LaboursPayData>[];
      json['labours'].forEach((v) {
        labours!.add(LaboursPayData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (labours != null) {
      data['labours'] = labours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LaboursPayData {
  String? labourId;
  String? labourName;
  String? workType;
  String? fixedWageStatus;
  int? dailyWage;
  var overtimeRate;
  String? labourType;
  String? groupPosition;
  int? currentBalancePersonal;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labour_id'] = labourId;
    data['labour_name'] = labourName;
    data['work_type'] = workType;
    data['fixed_wage_status'] = fixedWageStatus;
    data['daily_wage'] = dailyWage;
    data['overtime_rate'] = overtimeRate;
    data['labour_type'] = labourType;
    data['group_position'] = groupPosition;
    data['current_balance_personal'] = currentBalancePersonal;
    data['current_balance_group'] = currentBalanceGroup;
    data['photo'] = photo;
    return data;
  }
}
