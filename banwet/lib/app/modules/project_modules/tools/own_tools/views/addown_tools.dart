import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../utils/validators.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/own_tools_controller.dart';

class AddOwnTools extends GetView<OwnToolsController> {
  AddOwnTools({super.key});
  @override
  OwnToolsController controller = Get.put(OwnToolsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: SubmitButton(
              onTap: () {
                if (controller.key.currentState!.validate()) {
                  controller.addOwntool();
                }
              },
              text: "Submit"),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Add Tool",
            style: header15.copyWith(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
        ),
        body: GetBuilder<OwnToolsController>(
          builder: (controller) => controller.subContractTypesModel == null
              ? Center(
                  child: loadingthreebounce,
                )
              : SingleChildScrollView(
                  child: Form(
                    key: controller.key,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Column(
                        children: [
                          SearchField(
                            searchStyle: header10.copyWith(color: Colors.black),
                            suggestionStyle: header11,
                            suggestionItemDecoration: BoxDecoration(
                              color: bColor2,
                            ),
                            controller: controller.toolCategory,
                            validator: Validators.noneEmptyValidator,
                            searchInputDecoration: InputDecoration(
                              labelText: 'Select Category',
                              labelStyle:
                                  header10.copyWith(color: Colors.black54),
                              suffixIcon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              icon: SizedBox(
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                    "assets/images/clarity_tools-line.png"),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 1.0), // Changed to Colors.black26
                              ),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black26,
                                    width: 1.0), // Changed to Colors.black26
                              ),
                            ),
                            suggestions: controller
                                .subContractTypesModel!.toolCategories!
                                .map(
                                  (e) =>
                                      SearchFieldListItem(e.catName.toString(),
                                          child: Text(
                                            '  ${e.catName.toString()}',
                                            style: header11,
                                          ),
                                          item: e),
                                )
                                .toList(),
                            onSuggestionTap: (value) {
                              controller.categoryid =
                                  value.item!.catId.toString();
                              FocusScope.of(context).unfocus();
                            },
                          ),
                          h3,
                          NewCaseTextField(
                            labelstyle: header11.copyWith(
                              color: Colors.black54,
                            ),
                            mediaquery: MediaQuery.of(context).size,
                            validator: Validators.noneEmptyValidator,
                            controller: controller.toolName,
                            keyboard: TextInputType.name,
                            label: "Tool Name",
                            icon: SizedBox(
                                // color: Colors.amber,
                                height: 30,
                                width: 30,
                                child: Image.asset(
                                    "assets/images/iconoir_tools.png")),
                          ),
                          h3,
                          SizedBox(
                            height: 50,
                            // color: Colors.amber,
                            child: Row(
                              children: [
                                Expanded(
                                  child: NewCaseTextField(
                                    labelstyle: header11.copyWith(
                                      color: Colors.black54,
                                    ),
                                    mediaquery: MediaQuery.of(context).size,
                                    validator: Validators.noneEmptyValidator,
                                    controller: controller.quantity,
                                    keyboard: TextInputType.number,
                                    label: "Quantity",
                                    icon: const ImageIcon(
                                      AssetImage(
                                        "assets/images/quantity1.png",
                                      ),
                                      color: Colors.black38,
                                    ),
                                    // ,Container(
                                    //     // color: Colors.amber,
                                    //     height: 30,
                                    //     width: 30,
                                    //     child: Image.asset(
                                    //         "assets/images/quanititys.png")),
                                  ),
                                ),
                                h3,
                                Expanded(
                                    child: NewCaseTextField(
                                  labelstyle: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                  mediaquery: MediaQuery.of(context).size,
                                  validator: Validators.noneEmptyValidator,
                                  controller: controller.priceperDay,
                                  keyboard: TextInputType.number,
                                  label: "Price Per Day",
                                  icon: CachedNetworkImage(
                                    imageUrl:
                                        "https://cdn-icons-png.flaticon.com/512/2174/2174598.png",
                                    color: Colors.black38,
                                    height: 4.h,
                                    // width: 7.w,
                                    placeholder: (context, url) =>
                                        const SizedBox(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          h3,
                          NewCaseTextField(
                            maxLine: 5, minlines: 4,
                            labelstyle: header11.copyWith(
                              color: Colors.black54,
                            ),
                            mediaquery: MediaQuery.of(context).size,
                            // validator: Validators.noneEmptyValidator,
                            controller: controller.description,
                            keyboard: TextInputType.multiline,
                            descrip: TextInputAction.newline,
                            label: "Description",
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: SizedBox(
                                  height: 30,
                                  width: 25,
                                  child: Image.asset(
                                      "assets/images/Description.png")),
                            ),
                          ),
                          h3,
                          // Spacer(),
                          // SubmitButton(
                          //     onTap: () {
                          //       if (controller.key.currentState!.validate()) {
                          //         controller.addOwntool();
                          //       }
                          //     },
                          //     text: "Submit"),
                          h2,
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
