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
        labourss!.add(Labourss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['work_id'] = workId;
    if (labourss != null) {
      data['labourss'] = labourss!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Labourss {
  String? labourId;
  String? basicWage;
  String? overtimeWage;
  // bool? isSelected=fa                          lse;

  Labourss({
    this.labourId,
    this.basicWage,
    this.overtimeWage,
  });

  Labourss.fromJson(Map<String, dynamic> json) {
    labourId = json['labour_id'];
    basicWage = json['basic_wage'];
    overtimeWage = json['overtime_wage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labour_id'] = labourId;
    data['basic_wage'] = basicWage;
    data['overtime_wage'] = overtimeWage;
    return data;
  }
}
