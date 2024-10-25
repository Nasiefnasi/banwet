import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/stock/Apimodel/consumtion/stockconsumptionreport.dart';
import 'package:banwet/app/modules/stock/Apimodel/consumtion/stockconsumtionmodel.dart';
import 'package:banwet/app/modules/stock/Apimodel/consumtion/stocktransferReportModel.dart';
import 'package:banwet/app/modules/stock/Apimodel/stocktransfermodel.dart';
import 'package:banwet/app/modules/stock/Apimodel/stocktransferpostarray.dart';
import 'package:banwet/app/modules/stock/Apimodel/strockfiltertranfer.dart';
import 'package:banwet/app/modules/stock/model/stocktransfer/stocktransferiteamlist.dart';
import 'package:banwet/app/routes/app_pages.dart';
import 'package:banwet/app/style/const.dart';

class StockControllers extends GetxController {
  var dateFormat = DateFormat('dd-MM-yyyy');
  var endDate = DateTime.now();
  var startDate = DateFormat("yyyy-MM-dd").parse(DateTime.now().toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());

  int paidCont = 0;
  int partiallyPaidCount = 0;
  int notPaidCount = 0;
  RxInt tabviewcount = 0.obs;

  List<StockArrayIteams> stockiteams = <StockArrayIteams>[].obs;
  List<StockArrayIteams> consumpationiteams = <StockArrayIteams>[].obs;
  TextEditingController groupwageselect = TextEditingController();
  TextEditingController itemCount = TextEditingController();
  RxString locationId = "".obs;
  // TextEditingController Stocktransferdate = TextEditingController(
  //     text:
  //         DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController Stocktransferdate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController Stockconsumptiondate =
      TextEditingController(text: DateTime.now().toString());
  var storage = GetStorage();
  var argumentData = Get.arguments ?? {};
  StocktransferModel? stocktransferModel;
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  var isLoading = false.obs;
  var isLoadings = false.obs;
  RxString posttransferstatuscode = "".obs;

