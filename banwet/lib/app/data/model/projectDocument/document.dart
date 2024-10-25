// To parse this JSON data, do
//
//     final projectDocumentModel = projectDocumentModelFromJson(jsonString);

import 'dart:convert';

ProjectDocumentModel projectDocumentModelFromJson(String str) =>
    ProjectDocumentModel.fromJson(json.decode(str));

String projectDocumentModelToJson(ProjectDocumentModel data) =>
    json.encode(data.toJson());

class ProjectDocumentModel {
  final bool status;
  final List<Dpocuments> data;

  ProjectDocumentModel({
    required this.status,
    required this.data,
  });

  factory ProjectDocumentModel.fromJson(Map<String, dynamic> json) =>
      ProjectDocumentModel(
        status: json["status"],
        data: List<Dpocuments>.from(
            json["data"].map((x) => Dpocuments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Dpocuments {
  final String id;
  final String title;
  final String description;
  final String file;

  Dpocuments({
    required this.id,
    required this.title,
    required this.description,
    required this.file,
  });

  factory Dpocuments.fromJson(Map<String, dynamic> json) => Dpocuments(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "file": file,
      };
}
