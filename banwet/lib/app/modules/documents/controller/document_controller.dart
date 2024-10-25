import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/data/model/projectDocument/document.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentControllers extends GetxController {
  var arugumentData = Get.arguments;
  var storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    getdocument();
  }

  Future slaunchUrl() async {
    final Uri url = Uri.https(
        'https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w600/2023/10/free-images.jpg');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  RxBool documentloading = false.obs;
  ProjectDocumentModel? projectDocument;
  getdocument() async {
    documentloading.value = true;
    documentloading.refresh();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}documents/select?user_id=${storage.read('uid')}&work_id=${arugumentData["workid"]}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responseBody = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      projectDocument = projectDocumentModelFromJson(responseBody);
      documentloading.value = false;
      documentloading.refresh();
      update();
    } else {
      documentloading.value = false;
      documentloading.refresh();
      print(response.reasonPhrase);
    }
    documentloading.value = false;
    documentloading.refresh();
  }
}
