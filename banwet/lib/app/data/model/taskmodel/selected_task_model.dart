// class SelectedTaskModel {
//   bool? status;
//   String? taskId;
//   String? title;
//   String? taskStatus;
//   String? workName;
//   String? dueDate;
//   String? taskDescription;
//   String? createdBy;
//   String? createdDate;
//   String? message;
//   List<dynamic>? activities;

//   SelectedTaskModel({this.status, this.taskId, this.title, this.taskStatus, this.workName, this.dueDate, this.taskDescription, this.createdBy, this.createdDate, this.message, this.activities});

//   SelectedTaskModel.fromJson(Map<String, dynamic> json) {
//     if(json["status"] is bool) {
//       status = json["status"];
//     }
//     if(json["task_id"] is String) {
//       taskId = json["task_id"];
//     }
//     if(json["title"] is String) {
//       title = json["title"];
//     }
//     if(json["task_status"] is String) {
//       taskStatus = json["task_status"];
//     }
//     if(json["work_name"] is String) {
//       workName = json["work_name"];
//     }
//     if(json["due_date"] is String) {
//       dueDate = json["due_date"];
//     }
//     if(json["task_description"] is String) {
//       taskDescription = json["task_description"];
//     }
//     if(json["created_by"] is String) {
//       createdBy = json["created_by"];
//     }
//     if(json["created_date"] is String) {
//       createdDate = json["created_date"];
//     }
//     if(json["message"] is String) {
//       message = json["message"];
//     }
//     if(json["activities"] is List) {
//       activities = json["activities"] ?? [];
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["status"] = status;
//     _data["task_id"] = taskId;
//     _data["title"] = title;
//     _data["task_status"] = taskStatus;
//     _data["work_name"] = workName;
//     _data["due_date"] = dueDate;
//     _data["task_description"] = taskDescription;
//     _data["created_by"] = createdBy;
//     _data["created_date"] = createdDate;
//     _data["message"] = message;
//     if(activities != null) {
//       _data["activities"] = activities;
//     }
//     return _data;
//   }
// }

class SelectedTaskModel {
  bool? status;
  String? taskId;
  String? title;
  String? taskStatus;
  String? workName;
  String? dueDate;
  String? taskDescription;
  String? createdBy;
  String? createdDate;
  String? message;
  List<Activity>? activities;

  SelectedTaskModel({
    this.status,
    this.taskId,
    this.title,
    this.taskStatus,
    this.workName,
    this.dueDate,
    this.taskDescription,
    this.createdBy,
    this.createdDate,
    this.message,
    this.activities,
  });

  SelectedTaskModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    taskId = json["task_id"] ?? "";
    title = json["title"] ?? "";
    taskStatus = json["task_status"] ?? "";
    workName = json["work_name"] ?? "";
    dueDate = json["due_date"] ?? "";
    taskDescription = json["task_description"] ?? "";
    createdBy = json["created_by"] ?? "";
    createdDate = json["created_date"] ?? "";
    message = json["message"] ?? "";
    if (json["activities"] is List) {
      activities = (json["activities"] as List)
          .map(
              (activity) => Activity.fromJson(activity as Map<String, dynamic>))
          .toList();
    } else {
      activities = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["task_id"] = taskId;
    data["title"] = title;
    data["task_status"] = taskStatus;
    data["work_name"] = workName;
    data["due_date"] = dueDate;
    data["task_description"] = taskDescription;
    data["created_by"] = createdBy;
    data["created_date"] = createdDate;
    data["message"] = message;
    if (activities != null) {
      data["activities"] =
          activities!.map((activity) => activity.toJson()).toList();
    }
    return data;
  }
}

class Activity {
  final String activityId;
  final String taskId;
  final String activityDate;
  final String description;
  final String createdBy;
  final String title;
  final String createdDate;

  Activity({
    required this.title,
    required this.activityId,
    required this.taskId,
    required this.activityDate,
    required this.description,
    required this.createdBy,
    required this.createdDate,
  });

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        title: json['title'] ?? "title",
        activityId: json["activity_id"] ?? "",
        taskId: json["task_id"] ?? "",
        activityDate: json["activity_date"] ?? "",
        description: json["description"] ?? "",
        createdBy: json["created_by"] ?? "",
        createdDate: json["created_date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "activity_id": activityId,
        "task_id": taskId,
        "activity_date": activityDate,
        "description": description,
        "created_by": createdBy,
        "created_date": createdDate,
      };
}
