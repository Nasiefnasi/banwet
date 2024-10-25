class LabourActivityModel {
  bool? status;
  List<LabourActData>? data;

  LabourActivityModel({this.status, this.data});

  LabourActivityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <LabourActData>[];
      json['data'].forEach((v) {
        data!.add(LabourActData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LabourActData {
  String? reportId;
  String? workName;
  String? labourName;
  String? labourId;
  String? workType;
  String? date;
  String? title;
  String? description;
  String? createdBy;
  String? createdDate;

  LabourActData(
      {this.reportId,
      this.workName,
      this.labourName,
      this.labourId,
      this.workType,
      this.date,
      this.title,
      this.description,
      this.createdBy,
      this.createdDate});

  LabourActData.fromJson(Map<String, dynamic> json) {
    reportId = json['report_id'];
    workName = json['work_name'];
    labourName = json['labour_name'];
    labourId = json['labour_id'];
    workType = json['work_type'];
    date = json['date'];
    title = json['title'];
    description = json['description'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['report_id'] = reportId;
    data['work_name'] = workName;
    data['labour_name'] = labourName;
    data['labour_id'] = labourId;
    data['work_type'] = workType;
    data['date'] = date;
    data['title'] = title;
    data['description'] = description;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    return data;
  }
}
