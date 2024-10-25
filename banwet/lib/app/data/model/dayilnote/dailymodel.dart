// class DayilNoteModel {
//   DayilNoteModel({required this.status, this.data, this.message});
//   late final bool status;
//   late final String? message;
//   late final List<DayilyNoteData>? data;

//   DayilNoteModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = List.from(json['data'])
//             .map((e) => DayilyNoteData.fromJson(e))
//             .toList() ??
//         [];
//   }
// }
class DayilNoteModel {
  DayilNoteModel({
    required this.status,
    this.data,
    this.message,
  });

  late final bool status;
  late final String? message;
  late final List<DayilyNoteData>? data;

  // Updated fromJson constructor
  DayilNoteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false; // Default to false if missing
    message = json['message'] ?? ''; // Handle null or missing message

    // Handle the case where 'data' might be null or not a list
    if (json['data'] != null && json['data'] is List) {
      data = List.from(json['data'])
          .map((e) => DayilyNoteData.fromJson(e))
          .toList();
    } else {
      data = []; // Set to an empty list if no data is present
    }
  }
}

class DayilyNoteData {
  DayilyNoteData({
    required this.noteId,
    required this.title,
    this.workName,
    required this.noteDate,
    required this.description,
    required this.image,
    required this.createdBy,
    required this.createdDate,
  });
  late final String noteId;
  late final String title;
  late final String? workName;
  late final String noteDate;
  late final String description;
  late final String image;
  late final String createdBy;
  late final String createdDate;

  DayilyNoteData.fromJson(Map<String, dynamic> json) {
    noteId = json['note_id'];
    title = json['title'];
    workName = null;
    noteDate = json['note_date'];
    description = json['description'];
    image = json['image'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
  }
}
