class NotificationModel {
  List<NotificationModelData>? data;
  int? count;

  NotificationModel({this.data, this.count});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => NotificationModelData.fromJson(e))
              .toList();
    }
    if (json["count"] is int) {
      count = json["count"];
    }
  }
}

class NotificationModelData {
  String? notificationType;
  String? referenceId;
  String? referenceType;
  String? workId;
  String? title;
  String? message;
  String? notificationDate;

  NotificationModelData(
      {this.notificationType,
      this.referenceId,
      this.referenceType,
      this.workId,
      this.title,
      this.message,
      this.notificationDate});

  NotificationModelData.fromJson(Map<String, dynamic> json) {
    if (json["notification_type"] is String) {
      notificationType = json["notification_type"];
    }
    if (json["reference_id"] is String) {
      referenceId = json["reference_id"];
    }
    if (json["reference_type"] is String) {
      referenceType = json["reference_type"];
    }
    if (json["work_id"] is String) {
      workId = json["work_id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["notification_date"] is String) {
      notificationDate = json["notification_date"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["notification_type"] = notificationType;
    data["reference_id"] = referenceId;
    data["reference_type"] = referenceType;
    data["work_id"] = workId;
    data["title"] = title;
    data["message"] = message;
    data["notification_date"] = notificationDate;
    return data;
  }
}
