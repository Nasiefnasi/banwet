import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/project_modules/client_payment/views/component.dart/paymentlist.tile.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';

import '../controllers/client_payment_controller.dart';

class ClientPaymentView extends GetView<ClientPaymentController> {
  const ClientPaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              h2,
              ProjectNameTitile(
                projectName: controller.argumnetData["workname"] ?? "",
                screenTitile: "Client Payment",
                onTap: () {
                  // Get.to(() => ProjectAddDayilyNote());
                },
              ),
              h2,
              Common2Date(
                ontap: () {
                  //      controller.change();
                },
                statDate: controller.startDateController,
                endDate: controller.endDateController,
                startDateValue: controller.startDate,
                endDateValue: controller.endDate,
                onPressed: () {
                  // controller.filteringDates();
                  controller.update();
                  print("<--------------------------");
                },
              ),
              h4,
              GetBuilder<ClientPaymentController>(
                builder: (controller) => 00 == null
                    ? Column(
                        children: [
                          h5,
                          Center(child: loadingthreebounce),
                        ],
                      )
                    :
                    // : controller.dayilNoteModel!.data.isEmpty
                    00 == 9
                        ? const Text("no items")
                        : Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => h2,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              //   itemCount: controller.dayilNoteModel!.data.length,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                if (00 == 00

                                    // dateFormat
                                    //           .parse(controller.dayilNoteModel!
                                    //               .data[index].createdDate)
                                    //           .compareTo(DateTime.parse(controller
                                    //               .startDateController.text)) >=
                                    //       0 &&
                                    //   dateFormat
                                    //           .parse(controller.dayilNoteModel!
                                    //               .data[index].createdDate)
                                    //           .compareTo(DateTime.parse(controller
                                    //               .endDateController.text)) <=
                                    //       0

                                    ) {
                                  // log("${controller.dayilNoteModel!.data[index].createdDate}-------");
                                  return const PaymentListTile(
                                      id: "2323",
                                      amount: "2344",
                                      dates: "23-30-2021");
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
