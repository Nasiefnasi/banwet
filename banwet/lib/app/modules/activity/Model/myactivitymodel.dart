// To parse this JSON data, do
//
//     final myActivityModel = myActivityModelFromJson(jsonString);

import 'dart:convert';

MyActivityModel myActivityModelFromJson(String str) =>
    MyActivityModel.fromJson(json.decode(str));

String myActivityModelToJson(MyActivityModel data) =>
    json.encode(data.toJson());

class MyActivityModel {
  final List<MyActivitesiteams> data;
  final int count;

  MyActivityModel({
    required this.data,
    required this.count,
  });

  factory MyActivityModel.fromJson(Map<String, dynamic> json) =>
      MyActivityModel(
        data: List<MyActivitesiteams>.from(
            json["data"].map((x) => MyActivitesiteams.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "count": count,
      };
}

class MyActivitesiteams {
  final String date;
  final String activityThrough;
  final String activityDescription;
  final String details;

  MyActivitesiteams({
    required this.date,
    required this.activityThrough,
    required this.activityDescription,
    required this.details,
  });

  factory MyActivitesiteams.fromJson(Map<String, dynamic> json) =>
      MyActivitesiteams(
        date: json["date"],
        activityThrough: json["activity_through"],
        activityDescription: json["activity_description"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "activity_through": activityThrough,
        "activity_description": activityDescription,
        "details": details,
      };
}

enum ActivityDescription {
  DAILY_NOTE_ACTIVITY,
  DAILY_TASK_ACTIVITY,
  LOGGED_IN,
  LOGGED_OUT,
  MARKED_AS_LEAVE,
  SIGNED_IN,
  SIGNED_OFF
}

final activityDescriptionValues = EnumValues({
  "Daily Note Activity": ActivityDescription.DAILY_NOTE_ACTIVITY,
  "Daily Task Activity": ActivityDescription.DAILY_TASK_ACTIVITY,
  "Logged In": ActivityDescription.LOGGED_IN,
  "Logged Out": ActivityDescription.LOGGED_OUT,
  "Marked as Leave": ActivityDescription.MARKED_AS_LEAVE,
  "Signed In": ActivityDescription.SIGNED_IN,
  "Signed Off": ActivityDescription.SIGNED_OFF
});

enum ActivityThrough { MOBILE_APP, WEBAPP }

final activityThroughValues = EnumValues({
  "Mobile App": ActivityThrough.MOBILE_APP,
  "Webapp": ActivityThrough.WEBAPP
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
