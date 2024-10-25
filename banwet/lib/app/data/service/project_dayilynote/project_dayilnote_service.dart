import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/dayilnote/dailymodel.dart';
import '../dailynote/get_dailynote.dart';

class ProjectDayilNoteService {
  var storage = GetStorage();
  Future<DayilNoteModel> getDayilNote(String workid) async {
    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}daily_note/notes?user_id=${storage.read('uid')}&work_id=${workid.toString()}",
        isHeaderRequired: true);
    print(response.toString());
    return DayilNoteModel.fromJson(json.decode(response));
  }

  Future<StatusModel> deleteNote(String billId, String workid) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}daily_note/delete",
        {
          'work_id': workid.toString(),
          'user_id': storage.read('uid').toString(),
          'note_id': billId.toString()
        },
        isHeaderRequired: true);
    print(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addDayilNote({
    required String workid,
    required String title,
    required String description,
    var byte,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}daily_note/create",
        {
          'work_id': workid.toString(),
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
    log("$response++++++++++++++++++++++++$workid+++");
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> updateprojectDayilNote({
    required String workid,
    required String title,
    required String description,
    required String noteId,
    var byte,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}daily_note/update",
        {
          'user_id': storage.read('uid').toString(),
          'title': title,
          'description': description,
          "note_id": noteId,
        },
        isHeaderRequired: true);
    log("$response++++++++++++++++++++++++$workid+++");
    return StatusModel.fromJson(json.decode(response));
  }
}
