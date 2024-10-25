import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';
import 'package:banwet/app/data/model/subcontract_model/sub_contract_home_model.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/project_modules/subcontract/controllers/subcontract_controller.dart';
import 'package:banwet/app/modules/project_modules/subcontract/subcontract.add/controllers/subcontract.dart';

import 'package:banwet/app/style/const.dart';

class SubContractIteams extends GetView<SubcontractAddingController> {
  SubContractIteams({super.key});
  var argumentData = Get.arguments;
  RxBool isSelected = false.obs;
  SubcontractController controller1 = Get.put(SubcontractController());
  @override
  SubcontractAddingController controller =
      Get.put(SubcontractAddingController());
  SubcontractController controller2 = Get.put(SubcontractController());
  @override
  Widget build(BuildContext context) {
    TextEditingController data = TextEditingController(
        text: controller.openbalance.value.text.isNotEmpty
            ? controller.openbalance.value.text
            : "0");
    var mediaquery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: () {
      //         Get.back();
      //       },
      //       icon: Icon(Icons.chevron_left)),
      //   title: Text(
      //     'Sub Contract',
      //     style: header15.copyWith(color: Colors.black),
      //   ),
      // ),
      // ignore: prefer_const_constructors
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              h1,
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: ProjectNameTitile(
                  addbutton: const SizedBox(
                    height: 0,
                  ),
                  projectName: controller2.argumentData["workname"],
                  screenTitile: "Add Sub Contract",
                  onTap: () {
                    // Get.bottomSheet(
                    //   BottomSheetWidegt(
                    //     workid: controller.argumentData["workid"],
                    //     workname: controller.argumentData["workname"],
                    //   ),
                    //   // Optional parameters
                    //   backgroundColor: Colors.white,
                    //   elevation: 8.0,
                    //   shape: const RoundedRectangleBorder(1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111*11
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(16.0),
                    //       topRight: Radius.circular(16.0),
                    //     ),1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
                    //   ),
                    // );
                    // controller1.clears();
                    // Get.to(SubContractIteams());
                  },
                ),
              ),
              GetBuilder<SubcontractAddingController>(
                builder: (controller) => controller1
                            .selectedDropdowndataModel ==
                        null
                    ? Center(child: loadingthreebounce)
                    : SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: NewCaseTextField(
                                      validator: Validators.noneEmptyValidator,
                                      labelstyle: header11.copyWith(
                                        color: Colors.black54,
                                      ),
                                      mediaquery: MediaQuery.of(context).size,
                                      controller: controller.work_name,
                                      keyboard: TextInputType.name,
                                      label: "Work Name",
                                      icon: CachedNetworkImage(
                                        imageUrl:
                                            "https://cdn-icons-png.flaticon.com/512/3716/3716527.png",
                                        color: Colors.black,
                                        height: 3.h,
                                        width: 9.w,
                                        placeholder: (context, url) =>
                                            const SizedBox(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      )),
                                ),
                                h2,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  child: Container(
                                    constraints:
                                        const BoxConstraints(maxHeight: 63),
                                    child: SearchField(
                                      searchStyle: header11.copyWith(
                                        color: Colors.black,
                                      ),

                                      suggestionItemDecoration:
                                          BoxDecoration(color: bColor2),
                                      // validator: Validators.noneEmptyValidator,
                                      controller: controller.selectcontractor,
                                      suggestionStyle: header10.copyWith(
                                          color: Colors.black87,
                                          fontFamily: light),
                                      searchInputDecoration: InputDecoration(
                                        labelText: 'Select contractor',
                                        labelStyle: header11.copyWith(
                                          color: Colors.black54,
                                        ),
                                        suffixIcon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey),
                                        icon: cImage(
                                            "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
                                        enabledBorder:
                                            const UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  //  iserror.value != false
                                                  //     ? Colors.red
                                                  //     :
                                                  Colors.black26,
                                              width: 1.0),
                                        ),
                                      ),
                                      suggestions: controller1
                                          .selectedDropdowndataModel!
                                          .contractors
                                          .map(
                                            (e) => SearchFieldListItem(
                                              e.contractorName.toString(),
                                              child: Text(
                                                "  ${e.contractorName}",
                                                style: header10,
                                              ),
                                              item: e.contractorId,
                                            ),
                                          )
                                          .toList(),
                                      onSuggestionTap: (value) {
                                        controller.contractor.value =
                                            value.item.toString();
                                        print(value.item.toString());
                                        // type = value.item;
                                        // print(_workType.text);
                                        // print(type);
                                      },
                                    ),
                                  ),
                                ),
                                h2,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  child: NewCaseTextField(
                                      maxLine: 5,
                                      minlines: 3,
                                      labelstyle: header11.copyWith(
                                        color: Colors.black54,
                                      ),
                                      mediaquery: MediaQuery.of(context).size,
                                      controller: controller.description,
                                      keyboard: TextInputType.multiline,
                                      descrip: TextInputAction.newline,
                                      label: "Description",
                                      icon: billRemarks()
                                      // CachedNetworkImage(
                                      //   imageUrl:
                                      //       "https://cdn-icons-png.flaticon.com/512/3716/3716527.png",
                                      //   color: Colors.black,
                                      //   height: 3.h,
                                      //   width: 9.w,
                                      //   placeholder: (context, url) => const SizedBox(),
                                      //   errorWidget: (context, url, error) =>
                                      //       const Icon(Icons.error),
                                      // )
                                      ),
                                ),
                                h2,
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 10),
                                  child: SizedBox(
                                    // color: Colors.amber,
                                    height: mediaquery.height * .06,
                                    child: Obx(
                                      () => Row(
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              radius: 10,
                                              onTap: () {
                                                // isSelected.value = !isSelected.value;
                                                if (controller.contract_type
                                                            .value ==
                                                        "unit_rate" ||
                                                    controller.contract_type
                                                            .value ==
                                                        "fixed_rate") {
                                                  if (controller.contract_type
                                                          .value ==
                                                      "unit_rate") {
                                                    isSelected.value = true;
                                                  } else if (controller
                                                          .contract_type
                                                          .value ==
                                                      "fixed_rate") {
                                                    isSelected.value = false;
                                                  }
                                                } else {
                                                  isSelected.value =
                                                      !isSelected.value;
                                                }
                                              },
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    "Fixed Rate",
                                                    style: header11.copyWith(
                                                        fontSize: 12.sp,
                                                        fontFamily: Medium),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    // color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: isSelected.value
                                                            ? Colors.black12
                                                            : bColor,
                                                        width: isSelected.value
                                                            ? 1
                                                            : 2)),
                                              ),
                                            ),
                                          ),
                                          w2,
                                          Expanded(
                                            child: InkWell(
                                              radius: 10,
                                              onTap: () {
                                                if (controller.contract_type
                                                            .value ==
                                                        "unit_rate" ||
                                                    controller.contract_type
                                                            .value ==
                                                        "fixed_rate") {
                                                  if (controller.contract_type
                                                          .value ==
                                                      "unit_rate") {
                                                    isSelected.value = true;
                                                  } else if (controller
                                                          .contract_type
                                                          .value ==
                                                      "fixed_rate") {
                                                    isSelected.value = false;
                                                  }
                                                } else {
                                                  isSelected.value =
                                                      !isSelected.value;
                                                }

                                                // controller.contract_type.value = "unit_rate";
                                              },
                                              child: Container(
                                                child: Center(
                                                  child: Text(
                                                    "Unit Rate",
                                                    style: header11.copyWith(
                                                        fontSize: 12.sp,
                                                        fontFamily: Medium),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                    // color: Colors.blueGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: isSelected.value
                                                            ? bColor
                                                            : Colors.black12,
                                                        width: isSelected.value
                                                            ? 2
                                                            : 1)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                h2,
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 15, right: 8),
                                  child: SubmitButtons(
                                    isLoading: false.obs,
                                    text: "+ Add New Work",
                                    onTap: () {
                                      // [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
                                      controller.workidname.value = "";
                                      controller.Est_Amount.clear();
                                      controller.quantity.clear();
                                      controller.remarks.clear();
                                      controller.workid_type.value = "";
                                      controller.workidname.value = "";
                                      controller.Est_Amount.clear();
                                      controller.totalqty.clear();
                                      controller.remarks.clear();
                                      controller.unite.value = "";
                                      controller.rate_per_unit.clear();
                                      controller.workid_type.value = "";
                                      controller.unitname.clear();
                                      controller.quantity.clear();
                                      fixedrate("", isSelected, context, false,
                                          "", 1);
                                    },
                                  ),
                                ),
                                h2,
                                const Padding(
                                  padding: EdgeInsets.only(left: 15, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black26,
                                  ),
                                ),
                                SizedBox(
                                  height: mediaquery.height * .05,
                                  // color: Colors.amber,
                                  width: mediaquery.width,
                                  child: Row(
                                    children: [
                                      w10,
                                      Text(
                                        "Work Type",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: Medium),
                                      ),
                                      const Spacer(),
                                      Text(
                                        "Est Amount",
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontFamily: Medium),
                                      ),
                                      w15
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 15, right: 10),
                                  child: Divider(
                                    thickness: 1,
                                    color: Colors.black26,
                                  ),
                                ),
                                Container(
                                  // color: Colors.amberAccent,
                                  child: Obx(
                                    () => Column(
                                      children: [
                                        ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              controller.fixedrate.length,
                                          itemBuilder: (context, index) {
                                            var data =
                                                controller.fixedrate[index];
                                            return Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 0),
                                                  child: Container(
                                                    // color: Colors.deepOrangeAccent,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.h),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.h,
                                                              vertical: .1.h),
                                                      child: Row(
                                                        children: [
                                                          w6,

                                                          Text(
                                                            data.work!,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    regular,
                                                                fontSize:
                                                                    12.sp),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            data.est_amount
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    regular,
                                                                fontSize:
                                                                    12.sp),
                                                          ),
                                                          w12,
                                                          // IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_outlined))
                                                          InkWell(
                                                            onTap: () {
                                                              if (data.fixed_unit ==
                                                                  "fixed_rate") {
                                                                controller
                                                                        .Est_Amount
                                                                        .text =
                                                                    data.est_amount
                                                                        .toString();
                                                                controller
                                                                        .remarks
                                                                        .text =
                                                                    data.remarks
                                                                        .toString();
                                                                controller
                                                                        .quantity
                                                                        .text =
                                                                    data.work
                                                                        .toString();
                                                                controller
                                                                        .workid_type
                                                                        .value =
                                                                    data.work_type
                                                                        .toString();
                                                                fixedrate(
                                                                    data,
                                                                    false.obs,
                                                                    context,
                                                                    true,
                                                                    "edit",
                                                                    index);
                                                              } else if (data
                                                                      .fixed_unit ==
                                                                  "unit_rate") {
                                                                controller
                                                                        .unitname
                                                                        .text =
                                                                    data.unitname
                                                                        .toString();
                                                                controller
                                                                        .Est_Amount
                                                                        .text =
                                                                    data.est_amount
                                                                        .toString();
                                                                controller
                                                                        .rate_per_unit
                                                                        .text =
                                                                    data.unit_rate
                                                                        .toString();
                                                                controller.unit
                                                                        .text =
                                                                    data.unit
                                                                        .toString();
                                                                controller
                                                                        .totalqty
                                                                        .text =
                                                                    data.quantity
                                                                        .toString();
                                                                controller
                                                                        .remarks
                                                                        .text =
                                                                    data.remarks
                                                                        .toString();
                                                                fixedrate(
                                                                    data,
                                                                    true.obs,
                                                                    context,
                                                                    true,
                                                                    "edit",
                                                                    index);
                                                              }
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .edit_note_outlined,
                                                              size: 30,
                                                            ),
                                                          ),
                                                          w3,
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, right: 10),
                                                  child: Divider(
                                                    thickness: 1,
                                                    color: Colors.black26,
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                        h2,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 8),
                                          child: Container(
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: _amounteditable(
                                                            context,
                                                            "Opening Balance",
                                                            "0",
                                                            data)),
                                                    w1,
                                                    Expanded(
                                                        child: _amount(
                                                            context,
                                                            "Total No. of Works",
                                                            controller.fixedrate
                                                                .length
                                                                .toString())),
                                                  ],
                                                ),
                                                h2,
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        child: _amount(
                                                            context,
                                                            "Estimated Amount",
                                                            controller
                                                                .estimatedaount
                                                                .value
                                                                .toString())),
                                                    w1,
                                                    Expanded(
                                                        child: _amount(
                                                            context,
                                                            "Total Payable",
                                                            controller
                                                                .totalpayable
                                                                .toString())),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        h2,
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 8),
                                          child: SubmitButtons(
                                            isLoading: controller
                                                .ispostsubcontractloading,
                                            text: "Submit",
                                            onTap: () {
                                              controller.postsubcontract_create(
                                                  controller1
                                                      .argumentData["workid"]);
                                            },
                                          ),
                                        ),
                                        h4,
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> fixedrate(edituupdate, RxBool data, BuildContext context,
      bool onedite, edit, int deleteindex) async {
    var totalvalue = 0.obs;
    var rateuite = 0.obs;
    var totalqty = 0.obs;

    // Function to calculate the estimated amount
    void estaount() {
      // Calculate the total value
      totalvalue.value = rateuite.value * totalqty.value;

      // Update the Est_Amount text field with the calculated value
      controller.Est_Amount.text = totalvalue.value.toString();
      print(controller.Est_Amount.text);
    }

    if (data.value) {
      return Get.dialog(Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxHeight: 63),
                    child: SearchField(
                      validator: Validators.noneEmptyValidator,
                      searchStyle: header11.copyWith(
                        color: Colors.black,
                      ),
                      suggestionItemDecoration: BoxDecoration(color: bColor2),
                      controller: controller.quantity,
                      suggestionStyle: header10.copyWith(
                          color: Colors.black87, fontFamily: light),
                      searchInputDecoration: InputDecoration(
                        labelText: 'Select Work Type',
                        labelStyle: header11.copyWith(
                          color: Colors.black87,
                        ),
                        suffixIcon: const Icon(Icons.arrow_drop_down,
                            color: Colors.grey),
                        icon: cImage(
                            "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 1.0),
                        ),
                      ),
                      suggestions:
                          controller1.selectedDropdowndataModel!.workTypes
                              .map(
                                (e) => SearchFieldListItem(
                                  e.typeName.toString(),
                                  child: Text(
                                    "  ${e.typeName}",
                                    style: header10,
                                  ),
                                  item: e,
                                ),
                              )
                              .toList(),
                      onSuggestionTap: (value) {
                        controller.workid_type.value = value.item!.typeId;
                        controller.workidname.value = value.item!.typeName;
                        print(value.item.toString());
                      },
                    ),
                  ),
                  h2,
                  Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 4,
                            child: NewCaseTextField(
                              validator: Validators.noneEmptyValidator,
                              onChanged: (p0) {
                                rateuite.value = int.tryParse(p0) ?? 0;
                                estaount(); // Update the total value when this field changes
                              },
                              maxLine: 2,
                              labelstyle: header11.copyWith(
                                color: Colors.black45,
                              ),
                              mediaquery: MediaQuery.of(context).size,
                              controller: controller.rate_per_unit,
                              keyboard: TextInputType
                                  .number, // Ensure it's a numeric input
                              label: "Rate per Unit",
                              icon: paidAmount(),
                            ),
                          ),
                          w1,
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 2),
                              child: Container(
                                constraints:
                                    const BoxConstraints(maxHeight: 63),
                                child: SearchField(
                                  searchStyle: header11.copyWith(
                                    color: Colors.black,
                                  ),
                                  suggestionItemDecoration:
                                      BoxDecoration(color: bColor2),
                                  controller: controller.unitname,
                                  suggestionStyle: header10.copyWith(
                                      color: Colors.black87, fontFamily: light),
                                  searchInputDecoration: InputDecoration(
                                    labelText: 'Unit',
                                    labelStyle: header11.copyWith(
                                      color: Colors.black87,
                                    ),
                                    suffixIcon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.grey),
                                    enabledBorder: const UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black26, width: 1.0),
                                    ),
                                  ),
                                  suggestions: controller1
                                      .selectedDropdowndataModel!.measureUnits
                                      .map(
                                        (e) => SearchFieldListItem(
                                          e.unitName.toString(),
                                          child: Text(
                                            "  ${e.unitName}",
                                            style: header10,
                                          ),
                                          item: e,
                                        ),
                                      )
                                      .toList(),
                                  onSuggestionTap: (value) {
                                    controller.unitname.text =
                                        value.item!.unitName.toString();
                                    controller.unite.value =
                                        value.item.toString();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  h2,
                  NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    onChanged: (p0) {
                      totalqty.value = int.tryParse(p0) ?? 0;
                      estaount(); // Update the total value when this field changes
                    },
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: controller.totalqty,
                    keyboard:
                        TextInputType.number, // Ensure it's a numeric input
                    label: "Total Qty",
                    icon: Icon(
                      Icons.insert_chart_outlined_rounded,
                      color: Colors.black38.withOpacity(.4),
                    ),
                  ),
                  h2,
                  NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    onChanged: (p0) {},
                    readOnly: true,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: controller.Est_Amount,
                    keyboard: TextInputType.number,
                    label: "Est. Amount",
                    icon: paidAmount(),
                  ),
                  h2,
                  NewCaseTextField(
                    maxLine: 5,
                    minlines: 3,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: controller.remarks,
                    keyboard: TextInputType.name,
                    label: "Remarks",
                    icon: billRemarks(),
                  ),
                  h2,
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      edit == "edit"
                          ? Expanded(
                              // width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (controller.fixedrate.length != 1) {
                                    controller.fixedrate.removeAt(deleteindex);
                                    Get.back();
                                  } else {
                                    controller.contract_type.value = "";
                                    controller.fixedrate.removeAt(deleteindex);
                                    Get.back();
                                  }
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  backgroundColor:
                                      WidgetStatePropertyAll(bColor),
                                ),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      w1,
                      Expanded(
                        // width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            // Get.back();
                            if (controller.formKey.currentState!.validate()) {
                              if (edit == "edit") {
                                edituupdate.est_amount =
                                    controller.Est_Amount.text;
                                edituupdate.unit_rate =
                                    controller.rate_per_unit.text;
                                edituupdate.unit = controller.unit.text;
                                edituupdate.quantity = controller.totalqty.text;
                                edituupdate.remarks = controller.remarks.text;
                                edituupdate.unitname = controller.unitname.text;
                                await controller.totalvalue();
                                Get.back();
                              } else {
                                controller.fixedrate.add(FixedRate(
                                    unitname: controller.unitname.text,
                                    fixed_unit: "unit_rate",
                                    work: controller.workidname.value,
                                    est_amount: controller.Est_Amount.text,
                                    quantity: controller.totalqty.text,
                                    remarks: controller.remarks.text,
                                    unit: controller.unite.value.toString(),
                                    unit_rate: controller.rate_per_unit.text,
                                    work_type: controller.workid_type.value));

                                controller.contract_type.value = "unit_rate";
                                await controller.totalvalue();

                                Get.back();
                              }
                            }
                            controller.workidname.value = "";
                            controller.Est_Amount.clear();
                            controller.totalqty.clear();
                            controller.remarks.clear();
                            controller.unite.value = "";
                            controller.rate_per_unit.clear();
                            controller.workid_type.value = "";
                            controller.unitname.clear();
                            controller.quantity.clear();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            backgroundColor: WidgetStatePropertyAll(bColor),
                          ),
                          child: Text(
                            edit == "edit" ? "Update" : 'Add',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    } else {
      return Get.dialog(
        Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    h2,
                    Container(
                      constraints: const BoxConstraints(maxHeight: 63),
                      child: SearchField(
                        searchStyle: header11.copyWith(
                          color: Colors.black,
                        ),
                        // suggestions: const [],
                        suggestionItemDecoration: BoxDecoration(color: bColor2),
                        validator: Validators.noneEmptyValidator,
                        controller: controller.quantity,
                        suggestionStyle: header10.copyWith(
                            color: Colors.black87, fontFamily: light),
                        searchInputDecoration: InputDecoration(
                          labelText: 'Select Work Type',
                          labelStyle: header11.copyWith(
                            color: Colors.black87,
                          ),
                          suffixIcon: const Icon(Icons.arrow_drop_down,
                              color: Colors.grey),
                          icon: cImage(
                              "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    //  iserror.value != false
                                    //     ? Colors.red
                                    //     :
                                    Colors.black26,
                                width: 1.0),
                          ),
                        ),
                        suggestions:
                            controller1.selectedDropdowndataModel!.workTypes
                                .map(
                                  (e) => SearchFieldListItem(
                                    e.typeName.toString(),
                                    child: Text(
                                      "  ${e.typeName}",
                                      style: header10,
                                    ),
                                    item: e,
                                  ),
                                )
                                .toList(),
                        onSuggestionTap: (value) {
                          controller.workidname.value = value.item!.typeName;
                          controller.workid_type.value = value.item!.typeId;

                          // type = value.item;
                          // print(_workType.text);
                          // print(type);
                        },
                      ),
                    ),
                    h2,
                    NewCaseTextField(
                        validator: Validators.noneEmptyValidator,
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        controller: controller.Est_Amount,
                        keyboard: TextInputType.number,
                        label: "Est. Amount",
                        icon: paidAmount()),
                    h2,
                    NewCaseTextField(
                        maxLine: 5,
                        minlines: 2,
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        controller: controller.remarks,
                        keyboard: TextInputType.name,
                        label: "Remarks",
                        icon: billRemarks()),
                    h2,
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        edit == "edit"
                            ? Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (controller.fixedrate.length != 1) {
                                      controller.fixedrate
                                          .removeAt(deleteindex);
                                      Get.back();
                                    } else {
                                      controller.contract_type.value = "";
                                      controller.fixedrate
                                          .removeAt(deleteindex);
                                      controller.fixedrate.clear();
                                      Get.back();
                                    }
                                    // Get.back();
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                      backgroundColor:
                                          WidgetStatePropertyAll(bColor)),
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        w1,
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                if (edit == "edit") {
                                  edituupdate.est_amount =
                                      controller.Est_Amount.text;
                                  edituupdate.work = controller.quantity.text;
                                  edituupdate.remarks = controller.remarks.text;
                                  edituupdate.work_type =
                                      controller.workid_type.value;
                                  await controller.totalvalue();
                                  Get.back();
                                } else {
                                  controller.fixedrate.add(FixedRate(
                                      fixed_unit: "fixed_rate",
                                      work: controller.workidname.value,
                                      est_amount: controller.Est_Amount.text,
                                      quantity: "",
                                      remarks: controller.remarks.text,
                                      unit: "",
                                      unit_rate: "",
                                      work_type: controller.workid_type.value));

                                  // controller.uniteRate.add(UniteRate(
                                  //     quantity: controller.quantity.text,
                                  //     unit: controller.Est_Amount.text,
                                  //     unit_rate: controller.remarks.text));
                                  controller.contract_type.value = "fixed_rate";
                                  await controller.totalvalue();
                                  Get.back();
                                }
                              }
                              controller.workidname.value = "";
                              controller.Est_Amount.clear();
                              controller.quantity.clear();
                              controller.remarks.clear();
                              controller.workid_type.value = "";
                              // Get.back();
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                                backgroundColor:
                                    WidgetStatePropertyAll(bColor)),
                            child: Text(
                              edit == "edit" ? "Update" : 'Add',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    h2,
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _amount(BuildContext context, titel, amount) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Text(
          titel,
          style: TextStyle(fontSize: 16, fontFamily: regular),
        ),
        h1,
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black26, width: 1),
            // color: Colors.amber,
          ),
          // width: mediaquery.width,
          height: mediaquery.height * .06,
          child: Center(
            child: Text(amount),
          ),
        )
      ],
    ));
  }

  Widget _amounteditable(
      BuildContext context, titel, amount, TextEditingController data) {
    var mediaquery = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Text(
          titel,
          style: TextStyle(fontSize: 16, fontFamily: regular),
        ),
        h1,
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26, width: 1),
              // color: Colors.amber,
            ),
            // width: mediaquery.width,
            height: mediaquery.height * .06,
            child: TextFormField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                controller.openbalance.text = value.toString();
                controller.totalpayables();
              },
              textAlign: TextAlign.center,
              controller: data,
              decoration: const InputDecoration(
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            )
            // Center(
            //   child: Text(amount),
            // ),
            )
      ],
    ));
  }
}
