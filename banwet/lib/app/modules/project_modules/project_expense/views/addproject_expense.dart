import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../Style/const.dart';
import '../controllers/project_expense_controller.dart';
import 'component/index.dart';

class AddOfficeProjectExpense extends GetView<ProjectExpenseController> {
  AddOfficeProjectExpense({super.key});
  @override
  ProjectExpenseController controller = Get.put(ProjectExpenseController());
  ValueNotifier<bool> postionNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    controller.paidAccount();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Add Expense",
          style: header15,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
              controller.clear();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: GetBuilder<ProjectExpenseController>(
          builder: (controller) => controller.expenseHeadModel == null
              ? const SpinKitThreeBounce(
                  color: Colors.black,
                )
              : SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Column(
                    children: [
                      Indiaction(
                        postionNotifier: postionNotifier,
                        onTap: () {
                          postionNotifier.value = false;
                          postionNotifier.notifyListeners();
                        },
                      ),

                      ValueListenableBuilder(
                        valueListenable: postionNotifier,
                        builder: (context, value, child) => value
                            ? EditSectionTwo()
                            : EditSectionOne(
                                onTap: () {
                                  postionNotifier.value = true;
                                  postionNotifier.notifyListeners();
                                },
                              ),
                      )

                      //                      controller.edit1 ?
                    ],
                  ),
                ),
          init: ProjectExpenseController(),
        ),
      ),
    );
  }
}
