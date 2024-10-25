class GrouLabourss {
  String? labourId;
  String? basicWage;
  String? nooflabours;
  String? overtime_wage;
  String? extra_wage;
  String? workdays;
  String? ta_wage;
  bool? isSelected = false;

  GrouLabourss(
      {this.labourId,
      this.basicWage,
      this.nooflabours,
      this.overtime_wage,
      this.extra_wage,
      this.workdays,
      this.ta_wage,
      this.isSelected});

  GrouLabourss.fromJson(Map<String, dynamic> json) {
    labourId = json['labour_id'] ?? "";
    basicWage = json['basic_wage'] ?? "";
    nooflabours = json['no_of_labours'] ?? "";
    overtime_wage = json['overtime_wage'] ?? "";
    ta_wage = json['ta_wage'] ?? "0";
    extra_wage = json['extra_wage'] ?? "0";
    workdays = json['work_days'] ?? "1";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labour_id'] = this.labourId ?? "";
    data['basic_wage'] = this.basicWage ?? "";
    data['no_of_labours'] = this.nooflabours ?? "";
    data['overtime_wage'] = this.overtime_wage ?? "";
    data['ta_wage'] = this.ta_wage ?? "";
    data['extra_wage'] = this.extra_wage ?? "";
    data['work_days'] = this.workdays ?? "";
    return data;
  }
}
