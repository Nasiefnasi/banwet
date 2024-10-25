import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/common_widegt/submitpage.dart';
import 'package:banwet/app/data/model/RequestModel/request_cat_modele.dart';
import 'package:banwet/app/data/model/notification.model/notification_model.dart';
import 'package:banwet/app/data/model/notificationtopurchaserequestmodel/purchaserequestmodel.dart';
import 'package:banwet/app/data/service/notification.service/otification.service.dart';
import 'package:http/http.dart' as http;
import 'package:banwet/app/data/service/purchase_bill/purchase_request.dart';

class NotificationController extends GetxController {
  RxList<PurchaseRequestList> purchaseiteams = <PurchaseRequestList>[].obs;
  RxString projectname = "".obs;
  @override
  void onInit() {
    super.onInit();
    getNotifications();
    getrequestCatModel();
  }

  var storage = GetStorage();
  NotificationModel? notificationModel;
  getNotifications() async {
    print("ayi mone ayoo");
    var result = await NotificationService().getNotification();
    notificationModel = result;
    update();
  }

  RxBool notifiLoading = false.obs;
  NotificationToPurchaseRequestModel? notificationRequestModel;
  notificationtopurchaseDetails(order_id) async {
    notifiLoading.value = true;
    notifiLoading.refresh();
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}purchase/order_details?user_id=${storage.read('uid')}&order_id=$order_id&type=request'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsebody = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      notificationRequestModel =
          notificationToPurchaseRequestModelFromJson(responsebody);
      addtolist();
      projectname.value = notificationRequestModel!.projectName.isEmpty
          ? ""
          : notificationRequestModel!.projectName;
      projectname.refresh();
      update();
      notifiLoading.value = false;
      notifiLoading.refresh();
      update();
      // print(await response.stream.bytesToString());
    } else {
      notifiLoading.value = false;
      notifiLoading.refresh();
      print(response.reasonPhrase);
    }
    notifiLoading.value = false;
    notifiLoading.refresh();
  }

  RequestCatModel? requestCatModel;
  getrequestCatModel() async {
    var result = await PurchaseRequestService().getRequestCategory();
    requestCatModel = result;
    update();
  }

  addtolist() {
    purchaseiteams.clear();
    for (int i = 0; i < notificationRequestModel!.items.length; i++) {
      purchaseiteams.value.add(PurchaseRequestList(
          itemId: notificationRequestModel!.items[i].itemId,
          materialName: notificationRequestModel!.items[i].materialName,
          unitId: notificationRequestModel!.items[i].unitId,
          unitName: notificationRequestModel!.items[i].unitName,
          material_id: notificationRequestModel!.items[i].materialId,
          quantity: notificationRequestModel!.items[i].quantity,
          description: notificationRequestModel!.items[i].description));
      purchaseiteams.refresh();
      update();
    }
  }

  // Future<RequestCatModel> getRequestCategory() async {
  //   final response = await ApiBaseHelper.get(
  //       "${storage.read("domain")}purchase/select_material_categories?user_id=${storage.read('uid')}",
  //       isHeaderRequired: true);

  //   print(response.toString());
  //   return RequestCatModel.fromJson(json.decode(response));
  // }
  postpurcharapprovel(request_id, approval, work_id) async {
    //   var headers = {
    //     'x-api-key': '159753',
    //     'Content-Type': 'application/x-www-form-urlencoded',
    //   };
    //   var request = http.Request('POST',
    //       Uri.parse('${storage.read("domain")}purchase/request_approval'));
    //   request.bodyFields = {
    //     'user_id': storage.read('uid'),
    //     'request_id': request_id,
    //     'approval': approval,
    //   };
    //   request.headers.addAll(headers);

    //   http.StreamedResponse response = await request.send();

    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   var responseBody = await response.stream.bytesToString();
    //   var jsonResponse = json.decode(responseBody);

    //   // Check if "message" exists in the response
    //   Get.to(() => Approvecheck(
    //         findrejected: approval,
    //         content: jsonResponse['message'].toString(),
    //       ));
    //   print(await response.stream.bytesToString());
    //   } else {
    //     print(response.reasonPhrase);
    //   }
    // }
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
      // 'Cookie': 'ci_session=c9caa8c551906172e8ae42c55e59fb4f57244cff'
    };
    var request = http.Request(
        'POST', Uri.parse('${storage.read("domain")}purchase/update_order'));
    // request.bodyFields = {
    //   'user_id': storage.read('uid'),
    //   'type': 'request',
    //   'work_id': work_id,
    //   'items': jsonEncode(purchaseiteams.value.toString()),
    //   'request_id': request_id,
    //   'approval_status': approval,
    // };
    request.bodyFields = {
      'user_id': storage.read('uid'),
      'type': 'request',
      'work_id': work_id,
      'items': jsonEncode(purchaseiteams
          .map((item) => item.toJson())
          .toList()), // This is where the change is made
      'request_id': request_id,
      'approval_status': approval,
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);
      getNotifications();
      update();
      // Check if "message" exists in the response
      Get.to(() => Approvecheck(
            findrejected: approval,
            content: jsonResponse['message'].toString(),
          ));

      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

// class PurchaseRequestList {
//   String? material_id;
//   String? itemId;
//   String? materialName;
//   String? unitId;
//   String? unitName;
//   String? quantity;
//   String? description;
//   PurchaseRequestList(
//       {this.description,
//       this.material_id,
//       this.quantity,
//       this.itemId,
//       this.materialName,
//       this.unitId,
//       this.unitName});
//   PurchaseRequestList.fromjosn(Map<String, dynamic> json) {
//     description = json['description'];
//     material_id = json['material_id'];
//     quantity = json['quantity'];
//   }

//   // get unitName => null;
//   Map<String, dynamic> tojson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['description'] = this.description;
//     data['material_id'] = this.material_id;
//     data['quantity'] = this.quantity;
//     return data;
//   }
// }
class PurchaseRequestList {
  String? material_id;
  String? itemId;
  String? materialName;
  String? unitId;
  String? unitName;
  String? quantity;
  String? description;

  PurchaseRequestList(
      {this.description,
      this.material_id,
      this.quantity,
      this.itemId,
      this.materialName,
      this.unitId,
      this.unitName});

  PurchaseRequestList.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    material_id = json['material_id'];
    quantity = json['quantity'];
    itemId = json['itemId'];
    materialName = json['materialName'];
    unitId = json['unitId'];
    unitName = json['unitName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['material_id'] = this.material_id;
    data['quantity'] = this.quantity;
    data['itemId'] = this.itemId;
    data['materialName'] = this.materialName;
    data['unitId'] = this.unitId;
    data['unitName'] = this.unitName;
    return data;
  }
}

// class Item {
//   final String itemId;
//   final String materialId;
//   final String materialName;
//   final String unitId;
//   final String unitName;
//   final String quantity;
//   final String description;