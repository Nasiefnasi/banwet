import 'dart:convert';

import 'package:banwet/app/data/model/quotationtemplate/templatemodel.dart';
import 'package:banwet/app/data/service/quotationmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// // // // /// / / / / /// / / / / /  / // /  / /   / / / / /  /SaleQuotationModel saleQuotationModelFromJson
class QuotationController extends GetxController {
  RxBool boxdetails = false.obs;
  var storage = GetStorage();
  TextEditingController startDateController = TextEditingController(
      text:
          DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());
  TextEditingController endDateController =
      TextEditingController(text: DateTime.now().toString());
  List<Quotationlist> quotationlist = <Quotationlist>[].obs;
  RxList<Quotationtempla> selectiteam = <Quotationtempla>[].obs;
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

  postcreatesalesquotation(
    quotation_date,
    customer_name,
    address,
    state,
    expiry_date,
    quotation_type,
  ) async {
    var headers = {
      'x-api-key': '159753',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    var request = http.Request(
        'POST', Uri.parse('${storage.read("domain")}sales_quotation/create'));
    request.bodyFields = {
      'user_id': storage.read('uid').toString(),
      'quotation_date': '',
      'customer_name': '',
      'address': '',
      'state': '',
      'expiry_date': '',
      'quotation_type': '',
      'items': jsonEncode(quotationlist)
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
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
        salequotation = await saleQuotationModelFromJson(responsebody);
        quotationloading.value = false;
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
      quotationTemplate = await quotationTemplateModelFromJson(responsebody);
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
