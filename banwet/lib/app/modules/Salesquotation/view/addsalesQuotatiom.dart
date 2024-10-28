import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/Salesquotation/controller/salequotation.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

class AddSalesQuotatiom extends GetView<QuotationController> {
  const AddSalesQuotatiom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          SubmitButtons(isLoading: false.obs, onTap: () {}, text: "Submit"),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              h1,
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ProjectNameTitile(
                  addbutton: const SizedBox(),
                  screenTitile: "Add Quotation",
                  onTap: () {},
                ),
              ),
              h1,
              Padding(
                padding: const EdgeInsets.only(left: 1),
                child: SearchField(
                    searchStyle:
                        header11.copyWith(color: Colors.black, fontSize: 11.sp),
                    suggestionItemDecoration: BoxDecoration(
                      color: bColor2,
                    ),
                    suggestionStyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    controller: TextEditingController(),
                    validator: (p0) {
                      // if (controller.expTypeCtrl.text.isEmpty) {
                      //   return '';
                      // } else if (!controller.expType
                      //     .any((e) => e.toString() == p0)) {
                      //   return 'Invalid Expense Type';
                      // } else {
                      //   return null;
                      // }
                    },
                    searchInputDecoration: InputDecoration(
                      labelText: 'Expense Type',
                      hintStyle: header11.copyWith(
                        fontSize: 11.sp,
                        color: Colors.black54,
                      ),
                      labelStyle: header11.copyWith(
                          color: Colors.black54, fontSize: 12.sp),
                      suffixIcon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      icon: CachedNetworkImage(
                        imageUrl:
                            "https://cdn-icons-png.flaticon.com/512/9298/9298945.png",
                        color: Colors.black38,
                        height: 3.h,
                        width: 7.w,
                        placeholder: (context, url) => const SizedBox(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black26),
                      ),
                    ),
                    suggestions: []
                    //  controller.expType
                    //     .map(
                    //       (e) => SearchFieldListItem(
                    //         e.toString(),
                    //         child: Text('  ${e.toString()}', style: header11),
                    //         item: e.toString(),
                    //       ),
                    //     )
                    //     .toList(),
                    // onSuggestionTap: (val){
                    //   headId=val.item;
                    //
                    // },
                    ),
              ),
              NewCaseTextField(
                  validator: Validators.noneEmptyValidator,
                  labelstyle: header11.copyWith(
                    color: Colors.black54,
                  ),
                  mediaquery: MediaQuery.of(context).size,
                  controller: TextEditingController(),
                  keyboard: TextInputType.name,
                  label: "Quotation Type",
                  icon: SizedBox(
                      height: 3.6.h,
                      child: Image.asset("assets/images/quotationtype.png"))),
              h1,
              NewCaseTextField(
                  validator: Validators.noneEmptyValidator,
                  labelstyle: header11.copyWith(
                    color: Colors.black54,
                  ),
                  mediaquery: MediaQuery.of(context).size,
                  controller: TextEditingController(),
                  keyboard: TextInputType.name,
                  label: "Customer Name",
                  icon: SizedBox(
                      height: 3.6.h,
                      child: Image.asset("assets/images/quotationtype.png"))),
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
                      height: 3.6.h,
                      child: Image.asset("assets/images/addresa.png"))),
              h1,
              NewCaseTextField(
                  validator: Validators.noneEmptyValidator,
                  labelstyle: header11.copyWith(
                    color: Colors.black54,
                  ),
                  mediaquery: MediaQuery.of(context).size,
                  controller: TextEditingController(),
                  keyboard: TextInputType.name,
                  label: "State",
                  icon: SizedBox(
                      height: 3.6.h,
                      child: Image.asset("assets/images/quotationtype.png"))),
              h1,
              SizedBox(
                height: 56,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      child: NewCaseTextField(
                          validator: Validators.noneEmptyValidator,
                          labelstyle: header11.copyWith(
                            color: Colors.black54,
                          ),
                          mediaquery: MediaQuery.of(context).size,
                          controller: TextEditingController(),
                          keyboard: TextInputType.name,
                          label: "Quotation  Date",
                          icon: SizedBox(
                              height: 3.h,
                              child:
                                  Image.asset("assets/images/dateicon.png"))),
                    ),
                    Expanded(
                      child: NewCaseTextField(
                          validator: Validators.noneEmptyValidator,
                          labelstyle: header11.copyWith(
                            color: Colors.black54,
                          ),
                          mediaquery: MediaQuery.of(context).size,
                          controller: TextEditingController(),
                          keyboard: TextInputType.name,
                          label: "Expiry Date",
                          icon: SizedBox(
                              height: 3.h,
                              child:
                                  Image.asset("assets/images/dateicon.png"))),
                    ),
                  ],
                ),
              ),
              h1,
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                itemBuilder: (context, index) =>
                    selectquotationdetails(context),
              ),
              // selectquotationdetails(context),
              // Padding(
              //   padding: const EdgeInsets.only(),
              //   child: Container(
              //     constraints: const BoxConstraints(maxHeight: 63),
              //     child: SearchField(
              //       searchStyle: header11.copyWith(
              //         color: Colors.black,
              //       ),

              //       suggestionItemDecoration: BoxDecoration(color: bColor2),
              //       // validator: Validators.noneEmptyValidator,
              //       // controller: controller.selectcontractor,
              //       suggestionStyle: header10.copyWith(
              //           color: Colors.black87, fontFamily: light),
              //       searchInputDecoration: InputDecoration(
              //         labelText: 'Quotation Type',
              //         labelStyle: header11.copyWith(
              //           color: Colors.black54,
              //         ),
              //         suffixIcon:
              //             const Icon(Icons.arrow_drop_down, color: Colors.grey),
              //         icon: cImage(
              //             "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
              //         enabledBorder: const UnderlineInputBorder(
              //           borderSide: BorderSide(
              //               color:
              //                   //  iserror.value != false
              //                   //     ? Colors.red
              //                   //     :
              //                   Colors.black26,
              //               width: 1.0),
              //         ),
              //       ),
              //       // suggestions: controller1.selectedDropdowndataModel!.contractors
              //       //     .map(
              //       //       (e) => SearchFieldListItem(
              //       //         e.contractorName.toString(),
              //       //         child: Text(
              //       //           "  ${e.contractorName}",
              //       //           style: header10,
              //       //         ),
              //       //         item: e.contractorId,
              //       //       ),
              //       //     )
              //       //     .toList(),
              //       suggestions: [],
              //       onSuggestionTap: (value) {
              //         // controller.contractor.value = value.item.toString();
              //         print(value.item.toString());
              //         // type = value.item;
              //         // print(_workType.text);
              //         // print(type);
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        )),
      ),
    );
  }

  selectquotationdetails(BuildContext context) {
    var mediaquer = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(
          () => InkWell(
            radius: 9,
            onTap: () {
              controller.boxdetails.value = !controller.boxdetails.value;
              print(controller.boxdetails.value);
            },
            child: Container(
              height: 7.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "PU FLEX 8.STEP",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: Medium,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Icon(
                      controller.boxdetails.value
                          ? Icons.keyboard_arrow_down_outlined
                          : Icons.keyboard_arrow_up_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: bColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(controller.boxdetails.value ? 0 : 10),
                      bottomRight:
                          Radius.circular(controller.boxdetails.value ? 0 : 10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
            ),
          ),
        ),
        Obx(
          () => controller.boxdetails.value
              ? Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 236, 233),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Title',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Sub Title',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Description',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Products',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Warranty',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Method of Application',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              decoration: InputDecoration(
                                label: Text(
                                  'Notes',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          height: 8.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              w1,
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Amount/Sqft",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: regular),
                                    ),
                                    Container(
                                      height: 4.h,
                                      // width: 30.w,
                                      child: Center(
                                          child: SizedBox(
                                        width: 21.w,
                                        child: Center(
                                          child: Text(
                                            "54",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Medium),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )),
                                    )
                                  ]),
                              const VerticalDivider(
                                thickness: 1,
                                color: Colors.black38,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Approx.sqft",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: regular),
                                    ),
                                    Container(
                                      height: 4.h,
                                      // width: 30.w,
                                      child: Center(
                                          child: SizedBox(
                                        width: 21.w,
                                        child: Center(
                                          child: Text(
                                            "54",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Medium),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )),
                                    )
                                  ]),
                              const VerticalDivider(
                                thickness: 1,
                                color: Colors.black38,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total Amount",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: Medium),
                                    ),
                                    Container(
                                      height: 4.h,
                                      // width: 30.w,
                                      child: Center(
                                          child: SizedBox(
                                        width: 21.w,
                                        child: Center(
                                          child: Text(
                                            "54",
                                            style: TextStyle(
                                                fontSize: 12, fontFamily: Bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )),
                                    )
                                  ]),
                              // const VerticalDivider(
                              //   thickness: 1,
                              //   color: Colors.black38,
                              //   indent: 10,
                              //   endIndent: 10,
                              // ),
                              w1,
                              Container(
                                width: 8.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10)),
                                  color: bColor,
                                ),
                                height: mediaquer.height,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        h2,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: SubmitButtons(
                              color: const Color.fromARGB(255, 19, 103, 23),
                              isLoading: false.obs,
                              onTap: () {},
                              text: "Update"),
                        ),
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        )
      ],
    );
  }
}
