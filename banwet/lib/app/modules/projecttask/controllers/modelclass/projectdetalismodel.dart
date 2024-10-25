// To parse this JSON data, do
//
//     final SubTaskActivitys = projecttastListDetailsModelFromJson(jsonString);

import 'dart:convert';

ProjecttastListDetailsModel projecttastListDetailsModelFromJson(String str) =>
    ProjecttastListDetailsModel.fromJson(json.decode(str));

String projecttastListDetailsModelToJson(ProjecttastListDetailsModel data) =>
    json.encode(data.toJson());

class ProjecttastListDetailsModel {
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
  final List<ProjecttastListDetailsModel>? subtasks;
  final List<ProjectActivity>? activities;
  final bool? status;

  ProjecttastListDetailsModel({
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
    this.subtasks,
    this.activities,
    this.status,
  });

  factory ProjecttastListDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProjecttastListDetailsModel(
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
        subtasks: json["subtasks"] == null
            ? []
            : List<ProjecttastListDetailsModel>.from(json["subtasks"]!
                .map((x) => ProjecttastListDetailsModel.fromJson(x))),
        activities: json["activities"] == null
            ? []
            : List<ProjectActivity>.from(
                json["activities"]!.map((x) => ProjectActivity.fromJson(x))),
        status: json["status"],
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
        "subtasks": subtasks == null
            ? []
            : List<dynamic>.from(subtasks!.map((x) => x.toJson())),
        "activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
        "status": status,
      };
}

class ProjectActivity {
  final String id;
  final String date;
  final String title;
  final String description;
  final String createdBy;
  final String createdDate;

  ProjectActivity({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.createdBy,
    required this.createdDate,
  });

  factory ProjectActivity.fromJson(Map<String, dynamic> json) =>
      ProjectActivity(
        id: json["id"],
        date: json["date"],
        title: json["title"],
        description: json["description"],
        createdBy: json["created_by"],
        createdDate: json["created_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "title": title,
        "description": description,
        "created_by": createdBy,
        "created_date": createdDate,
      };
}
// import 'dart:convert';

SubTaskActivitys SubTaskActivitysFromJson(String str) =>
    SubTaskActivitys.fromJson(json.decode(str));

String SubTaskActivitysToJson(SubTaskActivitys data) =>
    json.encode(data.toJson());

class SubTaskActivitys {
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
  final List<SubTaskActivitys>? subtasks;
  final List<SubActivity>? activities;
  final bool? status;

  SubTaskActivitys({
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
    this.subtasks,
    this.activities,
    this.status,
  });

  factory SubTaskActivitys.fromJson(Map<String, dynamic> json) =>
      SubTaskActivitys(
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
        subtasks: json["subtasks"] == null
            ? []
            : List<SubTaskActivitys>.from(
                json["subtasks"]!.map((x) => SubTaskActivitys.fromJson(x))),
        activities: json["activities"] == null
            ? []
            : List<SubActivity>.from(
                json["activities"]!.map((x) => SubActivity.fromJson(x))),
        status: json["status"],
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
        "subtasks": subtasks == null
            ? []
            : List<dynamic>.from(subtasks!.map((x) => x.toJson())),
        "activities": activities == null
            ? []
            : List<dynamic>.from(activities!.map((x) => x.toJson())),
        "status": status,
      };
}

class SubActivity {
  final String id;
  final String date;
  final String title;
  final String description;
  final String createdBy;
  final String createdDate;

  SubActivity({
    required this.id,
    required this.date,
    required this.title,
    required this.description,
    required this.createdBy,
    required this.createdDate,
  });

  factory SubActivity.fromJson(Map<String, dynamic> json) => SubActivity(
        id: json["id"],
        date: json["date"],
        title: json["title"],
        description: json["description"],
        createdBy: json["created_by"],
        createdDate: json["created_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "title": title,
        "description": description,
        "created_by": createdBy,
        "created_date": createdDate,
      };
}
