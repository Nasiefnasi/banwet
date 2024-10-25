import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/loading.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../utils/validators.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/labour_activity_controller.dart';

class AddLabourActivity extends GetView<LabourActivityController> {
  AddLabourActivity({super.key});
  @override
  LabourActivityController controller = Get.put(LabourActivityController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Add Activity",
            style: header15,
          ),
          leading: IconButton(
              color: Colors.black,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Form(
                key: controller.key,
                child: GetBuilder<LabourActivityController>(
                  builder: (controller) => controller.wageListModel == null
                      ? Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.h),
                          child: loadingthreebounce)
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            h4,
                            SearchField(
                              searchStyle: header11.copyWith(
                                color: Colors.black54,
                              ),
                              suggestionItemDecoration:
                                  BoxDecoration(color: bColor2),
                              validator: Validators.noneEmptyValidator,
                              controller: controller.selectLabour,
                              suggestionStyle: header11.copyWith(
                                color: Colors.black54,
                              ),
                              searchInputDecoration: InputDecoration(
                                labelText: 'Select Labour',
                                labelStyle: header11.copyWith(
                                  color: Colors.black54,
                                ),
                                suffixIcon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                icon: cImage(
                                    "https://cdn-icons-png.flaticon.com/512/3716/3716527.png"),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.black26),
                                ),
                              ),
                              suggestions: controller.wageListModel!.labours!
                                  .map(
                                    (e) => SearchFieldListItem(
                                      e.labourName.toString(),
                                      child: Text(e.labourName.toString(),
                                          style: header11),
                                      item: e,
                                    ),
                                  )
                                  .toList(),
                              onSuggestionTap: (value) {
                                controller.labourid =
                                    value.item!.labourId.toString();
                                FocusScope.of(context).unfocus();
                              },
                            ),
                            h3,
                            // NewCaseTextField(
                            //   mediaquery: MediaQuery.of(context).size,
                            //   labelstyle: header11.copyWith(
                            //     color: Colors.black54,
                            //   ),
                            //   controller: controller.titleController,
                            //   keyboard: TextInputType.name,
                            //   label: "Title",
                            //   prefix: SizedBox(
                            //       height: 20,
                            //       width: 20,
                            //       child: Padding(
                            //         padding: const EdgeInsets.only(
                            //             top: 5, bottom: 15),
                            //         child: Image.asset(
                            //             "assets/images/titleicon.png"),
                            //       )),
                            // ),
                            // h3,
                            // NewCaseTextField(
                            //   minlines: 4,
                            //   maxLine: 5,
                            //   mediaquery: MediaQuery.of(context).size,
                            //   labelstyle: header11.copyWith(
                            //     color: Colors.black54,
                            //   ),
                            //   controller: controller.descriptionController,
                            //   keyboard: TextInputType.name,
                            //   label: "Description",
                            //   prefix: SizedBox(
                            //       height: 20,
                            //       width: 20,
                            //       child: Padding(
                            //         padding: const EdgeInsets.only(
                            //             top: 5, bottom: 15),
                            //         child: Image.asset(
                            //             "assets/images/Description.png"),
                            //       )),
                            // ),
                            NewCaseTextField(
                              labelstyle: header11.copyWith(
                                color: Colors.black54,
                              ),
                              mediaquery: MediaQuery.of(context).size,
                              validator: Validators.noneEmptyValidator,
                              controller: controller.titleController,
                              keyboard: TextInputType.name,
                              label: "Title",
                              icon: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Image.asset(
                                      "assets/images/titleicon.png")),
                            ),
                            h3,
                            NewCaseTextField(
                                descrip: TextInputAction.newline,
                                labelstyle: header11.copyWith(
                                  color: Colors.black54,
                                ),
                                mediaquery: MediaQuery.of(context).size,
                                validator: Validators.noneEmptyValidator,
                                maxLine: 5,
                                minlines: 5,
                                controller: controller.descriptionController,
                                keyboard: TextInputType.multiline,
                                label: "Description",
                                icon: SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: Image.asset(
                                        "assets/images/Description.png"))),
                            h5,
                            h6,
                            SubmitButtons(
                                isLoading: controller.isLoading,
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  if (controller.key.currentState!.validate()) {
                                    controller.postActivity();
                                  }
                                },
                                text: "Submit")
                          ],
                        ),
                )),
          ),
        ),
      ),
    );
  }
}
