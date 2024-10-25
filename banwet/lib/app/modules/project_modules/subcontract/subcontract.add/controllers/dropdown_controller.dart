import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/modules/project_modules/subcontract/subcontract.add/model/drowpdownmodel.dart';

class DropdownController extends GetxController {
  var storage = GetStorage();
  SelectedDropdowndataModel? selectedDropdowndataModel;
  dropdownworktype() async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}data/select_dropdown?user_id=${storage.read('uid')}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsebody = response.stream.bytesToString();

    if (response.statusCode == 200) {
      selectedDropdowndataModelFromJson(responsebody.toString());
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
