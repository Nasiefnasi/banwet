import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common_icontextform_feild.dart';
import '../../../../../common_widegt/datatimepicker.dart';
import '../../../../../utils/validators.dart';
import '../../../../daily_note/views/add_dailynote.dart';
import '../controllers/renttool_inner_controller.dart';

class AddInnerRentTool extends GetView<RenttoolInnerController> {
  AddInnerRentTool({super.key});
  @override
  RenttoolInnerController controller = Get.put(RenttoolInnerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Add Rent ",
          style: header2.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.clear();
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Form(
            key: controller.key,
            child: Column(
              children: [
                NewCaseTextField(
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    readOnly: true,
                    validator: Validators.noneEmptyValidator,
                    controller: controller.toolName,
                    keyboard: TextInputType.none,
                    label: "Tool Name",
                    icon: const Icon(Icons.sticky_note_2)),
                h3,
                // MyWidget(),

                SearchField(
                  searchStyle: header10.copyWith(
                    color: Colors.black45,
                  ),
                  suggestionStyle: header11,
                  suggestionItemDecoration: BoxDecoration(color: bColor2),
                  controller: controller.from,
                  validator: Validators.noneEmptyValidator,
                  searchInputDecoration: InputDecoration(
                    labelText: 'From',
                    labelStyle: header10.copyWith(color: Colors.black54),
                    suffixIcon:
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    icon: const Icon(Icons.location_on_outlined),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 1.0),
                    ),
                  ),
                  suggestions:
                      controller.toolDetailsModel!.data!.transferToLocations!
                          .map(
                            (e) => SearchFieldListItem(e.name.toString(),
                                child: Text(
                                  '  ${e.name.toString()}',
                                  style: header11,
                                ),
                                item: e),
                          )
                          .toList(),
                  onSuggestionTap: (value) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                h2,
                SearchField(
                  searchStyle: header10.copyWith(
                    color: Colors.black45,
                  ),
                  suggestionStyle: header11,
                  suggestionItemDecoration: BoxDecoration(color: bColor2),
                  controller: controller.to,
                  validator: Validators.noneEmptyValidator,
                  searchInputDecoration: InputDecoration(
                    labelText: 'To',
                    labelStyle: header10.copyWith(color: Colors.black54),
                    suffixIcon:
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    icon: const Icon(Icons.location_on_outlined),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87, width: 1.0),
                    ),
                  ),
                  suggestions:
                      controller.toolDetailsModel!.data!.transferToLocations!
                          .map(
                            (e) => SearchFieldListItem(e.name.toString(),
                                child: Text(
                                  '  ${e.name.toString()}',
                                  style: header11,
                                ),
                                item: e),
                          )
                          .toList(),
                  onSuggestionTap: (value) {
                    FocusScope.of(context).unfocus();
                  },
                ),
                h3,
                Row(
                  children: [
                    Expanded(
                      child: NewCaseTextField(
                          labelstyle: header11.copyWith(
                            color: Colors.black54,
                          ),
                          mediaquery: MediaQuery.of(context).size,
                          validator: Validators.noneEmptyValidator,
                          controller: controller.transferQunatity,
                          keyboard: TextInputType.number,
                          label: 'Transfer Quantity',
                          icon: const Icon(Icons.sticky_note_2)),
                    ),
                    DateTimePickers(
                      controller: controller.transferDate,
                      validator: Validators.noneEmptyValidator,
                      label: " Transfer Date",
                    ),
                  ],
                ),
                h3,
                NewCaseTextField(
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    validator: Validators.noneEmptyValidator,
                    controller: controller.priceperday,
                    keyboard: TextInputType.number,
                    label: "Price Per Day",
                    icon: const Icon(Icons.sticky_note_2)),
                h3,
                NewCaseTextField(
                    labelstyle: header11.copyWith(
                      color: Colors.black54,
                    ),
                    mediaquery: MediaQuery.of(context).size,
                    validator: Validators.noneEmptyValidator,
                    controller: controller.remarks,
                    keyboard: TextInputType.name,
                    label: "Remarks",
                    icon: const Icon(Icons.sticky_note_2)),
                h3,
                h3,
                SubmitButton(
                    onTap: () {
                      if (controller.key.currentState!.validate()) {
                        controller.addRenttools(
                          controller.argumnetData["toolid"],
                        );
                      }
                    },
                    text: "Submit")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
