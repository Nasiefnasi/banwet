import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

import '../../Style/const.dart';
import 'base_url.dart';

class NetworkService {
  var postData;

  Future<dynamic> ledgerPost(
    Map<String, dynamic> params,
    Map<String, String> headers,
  ) async {
    var responseJson;
    try {
      final url = Uri.parse('${storage.read("domain")}/accounts/select_ledger');

      final body = params;
      print(body);
      final response = await http.post(url, headers: headers, body: (body));

      responseJson = _ledgerResponse(response);
    } on SocketException {}
    return responseJson;
  }

  dynamic _ledgerResponse(
    http.Response response,
  ) {
    print(response.statusCode);
    print("api");
    print(response.body);
    var responseJson = jsonDecode(response.body);
    //postData=responseJson;
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        //Get.toNamed(toNamed!);
        print('loo1');
        return responseJson;

      case 201:
        // var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        print('loo2');

        return responseJson;
      case 400:
        throw

            ///
            ///
            ///
            ///
            const SizedBox();
      //  Get.dialog(_cmpLog());
      ///
      ///
      ///
      ///

      case 401:
        throw Get.snackbar('loo', 'sorry2');

      case 403:
        throw Get.snackbar('loo', 'sorry3');
      case 500:
      default:
        throw Get.snackbar('loo', 'sorry4');
    }
  }

  Future<dynamic> get(
    String path,
    Map<String, String> headers,
  ) async {
    var responseJson;
    try {
      final url = Uri.parse(BaseUrl.baseUrl + path);
      final response = await http.get(url, headers: headers);
      print('bbb$response');
      responseJson = _getResponse(response);
      print('aaa$responseJson');
    } on SocketException {
      Future.delayed(Duration.zero, () {
        Get.toNamed('/interNet');
      });
    }
    return responseJson;
  }

  Future<dynamic> postt(
    String path,
    Map<String, dynamic> params,
    Map<String, String> headers,
  ) async {
    var responseJson;
    try {
      final url = Uri.parse(BaseUrl.baseUrl + path);
      print(BaseUrl.baseUrl + path);
      final body = params;
      print(body);
      final response = await http.post(url, headers: headers, body: (body));

      responseJson = _response(response);
    } on SocketException {}
    return responseJson;
  }

  dynamic _response(
    http.Response response,
  ) {
    print(response.statusCode);
    print("api");
    print(response.body);
    var responseJson = jsonDecode(response.body);
    //postData=responseJson;
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        //Get.toNamed(toNamed!);
        print('loo1');
        return responseJson;

      case 201:
        // var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        print('loo2');

        return responseJson;
      case 400:
        throw Get.dialog(_userLog());

      case 401:
        throw Get.snackbar('loo', 'sorry2');

      case 403:
        throw Get.snackbar('loo', 'sorry3');
      case 500:
      default:
        throw Get.snackbar('loo', 'sorry4');
    }
  }

  Future<dynamic> post1(
    String path,
    Map<String, dynamic> params,
    Map<String, String> headers,
  ) async {
    var responseJson;
    try {
      final url = Uri.parse(BaseUrl.baseUrl + path);
      print(BaseUrl.baseUrl + path);
      final body = params;
      print(body);
      final response = await http.post(url, headers: headers, body: (body));
      log(response.toString());
      responseJson = _response1(response);
    } on SocketException {
      print('loo');
    }
    log(responseJson.toString());
    return responseJson;
  }

  // Future<dynamic> metPost(
  //   String path,
  //   SamModel params,
  //   Map<String, String> headers,
  // ) async {
  //   var responseJson;
  //   try {
  //     final url = Uri.parse(BaseUrl.baseUrl + path);
  //     print(BaseUrl.baseUrl + path);
  //     final body = params;
  //     print(body);
  //     final response = await http.post(url, headers: headers, body: (body));

  //     responseJson = _response1(response);
  //   } on SocketException {
  //     print('loo');
  //   }
  //   return responseJson;
  // }

  dynamic _response1(
    http.Response response,
  ) {
    print(response.statusCode);
    print(response.body);
    var responseJson = jsonEncode(response.body);
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.body.toString());
        //print(responseJson);

        return responseJson;

      case 201:
        // var responseJson = json.decode(response.body.toString());
        // print(responseJson);

        return responseJson;
      case 400:
        throw Get.snackbar('loo', 'sorry1');
      case 401:
        throw Get.snackbar('loo', 'sorry2');

      case 403:
        throw Get.snackbar('loo', 'sorry3');
      case 500:
      default:
        throw Get.snackbar('loo', 'sorry4');
    }
  }

  dynamic _getResponse(
    http.Response response,
  ) {
    print(response.statusCode);
    print(response.body);
    var responseJson = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        // throw Future.delayed(Duration(seconds: 2),(){
        //   CircularProgressIndicator();
        // });
        // var responseJson = json.decode(response.body.toString());
        //print(responseJson);

        return responseJson;

      case 201:
        // var responseJson = json.decode(response.body.toString());
        // print(responseJson);

        return responseJson;
      case 400:
      // throw Get.snackbar('loo', 'abdu');
      case 401:
      //throw Get.snackbar('loo', 'sorry2');

      case 403:
      // throw Get.snackbar('loo', 'sorry3');
      case 500:
      default:
      // throw Get.snackbar('loo', 'sorry4');
    }
  }

  Future<dynamic> cmppost(
    Map<String, dynamic> params,
    Map<String, String> headers,
  ) async {
    var responseJson;
    try {
      final url =
          Uri.parse('http://clients.genovatechnologies.com/api/clients/login');

      final body = params;
      print(body);
      final response = await http.post(url, headers: headers, body: (body));

      responseJson = _cmpresponse(response);
    } on SocketException {}
    return responseJson;
  }

  dynamic _cmpresponse(
    http.Response response,
  ) {
    print(response.statusCode);
    print("api");
    print(response.body);
    var responseJson = jsonDecode(response.body);
    //postData=responseJson;
    switch (response.statusCode) {
      case 200:
        // var responseJson = json.decode(response.body.toString());
        //print(responseJson);
        //Get.toNamed(toNamed!);
        print('loo1');
        return responseJson;

      case 201:
        // var responseJson = json.decode(response.body.toString());
        // print(responseJson);
        print('loo2');

        return responseJson;
      case 400:
        throw

            ///
            ///
            ///
            ///
            Get.dialog(_cmpLog());

      ///
      ///
      ///
      ///

      case 401:
        throw Get.snackbar('loo', 'sorry2');

      case 403:
        throw Get.snackbar('loo', 'sorry3');
      case 500:
      default:
        throw Get.snackbar('loo', 'sorry4');
    }
  }

  Future<dynamic> uget(
    String path,
    Map<String, String> headers,
  ) async {
    var responseJson;
    try {
      final url = Uri.parse(APIURL.baseUrl + path);
      final response = await http.get(url, headers: headers);
      print('bbb$response');
      responseJson = _uResponse(response);
      print('aaa$responseJson');
    } on SocketException {
      Future.delayed(Duration.zero, () {
        Get.toNamed('/interNet');
      });
    }
    return responseJson;
  }

  dynamic _uResponse(
    http.Response response,
  ) {
    print(response.statusCode);
    print(response.body);
    var responseJson = json.decode(response.body);
    switch (response.statusCode) {
      case 200:
        // throw Future.delayed(Duration(seconds: 2),(){
        //   CircularProgressIndicator();
        // });
        // var responseJson = json.decode(response.body.toString());
        //print(responseJson);

        return responseJson;

      case 201:
        // var responseJson = json.decode(response.body.toString());
        // print(responseJson);

        return responseJson;
      case 400:
      // throw Get.snackbar('loo', 'abdu');
      case 401:
      //throw Get.snackbar('loo', 'sorry2');

      case 403:
      // throw Get.snackbar('loo', 'sorry3');
      case 500:
      default:
      // throw Get.snackbar('loo', 'sorry4');
    }
  }

  _cmpLog() {
    return SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.all(2.h),
            height: 27.h,
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning_amber_outlined,
                  size: 23.sp,
                  color: Colors.red,
                ),
                h1,
                Text(
                  "Warning",
                  style: header12,
                ),
                h1,
                Text(
                  "Please Check Client Code &",
                  style: header12,
                ),
                Text(
                  "Client Key",
                  style: header12,
                ),
                h2,
                GestureDetector(
                  onTap: () async {
                    Get.back();
                  },
                  child: Container(
                    height: 4.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        color: bColor, borderRadius: BorderRadius.circular(13)),
                    child: Center(
                        child: Text(
                      'Back',
                      style: header12.copyWith(color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ]);
  }
}

_userLog() {
  return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.zero,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(2.h),
          height: 27.h,
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_outlined,
                size: 23.sp,
                color: Colors.red,
              ),
              h1,
              Text(
                "Warning",
                style: header12,
              ),
              h1,
              Text(
                "Please Check",
                style: header12,
              ),
              Text(
                "Username or Password",
                style: header12,
              ),
              h2,
              GestureDetector(
                onTap: () async {
                  Get.back();
                },
                child: Container(
                  height: 4.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                      color: bColor, borderRadius: BorderRadius.circular(13)),
                  child: Center(
                      child: Text(
                    'Back',
                    style: header12.copyWith(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ]);
}
