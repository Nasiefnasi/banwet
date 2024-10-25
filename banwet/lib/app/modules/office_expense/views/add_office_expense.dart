import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Style/const.dart';
import '../../../common_widegt/loading.dart';
import '../controllers/add_officeexpence_controller.dart';
import 'component/editSection1componet.dart';
import 'component/editSetion2component.dart';
import 'component/indication.dart';

class AddOfficeExpense extends GetView<AddfficeExpenseController> {
  AddOfficeExpense({super.key});

  @override
  AddfficeExpenseController controller = Get.put(AddfficeExpenseController());

  @override
  Widget build(BuildContext context) {
    controller.taxPersentage.clear();
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          elevation: 0,
          title: Text(
            "Add Office Expense",
            style: header15,
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
        body: SafeArea(
          child: GetBuilder<AddfficeExpenseController>(
            builder: (controller) => controller.expenseHeadModel == null
                ? loadingthreebounce
                : SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      children: [
                        h2,
                        Indiaction(),
                        h3,
                        controller.edit1.value
                            ? EditSectionTwo()
                            : EditSectionOne()
                      ],
                    ),
                  ),
          ),
        ));
  }
}
// 