  @override
  void onInit() {
    super.onInit();
    stocktransferdetails();
    stocktransfercontroller();

    stockconsumtiondetails();
    // stockConsumptionIdpost();
    stockConsumptionIdpost();
  }

  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  Future<void> stocktransfercontroller() async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request(
      'GET',
      Uri.parse(
        '${storage.read("domain")}stock/locations?user_id=${storage.read('uid').toString()}&work_id=${argumentData["workid"].toString()}',
      ),
    );

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      String responsestring = await response.stream.bytesToString();
      stocktransferModel = stocktransferModelFromJson(responsestring);
      update();
    } else {
      print(response.reasonPhrase);
      update();
    }
  }

  // select stock submit api

  // Future<void> selectquantitysubmit(BuildContext context) async {
  //   var headers = {
  //     'x-api-key': '159753',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //   };
  //   var request = http.Request(
  //       'POST', Uri.parse('${storage.read("domain")}stock/transfer'));
  //   request.bodyFields = {
  //     'user_id': storage.read('uid').toString(),
  //     'items': jsonEncode(stockiteams),
  //     'date': Stocktransferdate.text,
  //     'work_id': argumentData["workid"].toString()
  //   };
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200 || response.statusCode == 201) {
  //     await stocktransferdetails();
  //     await Get.to(() => const SubmitDone());

  //     stockiteams.clear();

  //     Get.toNamed(Routes.Stock_Report1, arguments: {
  //       "workid": argumentData["workid"],
  //       "workname": argumentData["workname"],
  //     });

  //     // );
  //     // stockConsumptiongetdetails();
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
  // Future<void> selectQuantitySubmit(BuildContext context) async {
  //   try {
  //     var headers = {
  //       'x-api-key': '159753',
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     };

  //     var request = http.Request(
  //       'POST',
  //       Uri.parse('${storage.read("domain")}stock/transfer'),
  //     );

  //     request.bodyFields = {
  //       'user_id': storage.read('uid').toString(),
  //       'items': jsonEncode(stockiteams),
  //       'date': Stocktransferdate.text,
  //       'work_id': argumentData["workid"].toString(),
  //     };
  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();
  //     String responseBody = await response.stream.bytesToString();
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       await stocktransferdetails();
  //       var jsonResponse = await jsonDecode(responseBody);

  //       posttransferstatuscode.value = jsonResponse['status'].toString();

  //       // await stocktransferdetails();
  //       // await Get.to(() => const SubmitDone());

  //       // stockiteams.clear();

  //       // Get.toNamed(
  //       //   Routes.Stock_Report1,
  //       //   arguments: {
  //       //     "workid": argumentData["workid"],
  //       //     "workname": argumentData["workname"],
  //       //   },
  //       // );
  //     } else {
  //       var jsonResponse = await jsonDecode(responseBody);

  //       posttransferstatuscode.value = jsonResponse['status'].toString();
  //       print('Failed to submit: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     print('An error occurred: $e');
  //     // Optionally, you can also show a dialog or a Snackbar to notify the user
  //       Get.snackbar('Error', 'An error occurred while submitting the data.');
  //   }
  // }
  // Future<void> selectQuantitySubmit(BuildContext context) async {
  //   try {
  //     var headers = {
  //       'x-api-key': '159753',
  //       'Content-Type': 'application/x-www-form-urlencoded',
  //     };

  //     var request = http.Request(
  //       'POST',
  //       Uri.parse('${storage.read("domain")}stock/transfer'),
  //     );

  //     request.bodyFields = {
  //       'user_id': storage.read('uid').toString(),
  //       'items': jsonEncode(stockiteams),
  //       'date': Stocktransferdate.text,
  //       'work_id': argumentData["workid"].toString(),
  //     };
  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();
  //     String responseBody = await response.stream.bytesToString();

  //     // Check if the response is JSON
  //     if (response.headers['content-type']?.contains('application/json') ??
  //         false) {
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         // var jsonResponse = jsonDecode(responseBody);
  //         // posttransferstatuscode.value = jsonResponse['status'].toString();

  //         await stocktransferdetails();
  //         await Get.to(() => const SubmitDone());
  //         update();

  //         Get.toNamed(Routes.Stock_Report0,
  //             arguments: await {
  //               "workid": argumentData["workid"],
  //               "workname": argumentData["workname"],
  //             });
  //         update();
  //          update();
  //       } else {
  //         var jsonResponse = jsonDecode(responseBody);
  //         posttransferstatuscode.value = jsonResponse['status'].toString();
  //         print('Failed to submit: ${response.reasonPhrase}');
  //       }
  //     } else {
  //       // Handle unexpected content type (non-JSON response)
  //       print(
  //           'Unexpected response format: ${response.headers['content-type']}');
  //       print('Response body: $responseBody');
  //       Get.snackbar('Error', 'Unexpected response format.');
  //     }
  //   } catch (e) {
  //     print('An error occurred: $e');
  //     Get.snackbar('Error', 'An error occurred while submitting the data.');
  //   }
  // }
  RxBool transferloading = false.obs;
  Future<void> selectQuantitySubmit(BuildContext context) async {
    transferloading.value = true;
    update();
    try {
      var headers = {
        'x-api-key': '159753',
        'Content-Type': 'application/x-www-form-urlencoded',
      };

      var request = http.Request(
        'POST',
        Uri.parse('${storage.read("domain")}stock/transfer'),
      );

      request.bodyFields = {
        'user_id': storage.read('uid').toString(),
        'items': jsonEncode(stockiteams),
        'date': Stocktransferdate.text,
        'work_id': argumentData?["workid"]?.toString() ?? '',
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      // Check if the response is JSON
      if (response.headers['content-type']?.contains('application/json') ??
          false) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          // Post transfer success actions

          await stocktransferdetails();
          update();
          transferloading.value = false;
          await Get.to(() => const SubmitDone());
          update();
          if (argumentData != null &&
              argumentData.containsKey("workid") &&
              argumentData.containsKey("workname")) {
            // stocktransferdetails();
            Get.toNamed(
              Routes.Stock_Report1,
              arguments: {
                "workid": argumentData["workid"],
                "workname": argumentData["workname"],
              },
            );
            transferloading.value = false;
            // update();
            // await stocktransferdetails();
            update();
          } else {
            Get.snackbar('Error', 'Invalid work data provided.');
            transferloading.value = false;
            update();
          }
          update();
        } else {
          var jsonResponse = jsonDecode(responseBody);
          posttransferstatuscode.value = jsonResponse['status'].toString();
          print('Failed to submit: ${response.reasonPhrase}');
          Get.snackbar('Error', 'Failed to submit the request.');
          transferloading.value = false;
          update();
        }
      } else {
        // Handle unexpected content type (non-JSON response)
        print(
            'Unexpected response format: ${response.headers['content-type']}');
        print('Response body: $responseBody');
        Get.snackbar('Error', 'Unexpected response format.');
        transferloading.value = false;
        update();
      }
    } catch (e) {
      print('An error occurred: $e');
      Get.snackbar('Error', 'An error occurred while submitting the data.');
      transferloading.value = false;
      update();
    }
  }

