// // class HomepageTaskModel {
// //   bool? status;
// //   List<TaskDetails>? data;

// //   TaskModel({this.status, this.data});

// //   TaskModel.fromJson(Map<String, dynamic> json) {
// //     if (json["status"] is bool) {
// //       status = json["status"];
// //     }
// //     if (json["data"] is List) {
// //       data = json["data"] == null
// //           ? null
// //           : (json["data"] as List).map((e) => TaskData.fromJson(e)).toList();
// //     }
// //   }
// // }

// // class TaskData {
// //   String? taskId;
// //   String? workName;
// //   String? taskTitle;
// //   String? taskStatus;
// //   String? dueDate;
// //   String? taskDescription;
// //   String? createdBy;
// //   String? createdDate;

// //   TaskData(
// //       {this.taskId,
// //       this.workName,
// //       this.taskTitle,
// //       this.taskStatus,
// //       this.dueDate,
// //       this.taskDescription,
// //       this.createdBy,
// //       this.createdDate});

// //   TaskData.fromJson(Map<String, dynamic> json) {
// //     if (json["task_id"] is String) {
// //       taskId = json["task_id"];
// //     }
// //     if (json["work_name"] is String) {
// //       workName = json["work_name"];
// //     }
// //     if (json["task_title"] is String) {
// //       taskTitle = json["task_title"];
// //     }
// //     if (json["task_status"] is String) {
// //       taskStatus = json["task_status"];
// //     }
// //     if (json["due_date"] is String) {
// //       dueDate = json["due_date"];
// //     }
// //     if (json["task_description"] is String) {
// //       taskDescription = json["task_description"];
// //     }
// //     if (json["created_by"] is String) {
// //       createdBy = json["created_by"];
// //     }
// //     if (json["created_date"] is String) {
// //       createdDate = json["created_date"];
// //     }
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data["task_id"] = taskId;
// //     data["work_name"] = workName;
// //     data["task_title"] = taskTitle;
// //     data["task_status"] = taskStatus;
// //     data["due_date"] = dueDate;
// //     data["task_description"] = taskDescription;
// //     data["created_by"] = createdBy;
// //     data["created_date"] = createdDate;
// //     return data;
// //   }
// // }
// class TaskModel {
//   bool? status;
//   List<TaskData>? data;

//   TaskModel({this.status, this.data});

//   TaskModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"] as bool?;
//     data = (json["data"] as List<dynamic>?)
//         ?.map((e) => TaskData.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["status"] = status;
//     if (this.data != null) {
//       data["data"] = this.data!.map((e) => e.toJson()).toList();
//     }
//     return data;
//   }
// }

// class TaskData {
//   String? taskId;
//   String? workName;
//   String? taskTitle;
//   String? taskStatus;
//   String? dueDate;
//   String? taskDescription;
//   String? createdBy;
//   String? createdDate;

//   TaskData({
//     this.taskId,
//     this.workName,
//     this.taskTitle,
//     this.taskStatus,
//     this.dueDate,
//     this.taskDescription,
//     this.createdBy,
//     this.createdDate,
//   });

//   TaskData.fromJson(Map<String, dynamic> json) {
//     taskId = json["task_id"] as String?;
//     workName = json["work_name"] as String?;
//     taskTitle = json["task_title"] as String?;
//     taskStatus = json["task_status"] as String?;
//     dueDate = json["due_date"] as String?;
//     taskDescription = json["task_description"] as String?;
//     createdBy = json["created_by"] as String?;
//     createdDate = json["created_date"] as String?;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["task_id"] = taskId;
//     data["work_name"] = workName;
//     data["task_title"] = taskTitle;
//     data["task_status"] = taskStatus;
//     data["due_date"] = dueDate;
//     data["task_description"] = taskDescription;
//     data["created_by"] = createdBy;
//     data["created_date"] = createdDate;
//     return data;
//   }
// }
// class TaskModel {
//   bool? status;
//   List<TaskData>? data;
//   String? message;
//   TaskModel({this.status, this.data, this.message});

