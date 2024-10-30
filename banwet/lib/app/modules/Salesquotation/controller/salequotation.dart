import 'dart:convert';

import 'package:banwet/app/common_widegt/submitpage.dart';
import 'package:banwet/app/data/model/quotationtemplate/templatemodel.dart';
import 'package:banwet/app/data/service/quotationmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:html_editor_enhanced/html_editor.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// // // // /// / / / / /// / / / / /  / // /  / /   / / / / /  /SaleQuotationModel saleQuotationModelFromJson
class QuotationController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var quotationtype = ["Product", "Service"];
  RxBool boxdetails = false.obs;
  TextEditingController approxsqfts = TextEditingController();
  TextEditingController amountsqft = TextEditingController();

  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  TextEditingController description = TextEditingController();
  // TextEditingController products = TextEditingController();
  TextEditingController warranty = TextEditingController();
  TextEditingController methodapplication = TextEditingController();
  TextEditingController notes = TextEditingController();
  RxString products = "".obs;
  var storage = GetStorage();
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  RxList<Quotationlist> quotationlist = <Quotationlist>[].obs;
  TextEditingController Approxsqft = TextEditingController();
  TextEditingController quotationtypes = TextEditingController();
  TextEditingController customername = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController quotationdate =
      TextEditingController(text: DateTime.now().toString());
  TextEditingController expirydate =
      TextEditingController(text: DateTime.now().toString());
// Rxbool Is
  @override
  void onInit() {
    super.onInit();
    getquotation();
  }

  var endDate = DateTime.parse(DateTime.now().toString());
  var startDate = DateTime.parse(DateTime.now().toString());
  change() {
    endDate = DateTime.parse(endDateController.text);
    startDate = DateTime.parse(startDateController.text);
    update();
  }

  RxDouble totalamount = 0.0.obs;
  calculation() {
    totalamount.value =
        double.parse(approxsqfts.text) * double.parse(amountsqft.text);
    update();
  }

  clear() {
    approxsqfts.clear();
    amountsqft.clear();
    title.clear();
    subtitle.clear();
    description.clear();
    warranty.clear();
    methodapplication.clear();
    notes.clear();
    products.value = "";
    quotationlist.clear();
    Approxsqft.clear();
    quotationtypes.clear();
    customername.clear();
    address.clear();
    state.clear();
    totalamount.value = 0.0;
    startDateController.text = DateTime.now().toString();
  }

  postcreatesalesquotation(
      // quotation_date,
      // customer_name,
      // addres,
      // state,
      // expiry_date,
      // quotation_type,
      ) async {
    print(quotationtypes.text);
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'POST', Uri.parse('${storage.read("domain")}sales_quotation/create'));
    request.bodyFields = {
      'user_id': storage.read('uid').toString(),
      'quotation_date': quotationdate.text,
      'customer_name': customername.text,
      'address': address.text,
      'state': state.text,
      'expiry_date': expirydate.text,
      'quotation_type': quotationtypes.text,
      'items': jsonEncode(quotationlist)
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      getquotation();

      update();
      await Get.to(() => const SubmitDone());
      Get.back();
      clear();
    } else {
      print(response.reasonPhrase);
    }
  }

  SaleQuotationModel? salequotation;
  RxBool quotationloading = false.obs;
  getquotation() async {
    print({storage.read('uid').toString()});
    print(storage.read("domain"));
    try {
      quotationloading.value = true;
      update();

      var headers = {
        'x-api-key': '159753',
        'Content-Type': 'application/x-www-form-urlencoded',
      };
      var request = http.Request(
          'GET',
          Uri.parse(
              '${storage.read("domain")}sales_quotation/select?user_id=${storage.read('uid').toString()}'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var responsebody = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        salequotation = saleQuotationModelFromJson(responsebody);
        quotationloading.value = false;
        filterQuotaiondate();
        update();
      } else {
        print(response.reasonPhrase);
        quotationloading.value = false;
        update();
      }
      // ignore: empty_catches
    } catch (e) {
      quotationloading.value = false;
      update();
    }
  }

  var dateFormat = DateFormat('dd-MM-yyyy');
  RxList<QuotationList> flterdetails = <QuotationList>[].obs;
  filterQuotaiondate() {
    flterdetails.clear();
    if (salequotation != null || salequotation!.data != null) {
      for (int i = 0; i < salequotation!.data.length; i++) {
        if (dateFormat
                    .parse(salequotation!.data[i].createdDate)
                    .compareTo(DateTime.parse(startDateController.text)) >=
                0 &&
            dateFormat
                    .parse(salequotation!.data[i].createdDate)
                    .compareTo(DateTime.parse(endDateController.text)) <=
                0) {
          flterdetails.add(salequotation!.data[i]);
          update();
        }
      }
    }
  }

  QuotationTemplateModel? quotationTemplate;
  gettemplatequotation() async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            '${storage.read("domain")}sales_quotation/select_templates?user_id=${storage.read('uid').toString()}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsebody = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      quotationTemplate = quotationTemplateModelFromJson(responsebody);
    } else {
      print(response.reasonPhrase);
    }
  }
}

class Quotationlist {
  String? template_id;
  String? title;
  String? sub_title;
  String? description;
  String? products;
  String? unit_price;
  String? warranty;
  String? method;
  String? area;
  String? total_amount;
  String? notes;
  RxBool istrue = false.obs;

  Quotationlist({
    this.template_id,
    this.title,
    this.sub_title,
    this.description,
    this.products,
    this.unit_price,
    this.warranty,
    this.method,
    this.area,
    this.total_amount,
    this.notes,
  });

  Quotationlist.fromJson(Map<String, dynamic> json) {
    template_id = json['template_id'];
    title = json['title'];
    sub_title = json['sub_title'];
    description = json['description'];
    products = json['products'];
    unit_price = json['unit_price'];
    warranty = json['warranty'];
    method = json['method'];
    area = json['area'];
    total_amount = json['total_amount'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['template_id'] = this.template_id;
    data['title'] = this.title;
    data['sub_title'] = this.sub_title;
    data['description'] = this.description;
    data['products'] = this.products;
    data['unit_price'] = this.unit_price;
    data['warranty'] = this.warranty;
    data['method'] = this.method;
    data['area'] = this.area;
    data['total_amount'] = this.total_amount;
    data['notes'] = this.notes;

    return data;
  }
}