// stock transfer post select stock location id\\
  StockConsumptionListmodel? stockConsumptionListmodel;
  StocktransferFiltermodel? stocktransferFiltermodel;
  var stockfilter = <Stocktransferdata>[].obs;
  Future<void> stocktranferIdpost(
      String location_id, BuildContext context) async {
    isLoading.value = true;

    // Headers for the HTTP request
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    // Constructing the URL for the API request
    var url = Uri.parse(
        '${storage.read("domain")}stock/current_stock?user_id=${storage.read('uid').toString()}&work_id=${argumentData["workid"].toString()}&location_id=$location_id');

    // Creating a new HTTP GET request
    var request = http.Request('GET', url);

    try {
      request.headers.addAll(headers);

      // Sending the HTTP request and waiting for the response
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      print('API Response: $responseBody');

      if (response.statusCode == 200 || response.statusCode == 201) {
        stocktransferFiltermodel =
            stocktransferFiltermodelFromJson(responseBody);
        groupwageselect.clear();

        if (stocktransferFiltermodel != null) {
          stockfilter.value.addAll(stocktransferFiltermodel!.data.toList());
          Get.back();
          Get.to(StockTransferItem());
        } else {
          stockfilter.clear();
          print('Parsing failed, stocktransferFiltermodel is null');
          Get.to(StockTransferItem());
        }
      } else {
        stocktransferFiltermodel = null;
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 80.h,
                width: 100.w,
                child: SimpleDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    contentPadding: EdgeInsets.zero,
                    titlePadding: EdgeInsets.zero,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 3.h),
                        height: 28.h,
                        width: 100.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/warningpng.png",
                              width: 9.w,
                              height: 9.h,
                              color: Colors.red,
                            ),
                            // h1,
                            Text(
                              "Empty Stock",
                              style: header15,
                            ),

                            h1,
                            Text(
                              "Please note that the selected work site has no available stock.",
                              textAlign: TextAlign.center,
                              style: header10.copyWith(
                                  color:
                                      const Color.fromARGB(255, 139, 131, 131)),
                            ),
                            //  h2,
                            const Divider(thickness: 1),

                            const SizedBox(height: 2),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Get.back();
                                },

                                // child:
                                // Container(
                                //   height: 4.h,
                                //   width: 30.w,
                                //   decoration: BoxDecoration(
                                //       color: bColor,
                                //       borderRadius: BorderRadius.circular(13)),
                                //   child:
                                //    Center(
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    'Back',
                                    textAlign: TextAlign.center,
                                    style:
                                        header12.copyWith(color: Colors.black),
                                    //  )
                                    // ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              );
            });
        // print('Failed to load data. Status code: ${response.statusCode}');
        // stocktransferFiltermodel = null;
      }
    } catch (e) {
      print('Exception caught: $e');
      // stocktransferFiltermodel = null;
    } finally {
      isLoading.value = false;
    }
  }

  RxBool stockConsumptionLoading = false.obs;
  Future stockConsumptionIdpost() async {
    stockConsumptionLoading.value = true;
    update();
    isLoading.value = true;
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var url = Uri.parse(
        '${storage.read("domain")}stock/current_stock?user_id=${storage.read('uid').toString()}&work_id=${argumentData["workid"].toString()}&location_id=');

    var request = http.Request('GET', url);

    try {
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      isLoading.value = true;

      if (response.statusCode == 200 || response.statusCode == 201) {
        // if (location_id == "") {
        stockConsumptionListmodel =
            stockConsumptionListmodelFromJson(responseBody);
        update();
        if (stockConsumptionListmodel!.status == false) {
          stockConsumptionLoading.value = false;
          update();
        }
        var dtat = stockConsumptionListmodel!.data.length;
        print(dtat.toString());
        isLoading.value = false;
        stockConsumptionLoading.value = false;
        update();
        // return stockConsumptionListmodel;
        // Get.back();
        // Get.to(StockConsumptionList());
        // } else {
        //   stocktransferFiltermodel =
        //       await stocktransferFiltermodelFromJson(responseBody);
        //   stocktransferFiltermodels =
        //       stocktransferFiltermodelFromJson(responseBody);
        //   // Get.to(() => const SubmitDone());
        //   Get.back();

        //   Get.to(StockTransferItem());
        //   isLoading.value = false;
        //   return stocktransferFiltermodel;
        // }
      } else {
        isLoading.value = false;

        // if (location_id == "") {
        stockConsumptionListmodel = null;
        stockConsumptionLoading.value = false;
        update();
        // Get.to(StockConsumptionList());
        // } else {
        // stocktransferFiltermodel = null;
        // Get.to(StockTransferItem());
        // }
      }
    } catch (e) {
      isLoading.value = false;
      print('Exception caught: $e');
      stockConsumptionLoading.value = false;
      update();
    }
    isLoading.value = false;
  }

  dailyconsumptionpost() async {
    isLoadings.value = true;
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=3a704e77db4866c85f6d3d29d896a6d96d18de29'
    };
    var request = http.Request(
        'POST', Uri.parse('${storage.read("domain")}stock/consumption'));
    request.bodyFields = {
      'user_id': storage.read('uid').toString(),
      'items': jsonEncode(consumpationiteams),
      'date': Stockconsumptiondate.text,
      'work_id': argumentData["workid"].toString()
    };
    try {
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      isLoadings.value = true;
      if (response.statusCode == 200 || response.statusCode == 201) {
        await stockconsumtiondetails();

        await Get.to(() => const SubmitDone());

        // Get.to(
        //   StockReport(
        //     pageshowindex: 0,
        //   ),
        // );
        Get.toNamed(Routes.Stock_Report0, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        consumpationiteams.clear();
        isLoadings.value = false;
      } else {
        print(response.reasonPhrase);
        isLoadings.value = false;
      }
      isLoadings.value = false;
    } catch (e) {
      print(e);
      isLoadings.value = false;
    }
    isLoadings.value = false;
  }

