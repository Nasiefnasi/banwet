import 'package:get_storage/get_storage.dart';

var storage = GetStorage();

class BaseUrl {
  static String baseUrl = storage.read("domain").toString();
  // static const String baseUrl = 'https://test.smartbuildapp.com/api';
  // static final String webViewBaseUrl =
  //     FlutterConfig.get("WEB_VIEW_BASE_URL") ?? "";
}
