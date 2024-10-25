

// class GetWorkTypeService {
//   var storage = GetStorage();
//   Future<LabourListModel> getLabourList() async {
//     final response = await ApiBaseHelper.get(
//         "${BaseUrl.baseUrl}/labours/select_labours?user_id=${storage.read('uid')}",
//         isHeaderRequired: true);

//     print(response.toString());
//     return LabourListModel.fromJson(json.decode(response));
//   }
// }
