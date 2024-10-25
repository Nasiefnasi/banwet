class QuickSlipModel {
  String? userId;
  String? workId;
  List<Labourss>? labourss;

  QuickSlipModel({this.userId, this.workId, this.labourss});

  QuickSlipModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    workId = json['work_id'];
    if (json['labourss'] != null) {
      labourss = <Labourss>[];
      json['labourss'].forEach((v) {
        labourss!.add(new Labourss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['work_id'] = this.workId;
    if (this.labourss != null) {
      data['labourss'] = this.labourss!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Labourss {
  String? labourId;
  String? basicWage;
  String? overtimeWage;
  String? overtimeduration;
  String? overtimerate;
  String? workdays;
  bool? isSelected = false;

  Labourss(
      {this.labourId,
      this.basicWage,
      this.overtimeWage,
      this.overtimeduration,
      this.overtimerate,
      this.workdays,
      this.isSelected});

  Labourss.fromJson(Map<String, dynamic> json) {
    labourId = json['labour_id'];
    basicWage = json['basic_wage'];
    overtimeWage = json['overtime_wage'];
    overtimeduration = json['overtime_duration'];
    overtimerate = json['overtime_rate'];
    workdays = json['work_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labour_id'] = this.labourId;
    data['basic_wage'] = this.basicWage;
    data['overtime_wage'] = this.overtimeWage;
    data['overtime_duration'] = this.overtimeduration;
    data['overtime_rate'] = this.overtimerate;
    data['work_days'] = this.workdays;
    return data;
  }
}
