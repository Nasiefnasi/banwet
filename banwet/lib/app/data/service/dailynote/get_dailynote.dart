import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/dayilnote/dailymodel.dart';

class DayilNoteService {
  var storage = GetStorage();
  Future<DayilNoteModel> getDayilNote() async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}daily_note/notes?user_id=${storage.read('uid')}",
        isHeaderRequired: true);
    print(response.toString());
    var a = json.decode(response);

    if (a["status"]) {
      return DayilNoteModel.fromJson(json.decode(response));
    } else {
      DayilNoteModel emptyModelList = DayilNoteModel(data: [], status: false);
      return emptyModelList;
    }
  }

  Future<StatusModel> deleteNote(String billId) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}daily_note/delete",
        {
          'user_id': storage.read('uid').toString(),
          'note_id': billId.toString()
        },
        isHeaderRequired: true);
    print(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> updateNote(
      String billId, String title, String description) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}daily_note/update",
        {
          'user_id': storage.read('uid').toString(),
          'note_id': billId.toString(),
          'title': title,
          'description': description,
        },
        isHeaderRequired: true);
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addDayilNote({
    required String title,
    required String description,
    var byte,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}daily_note/create",
        {
          'user_id': storage.read('uid').toString(),
          'title': title,
          'description': description,
          'image': byte == null ? "" : base64Encode(byte),
          'image2': "",
          'image3': "",
          'address': storage.read('address').toString(),
          'latitude': storage.read('latitude').toString(),
          'longitude': storage.read('longitude').toString(),
        },
        isHeaderRequired: true);
    log("$response+++++++++++++++++++++++++++");
    return StatusModel.fromJson(json.decode(response));
  }
}

class StatusModel {
  StatusModel({
    required this.status,
    required this.message,
  });
  late final bool status;
  late final String message;

  StatusModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}
