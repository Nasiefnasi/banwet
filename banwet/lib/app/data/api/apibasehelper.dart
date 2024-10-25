import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../modules/splash_login&panching/splash/views/sunpages/no_internet.dart';
import 'app_exeption.dart';

class ApiBaseHelper {
  static Map<String, String> commonHeaders = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'x-api-key': '159753',
  };

  static Future<dynamic> get(String url,
      {bool isHeaderRequired = false}) async {
    // ignore: prefer_typing_uninitialized_variables
    var responseJson;
    if (isHeaderRequired) {}
    try {
      final response = await http.get(Uri.parse(url), headers: commonHeaders);
      responseJson = _returnResponse(response);
    } on SocketException {
      Get.to(() => const NoInternet());
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  //  <   ------------------      post API ----------------------->
  static Future<dynamic> post(String url, Map<String, String> body,
      {bool isHeaderRequired = true}) async {
    log('Api Post  to => url $url');
    log("$body");
    var responseJson;

    if (isHeaderRequired) {}

    try {
      final response =
          await http.post(Uri.parse(url), body: body, headers: commonHeaders);
      responseJson = _returnResponse(response);
      log(response.statusCode.toString());

      // print(url);
      print(response.body);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  static Future<dynamic> postUploadImage(String url,
      dynamic bodyExceptImageField, String imageField, File image) async {
    print('Api Post, url $url');

    var stream = http.ByteStream(image.openRead());
    stream.cast();

    //var length = await image.length();

    var multipart = await http.MultipartFile.fromPath(imageField, image.path);

    var uri = Uri.parse(url);

    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(commonHeaders);

    request.fields.addAll(bodyExceptImageField);

    request.files.add(multipart);

    var streamedResponse = await request.send();

    //var response = await http.Response.fromStream(streamedResponse);

    //var response = streamedResponse.stream.bytesToString();

    //var responseJson = _returnResponse(response);

    if (streamedResponse.statusCode == 200) {
      print("success__________________________________________");
      var response = await streamedResponse.stream.bytesToString();
      return response;
    } else {
      print(streamedResponse.statusCode);
      print(await streamedResponse.stream.bytesToString());
    }
    if (streamedResponse.statusCode == 201) {
      print("success__________________________________________");
      var response = await streamedResponse.stream.bytesToString();
      return response;
    } else {
      print(streamedResponse.statusCode);
      print(await streamedResponse.stream.bytesToString());
    }
  }

  static Future<dynamic> put(String url, Map<String, dynamic> body,
      {bool isHeaderRequired = false}) async {
    print(body.toString());
    print('Api Put, url $url');
    if (isHeaderRequired) {}
    var responseJson;
    try {
      final response = await http.put(Uri.parse(url),
          body: json.encode(body), headers: commonHeaders);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api put.');
    print(responseJson.toString());
    return responseJson;
  }

  static Future<dynamic> delete(String url,
      {dynamic body, bool isHeaderRequired = false}) async {
    print('Api delete, url $url');

    var apiResponse;
    try {
      final response =
          await http.delete(Uri.parse(url), headers: commonHeaders);
      apiResponse = _returnResponse(response);
    } on SocketException {
      Get.to(() => const NoInternet());
      log('No net');
      throw FetchDataException('No Internet connection');
    }
    log('api delete.');
    return apiResponse;
  }
}

dynamic _returnResponse(http.Response response) {
  log(response.statusCode.toString());
  switch (response.statusCode) {
    case 200:
      //var responseJson = json.decode(response.body.toString());
      print(response.body.toString());
      return response.body.toString();
    case 201:
      print(response.body.toString());
      return response.body;
    case 400:
      return response.body.toString();

    // throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
