import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/loading.dart';
import '../controllers/subcontract_bill_controller.dart';
import 'component/inedx.dart';

class AddSubcontractBill extends GetView<SubcontractBillController> {
  AddSubcontractBill({super.key});
  @override
  SubcontractBillController controller = Get.put(SubcontractBillController());
  ValueNotifier<bool> postionNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Add bill",
              style: header15.copyWith(color: Colors.black),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                  controller.edit1.value = false;
                  controller.totalGrossAmount.value = 0;
                  controller.clear();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
          body: GetBuilder<SubcontractBillController>(
            builder: (controller) {
              if (controller.headModel == null) {
                return Center(child: loadingthreebounce);
              } else {
                controller.paidAccount();
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      h2,
                      DotIndiaction(
                        postionNotifier: postionNotifier,
                        onTap: () {
                          postionNotifier.value = false;
                          postionNotifier.notifyListeners();
                        },
                      ),
                      h3,
                      // Obx(() => controller.edit1.value
                      // ? SecondPaymentSection()
                      // : FirstPaymentSection())
                      ValueListenableBuilder(
                          valueListenable: postionNotifier,
                          builder: (context, value, child) => value
                              ? SecondPaymentSection()
                              : FirstPaymentSection(
                                  onTap: () {
                                    postionNotifier.value = true;
                                    postionNotifier.notifyListeners();
                                  },
                                ))
                    ],
                  ),
                );
              }
            },
            init: SubcontractBillController(),
          )),
    );
  }
}
