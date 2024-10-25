// To parse this JSON data, do
//
//     final projecttaskmodel = projecttaskmodelFromJson(jsonString);

import 'dart:convert';

Projecttaskmodel projecttaskmodelFromJson(String str) =>
    Projecttaskmodel.fromJson(json.decode(str));

String projecttaskmodelToJson(Projecttaskmodel data) =>
    json.encode(data.toJson());

class Projecttaskmodel {
  final bool status;
  final List<Projecttaskdetailsiteams> data;

  Projecttaskmodel({
    required this.status,
    required this.data,
  });

  factory Projecttaskmodel.fromJson(Map<String, dynamic> json) =>
      Projecttaskmodel(
        status: json["status"],
        data: List<Projecttaskdetailsiteams>.from(
            json["data"].map((x) => Projecttaskdetailsiteams.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Projecttaskdetailsiteams {
  final String taskId;
  final String taskTitle;
  final String taskDescription;
  final String plannedStartDate;
  final String plannedEndDate;
  final String actualStartDate;
  final String actualEndDate;
  final dynamic progress;
  final String supervisor;
  final String taskStatusText;
  final String taskStatus;
  final String taskDateStatusText;
  final String createdBy;
  final String createdDate;
  final int duration;
  final String taskType;

  Projecttaskdetailsiteams({
    required this.taskId,
    required this.taskTitle,
    required this.taskDescription,
    required this.plannedStartDate,
    required this.plannedEndDate,
    required this.actualStartDate,
    required this.actualEndDate,
    required this.progress,
    required this.supervisor,
    required this.taskStatusText,
    required this.taskStatus,
    required this.taskDateStatusText,
    required this.createdBy,
    required this.createdDate,
    required this.duration,
    required this.taskType,
  });

  factory Projecttaskdetailsiteams.fromJson(Map<String, dynamic> json) =>
      Projecttaskdetailsiteams(
        taskId: json["task_id"],
        taskTitle: json["task_title"],
        taskDescription: json["task_description"],
        plannedStartDate: json["planned_start_date"],
        plannedEndDate: json["planned_end_date"],
        actualStartDate: json["actual_start_date"],
        actualEndDate: json["actual_end_date"],
        progress: json["progress"],
        supervisor: json["supervisor"],
        taskStatusText: json["task_status_text"],
        taskStatus: json["task_status"],
        taskDateStatusText: json["task_date_status_text"],
        createdBy: json["created_by"],
        createdDate: json["created_date"],
        duration: json["duration"],
        taskType: json["task_type"],
      );

  Map<String, dynamic> toJson() => {
        "task_id": taskId,
        "task_title": taskTitle,
        "task_description": taskDescription,
        "planned_start_date": plannedStartDate,
        "planned_end_date": plannedEndDate,
        "actual_start_date": actualStartDate,
        "actual_end_date": actualEndDate,
        "progress": progress,
        "supervisor": supervisor,
        "task_status_text": taskStatusText,
        "task_status": taskStatus,
        "task_date_status_text": taskDateStatusText,
        "created_by": createdBy,
        "created_date": createdDate,
        "duration": duration,
        "task_type": taskType,
      };
}
