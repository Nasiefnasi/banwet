class AssignProjectModel {
  List<ProjectData>? data;

  AssignProjectModel({this.data});

  AssignProjectModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProjectData>[];
      json['data'].forEach((v) {
        data!.add(ProjectData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectData {
  String? workId;
  String? workName;
  String? workType;
  String? workStatus;
  String? workLocation;
  String? clientName;
  String? clientContact;
  String? workName1;

  ProjectData(
      {this.workId,
      this.workName,
      this.workType,
      this.workStatus,
      this.workLocation,
      this.clientName,
      this.clientContact,
      this.workName1});

  ProjectData.fromJson(Map<String, dynamic> json) {
    workId = json['work_id'];
    workName = json['work_name'];
    workType = json['work_type'];
    workStatus = json['work_status'];
    workLocation = json['work_location'];
    clientName = json['client_name'];
    clientContact = json['client_contact'];
    workName1 = json['work_name_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['work_id'] = workId;
    data['work_name'] = workName;
    data['work_type'] = workType;
    data['work_status'] = workStatus;
    data['work_location'] = workLocation;
    data['client_name'] = clientName;
    data['client_contact'] = clientContact;
    data['work_name_1'] = workName1;
    return data;
  }
}