// 1 . stock transfer report
  StockTransferReportModel? stockTransferReportModel;
  // stocktransferdetails() async {
  //   var headers = {
  //     'x-api-key': '159753',
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //   };
  //   var request = http.Request(
  //       'GET',
  //       Uri.parse(
  //           '${storage.read("domain")}stock/transfer_history?user_id=${storage.read('uid').toString()}&work_id=${argumentData["workid"].toString()}'));

  //   request.headers.addAll(headers);
  //   try {
  //     http.StreamedResponse response = await request.send();
  //     String responseBody = await response.stream.bytesToString();
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       stockTransferReportModel =
  //           await stockTransferReportModelFromJson(responseBody.toString());
  //       update();
  //       if (stockTransferReportModel!.data != null) {
  //         filterAndCalculatestocktransfer(
  //             stockTransferReportModel!.data.toList());
  //         update();
  //       }
  //       return stockTransferReportModel;

  //       // print(await response.stream.bytesToString());
  //     } else {
  //       print(response.reasonPhrase);
  //     }
  //   } catch (e) {}
  // }
  RxBool stocktransferloading = false.obs;
  Future<StockTransferReportModel?> stocktransferdetails() async {
    stocktransferloading.value = true;
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var request = http.Request(
      'GET',
      Uri.parse(
        '${storage.read("domain")}stock/transfer_history?user_id=${storage.read('uid').toString()}&work_id=${argumentData["workid"].toString()}',
      ),
    );

    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200 || response.statusCode == 201) {
        stockTransferReportModel =
            stockTransferReportModelFromJson(responseBody);

        if (stockTransferReportModel?.data != null) {
          filterAndCalculatestocktransfer(
              stockTransferReportModel!.data.toList());
          stocktransferloading.value = false;
          update();
        }
        stocktransferloading.value = false;
        update();
        return stockTransferReportModel;
      } else {
        print(
            'Failed to load stock transfer details: ${response.reasonPhrase}');
        stocktransferloading.value = false;
        update();
        return null;
      }
    } catch (e) {
      print('An error occurred: $e');
      stocktransferloading.value = true;
      update();
      return null;
    }
  }

  StockConsumptionReportModel? stockConsumptionReportModel;
  RxBool stockconsumtionloading = false.obs;
  stockconsumtiondetails() async {
    stockconsumtionloading.value = true;
    update();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}stock/consumption_history?user_id=${storage.read('uid').toString()}&work_id=${argumentData["workid"].toString()}'));

    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        stockConsumptionReportModel =
            stockConsumptionReportModelFromJson(responseBody.toString());
        update();

        if (stockConsumptionReportModel!.data != null) {
          await filterAndCalculatestockconsumption(
              stockConsumptionReportModel!.data.toList());
          stockconsumtionloading.value = false;

          update();
        }
        stockconsumtionloading.value = false;
        update();
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
        stockconsumtionloading.value = false;
        update();
      }
    } catch (e) {
      stockconsumtionloading.value = false;
      update();
      print(e);
    }
  }

  // filteringData() {
  //   partiallyPaidCount = 0;
  //   paidCont = 0;
  //   notPaidCount = 0;
  //   for (int i = 0; i < stockConsumptionReportModel!.data!.length; i++) {
  //     if (dateFormat
  //                 .parse(stockConsumptionReportModel!.data![i].date ?? "")
  //                 .compareTo(DateTime.parse(startDateController.text)) >=
  //             0 &&
  //         dateFormat
  //                 .parse(stockConsumptionReportModel!.data![i].date ?? "")
  //                 .compareTo(DateTime.parse(endDateController.text)) <=
  //             0) {
  //       // String status = stockConsumptionReportModel!.data![i].paymentStatus ?? "";
  //       // if (status == "Partially Paid") {
  //       //   partiallyPaidCount++;
  //       //   update();
  //       // } else if (status == "Paid") {
  //       //   paidCont++;
  //       //   update();
  //       // } else if (status == "Not Paid") {
  //       //   notPaidCount++;
  //       //   update();
  //       // }
  //     }
  //   }

  //   // Define a reducer function to update counts
  // }
  var filteredList = [].obs;
  filterAndCalculatestockconsumption(
    List<Datumreport> dataList,
  ) {
    // log("[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]");
    filteredList.clear();
    // totalAmount.value = 0.0;
    var dateFormat = DateFormat('dd-MM-yyyy');

    for (int index = 0; index < dataList.length; index++) {
      print(dataList[index].date);
      if (dateFormat
                  .parse(dataList[index].date)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(dataList[index].date)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filteredList.add(dataList[index]);
        // totalAmount.value += dataList[index].totalWage;
        // log("$totalAmount--------------------");
        // Optionally, you can return a boolean or other value to indicate success/failure
      }
    }
  }

  var filteredtransferList = [].obs;
  filterAndCalculatestocktransfer(
    List<Datumtransfer> dataList,
  ) {
    // log("[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]");
    filteredtransferList.clear();
    // totalAmount.value = 0.0;
    var dateFormat = DateFormat('dd-MM-yyyy');

    for (int index = 0; index < dataList.length; index++) {
      print(dataList[index].date);
      if (dateFormat
                  .parse(dataList[index].date)
                  .compareTo(DateTime.parse(startDateController.text)) >=
              0 &&
          dateFormat
                  .parse(dataList[index].date)
                  .compareTo(DateTime.parse(endDateController.text)) <=
              0) {
        filteredtransferList.add(dataList[index]);
        // totalAmount.value += dataList[index].totalWage;
        // log("$totalAmount--------------------");
        // Optionally, you can return a boolean or other value to indicate success/failure
      }
    }
  }

  // var filteredData = <Stocktransferdata>[].obs; // the filtered list of data
  // var searchText = "".obs;
  // filterData() {
  //   filteredData.clear();

  //   filteredData.value = stocktransferFiltermodel!.data!
  //       .where((data) =>
  //           data.stockName!.toString().toLowerCase().contains(searchText))
  //       .toList(); // filter the data based on search text
  //   update();
  // }
  var stockData = <Stocktransferdata>[].obs;
  // var stockData = <Stocktransferdata>[].obs;
  var filteredData = <Datums>[].obs; // the filtered list of data
  var searchText = "".obs;

  //  filterData(data) {
  //   filteredData.clear();

  //   filteredData.value = data
  //       .where((data) => data.stockName
  //           .toLowerCase()
  //           .contains(searchText.value.toLowerCase()))
  //       .toList(); // filter the data based on search text

  //   update();
  // }
  // List<dynamic> filterSearch = [];
  void filterstocktData(searchText) {
    stockData.clear();

    for (var cases in stockfilter.value) {
      if (cases.stockName
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase())) {
        if (!stockData.contains(cases)) {
          stockData.add(cases);
          stockData.refresh();
          update();
        }
      }
    }

    update();
  }

  void filterData(searchText) {
    filteredData.clear();

    stockConsumptionListmodel?.data.forEach(
      (cases) {
        if (cases.availableQty
            .toString()
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          if (!filteredData.contains(cases)) {
            filteredData.add(cases);
            update();
          }
        }
      },
    );

    update();
  }
  // void filterData(searchTex) {
  //   filteredData.clear(); // Clear the existing filtered data

  //   // Iterate over the data in stocktransferFiltermodel
  //   stocktransferFiltermodel!.data.forEach((cases) {
  //     // Check if availableQty contains the search text
  //     if (cases.stockName
  //         .toLowerCase()
  //         .contains(searchText.value.toLowerCase())) {
  //       // Add the case to filteredData if it's not already in the list
  //       if (!filteredData.contains(cases)) {
  //         filteredData.add(cases);
  //       }
  //     }
  //   });

  //   // Call update() once after the loop
  //   update();
  // }
//   void filterData() {
//     filteredData.clear(); // Clear the existing filtered data

//     // Iterate over the data in stocktransferFiltermodel
//     stockData.forEach((cases) {
//       // Check if stockName contains the search text
//       if (cases.stockName
//           .toLowerCase()
//           .contains(searchText.value.toLowerCase())) {
//         // Add the case to filteredData if it's not already in the list
//         if (!filteredData.contains(cases)) {
//           filteredData.add(cases);
//         }
//       }
//     });

//     // Call update() once after the loop
//     update();
//   }
}