//   TaskModel.fromJson(Map<String, dynamic> json) {
//     status = json["status"] ?? false;
//     message = json["status"] ?? "";
//     data = (json["data"] as List<dynamic>?)
//         ?.map((e) => TaskData.fromJson(e as Map<String, dynamic>))
//         .toList();
//   }

// Map<String, dynamic> toJson() {
//   final Map<String, dynamic> data = <String, dynamic>{};
//   data["status"] = status;
//   if (this.data != null) {
//     data["data"] = this.data!.map((e) => e.toJson()).toList();
//   }
//   return data;
// }

// }
class TaskModel {
  bool? status;
  List<TaskData>? data;
  String? message;

  TaskModel({this.status, this.data, this.message});

  TaskModel.fromJson(Map<String, dynamic> json) {
    status = json["status"] ?? false;

    message = json["message"] ?? "";

    if (json["data"] != null && json["data"] is List) {
      data = (json["data"] as List<dynamic>)
          .map((e) => TaskData.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    if (this.data != null && this.data!.isNotEmpty) {
      data["data"] = this.data!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class TaskData {
  String? taskId;
  String? workName;
  String? taskTitle;
  String? taskStatus;
  String? dueDate;
  String? taskDescription;
  String? createdBy;
  String? createdDate;

  TaskData({
    this.taskId,
    this.workName,
    this.taskTitle,
    this.taskStatus,
    this.dueDate,
    this.taskDescription,
    this.createdBy,
    this.createdDate,
  });

  TaskData.fromJson(Map<String, dynamic> json) {
    taskId = json["task_id"] as String? ?? "";
    workName = json["work_name"] as String? ?? "";
    taskTitle = json["task_title"] as String? ?? "";
    taskStatus = json["task_status"] as String? ?? "";
    dueDate = json["due_date"] as String? ?? "";
    taskDescription = json["task_description"] as String? ?? "";
    createdBy = json["created_by"] as String? ?? "";
    createdDate = json["created_date"] as String? ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["task_id"] = taskId ?? "";
    data["work_name"] = workName ?? "";
    data["task_title"] = taskTitle ?? "";
    data["task_status"] = taskStatus ?? "";
    data["due_date"] = dueDate ?? "";
    data["task_description"] = taskDescription ?? "";
    data["created_by"] = createdBy ?? "";
    data["created_date"] = createdDate ?? "";
    return data;
  }
}

class HomepageTaskModel {
  bool? status;
  List<TaskDetails>? data;

  HomepageTaskModel({this.status, this.data});

  HomepageTaskModel.fromJson(Map<String, dynamic> json) {
    status = json["status"] as bool?;
    data = (json["data"] as List<dynamic>?)
        ?.map((e) => TaskDetails.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    if (this.data != null) {
      data["data"] = this.data!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class TaskDetails {
  String? taskId;
  String? work_id;
  String? workName;
  String? taskTitle;
  String? taskStatus;
  String? dueDate;
  String? taskDescription;
  String? createdBy;
  String? createdDate;

  TaskDetails({
    this.taskId,
    this.work_id,
    this.workName,
    this.taskTitle,
    this.taskStatus,
    this.dueDate,
    this.taskDescription,
    this.createdBy,
    this.createdDate,
  });

  TaskDetails.fromJson(Map<String, dynamic> json) {
    taskId = json["task_id"] as String? ?? "";
    work_id = json["work_id"] as String? ?? "";
    workName = json["work_name"] as String? ?? "";
    taskTitle = json["task_title"] as String? ?? "";
    taskStatus = json["task_status"] as String? ?? "";
    dueDate = json["due_date"] as String? ?? "";
    taskDescription = json["task_description"] as String? ?? "";
    createdBy = json["created_by"] as String? ?? "";
    createdDate = json["created_date"] as String? ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["task_id"] = taskId ?? "";
    data["work_id"] = work_id ?? "";
    data["work_name"] = workName ?? "";
    data["task_title"] = taskTitle ?? "";
    data["task_status"] = taskStatus ?? "";
    data["due_date"] = dueDate ?? "";
    data["task_description"] = taskDescription ?? "";
    data["created_by"] = createdBy ?? "";
    data["created_date"] = createdDate ?? "";
    return data;
  }
}
