class SubActivityModel {
  bool? status;
  List<SubActivityData>? data;

  SubActivityModel({this.status, this.data});

  SubActivityModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <SubActivityData>[];
      json['data'].forEach((v) {
        data!.add(new SubActivityData.fromJson(v));
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

class SubActivityData {
  String? reportId;
  String? workName;
  String? contractor;
  var workType;
  String? subWorkName;
  String? date;
  String? title;
  String? description;
  String? createdBy;
  String? createdDate;

  SubActivityData(
      {this.reportId,
        this.workName,
        this.contractor,
        this.workType,
        this.subWorkName,
        this.date,
        this.title,
        this.description,
        this.createdBy,
        this.createdDate});

  SubActivityData.fromJson(Map<String, dynamic> json) {
    reportId = json['report_id'];
    workName = json['work_name'];
    contractor = json['contractor'];
    workType = json['work_type'];
    subWorkName = json['sub_work_name'];
    date = json['date'];
    title = json['title'];
    description = json['description'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['report_id'] = this.reportId;
    data['work_name'] = this.workName;
    data['contractor'] = this.contractor;
    data['work_type'] = this.workType;
    data['sub_work_name'] = this.subWorkName;
    data['date'] = this.date;
    data['title'] = this.title;
    data['description'] = this.description;
    data['created_by'] = this.createdBy;
    data['created_date'] = this.createdDate;
    return data;
  }
}
