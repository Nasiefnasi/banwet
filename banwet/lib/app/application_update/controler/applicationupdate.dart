
// class ApplicationUpdate extends GetxController {
//   var storage = GetStorage();
//   updationfind() async {
//     var headers = {
//       'x-api-key': '159753',
//       'Content-Type': 'application/x-www-form-urlencoded',
//     };
//     var request = http.Request(
//         'GET',
//         Uri.parse(
//             'https://test.smartbuildapp.com/api/login/app_update?user_id=${storage.read('uid').toString()},&app=android_hybrid'));

//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();
//     String responseBody = await response.stream.bytesToString();

//     if (response.statusCode == 200 || response.statusCode == 201) {
//       // updateVertionFromJson(responseBody);
//     } else {
//       print(response.reasonPhrase);
//     }
//   }
// }
