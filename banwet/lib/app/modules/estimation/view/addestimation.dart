import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/estimation/view/addMaterials.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class Addestimation extends StatelessWidget {
  const Addestimation({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool istrue = false.obs;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child:
            SubmitButtons(isLoading: false.obs, onTap: () {}, text: "Submit"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: ProjectNameTitile(
                addbutton: const SizedBox(),
                screenTitile: "Add Estimation",
                onTap: () {
                  // Get.to(AddSalesQuotatio m());
                },
              ),
            ),
            h1,
            Container(
              child: Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      splashRadius: 5,
                      value: istrue.value,
                      onChanged: (value) {
                        istrue.value = !istrue.value;
                      },
                    ),
                    Text(
                      "Branch",
                      style: TextStyle(fontFamily: Medium),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      splashRadius: 5,
                      value: !istrue.value,
                      onChanged: (value) {
                        istrue.value = !istrue.value;
                      },
                    ),
                    Text(
                      "Customer",
                      style: TextStyle(fontFamily: Medium),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   height: 60,
            //   width: 350,
            //   constraints: const BoxConstraints(maxHeight: 63),
            //   child: Row(
            //     children: [
            //       SearchField(
            //         searchStyle: header11.copyWith(
            //           color: Colors.black,
            //         ),

            //         suggestionItemDecoration: BoxDecoration(color: bColor2),
            //         // validator: Validators.noneEmptyValidator,
            //         // controller: controller.selectcontractor,
            //         suggestionStyle: header10.copyWith(
            //             color: Colors.black87, fontFamily: light),
            //         searchInputDecoration: InputDecoration(
            //           labelText: 'Select Customer',
            //           labelStyle: header11.copyWith(
            //             color: Colors.black54,
            //           ),
            //           suffixIcon:
            //               const Icon(Icons.arrow_drop_down, color: Colors.grey),
            //           icon: cImage(
            //               "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
            //           enabledBorder: const UnderlineInputBorder(
            //             borderSide: BorderSide(
            //                 color:
            //                     //  iserror.value != false
            //                     //     ? Colors.red
            //                     //     :
            //                     Colors.black26,
            //                 width: 1.0),
            //           ),
            //         ),
            //         // suggestions: controller1.selectedDropdowndataModel!.contractors
            //         //     .map(
            //         //       (e) => SearchFieldListItem(
            //         //         e.contractorName.toString(),
            //         //         child: Text(
            //         //           "  ${e.contractorName}",
            //         //           style: header10,
            //         //         ),
            //         //         item: e.contractorId,
            //         //       ),
            //         //     )
            //         //     .toList(),
            //         suggestions: [],
            //         onSuggestionTap: (value) {
            //           // controller.contractor.value = value.item.toString();
            //           print(value.item.toString());
            //           // type = value.item;
            //           // print(_workType.text);
            //           // print(type);
            //         },
            //       ),
            //       Container(
            //         height: 1.h,
            //         width: 3.w,
            //         color: Colors.red,
            //       )
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(),
              child: SizedBox(
                height: 61,
                // width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SearchField(
                        searchStyle: header11.copyWith(
                          color: Colors.black,
                        ),

                        suggestionItemDecoration: BoxDecoration(color: bColor2),
                        // validator: Validators.noneEmptyValidator,
                        // controller: controller.selectcontractor,
                        suggestionStyle: header10.copyWith(
                            color: Colors.black87, fontFamily: light),
                        searchInputDecoration: InputDecoration(
                          labelText: 'Select Customer',
                          labelStyle: header11.copyWith(
                            color: Colors.black54,
                          ),
                          suffixIcon: const Icon(Icons.arrow_drop_down,
                              color: Colors.grey),
                          icon: SizedBox(
                              height: 3.h,
                              child: Image.asset(
                                  "assets/images/estimatcustom.png")),
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
                        // suggestions: controller1.selectedDropdowndataModel!.contractors
                        //     .map(
                        //       (e) => SearchFieldListItem(
                        //         e.contractorName.toString(),
                        //         child: Text(
                        //           "  ${e.contractorName}",
                        //           style: header10,
                        //         ),
                        //         item: e.contractorId,
                        //       ),
                        //     )
                        //     .toList(),
                        suggestions: const [],
                        onSuggestionTap: (value) {
                          // controller.contractor.value = value.item.toString();
                          print(value.item.toString());
                          // type = value.item;
                          // print(_workType.text);
                          // print(type);
                        },
                      ),
                    ),
                    Obx(
                      () => istrue.value != true
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: InkWell(
                                onTap: () {
                                  return addestimatyon(context);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: bColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  height: 4.5.h,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  width: 60,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
              ),
            ),
            h2,
            SearchField(
              searchStyle: header11.copyWith(
                color: Colors.black,
              ),

              suggestionItemDecoration: BoxDecoration(color: bColor2),
              // validator: Validators.noneEmptyValidator,
              // controller: controller.selectcontractor,
              suggestionStyle:
                  header10.copyWith(color: Colors.black87, fontFamily: light),
              searchInputDecoration: InputDecoration(
                labelText: 'Select Sale price Category',
                labelStyle: header11.copyWith(
                  color: Colors.black54,
                ),
                suffixIcon:
                    const Icon(Icons.arrow_drop_down, color: Colors.grey),
                icon: SizedBox(
                    height: 2.h,
                    child: Image.asset("assets/images/estimatcategory.png")),
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
              // suggestions: controller1.selectedDropdowndataModel!.contractors
              //     .map(
              //       (e) => SearchFieldListItem(
              //         e.contractorName.toString(),
              //         child: Text(
              //           "  ${e.contractorName}",
              //           style: header10,
              //         ),
              //         item: e.contractorId,
              //       ),
              //     )
              //     .toList(),
              suggestions: const [],
              onSuggestionTap: (value) {
                // controller.contractor.value = value.item.toString();
                print(value.item.toString());
                // type = value.item;
                // print(_workType.text);
                // print(type);
              },
            ),

            h1,
            DateTimePickers(
              style: header11.copyWith(
                color: Colors.black,
              ),
              label: "Bill Date",
              controller: TextEditingController(),
              labelStyle: header11.copyWith(
                color: Colors.black54,
              ),

              //  header10.copyWith(
              //     color: Colors.black87, fontFamily: light),
            ),
            h2,
            // NewCaseTextField(
            //     validator: Validators.noneEmptyValidator,
            //     labelstyle: header11.copyWith(
            //       color: Colors.black54,
            //     ),
            //     mediaquery: MediaQuery.of(context).size,
            //     controller: TextEditingController(),
            //     keyboard: TextInputType.name,
            //     label: "Expiry Date",
            //     icon: SizedBox(
            //         height: 3.h,
            //         child: Image.asset("assets/images/dateicon.png"))),

            h1,
          ],
        )),
      ),
    );
  }

  void addestimatyon(BuildContext context) {
    Get.dialog(Dialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Container(
        constraints: BoxConstraints(maxHeight: 75.h),
        width: MediaQuery.of(context).size.width * .98,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                h2,
                Text(
                  "Create New Customer",
                  style: TextStyle(fontSize: 16, fontFamily: Medium),
                ),
                h1,
                NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: TextEditingController(),
                    keyboard: TextInputType.name,
                    label: "Name of Customer",
                    icon: SizedBox(
                        height: 3.h,
                        child: Image.asset("assets/images/estimatcustom.png"))),
                h1,
                NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: TextEditingController(),
                    keyboard: TextInputType.name,
                    label: "Phone Number",
                    icon: SizedBox(
                        height: 3.h,
                        child: Image.asset("assets/images/phoneicona.png"))),
                h1,
                NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: TextEditingController(),
                    keyboard: TextInputType.name,
                    label: "Address",
                    icon: SizedBox(
                        height: 3.h,
                        child: Image.asset(
                          "assets/images/carbon_location.png",
                          color: Colors.black38,
                        ))),
                h1,
                NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: TextEditingController(),
                    keyboard: TextInputType.name,
                    label: "Sale Price Category",
                    icon: SizedBox(
                        height: 2.2.h,
                        child:
                            Image.asset("assets/images/estimatcategory.png"))),
                h1,
                NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: TextEditingController(),
                    keyboard: TextInputType.name,
                    label: "Email of Customer",
                    icon: SizedBox(
                        height: 2.2.h,
                        child: Image.asset(
                          "assets/images/mail.png",
                          color: Colors.black38,
                        ))),
                h1,
                NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: TextEditingController(),
                    keyboard: TextInputType.name,
                    label: "Tax Number",
                    icon: SizedBox(
                        height: 3.h,
                        child: Image.asset("assets/images/taxicon.png"))),
                h1,
                NewCaseTextField(
                    validator: Validators.noneEmptyValidator,
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    controller: TextEditingController(),
                    keyboard: TextInputType.name,
                    label: "State Code",
                    icon: SizedBox(
                        height: 3.h,
                        child: Image.asset("assets/images/statecodes.png"))),
                h1,
                h3,
                SubmitButtons(
                    isLoading: false.obs,
                    onTap: () {
                      Get.to(const AddMaterialsPage());
                    },
                    text: "Submit"),
                h2,
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
