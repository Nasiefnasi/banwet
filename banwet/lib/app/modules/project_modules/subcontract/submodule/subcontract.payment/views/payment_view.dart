// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common2date.dart';
import '../../../../../../common_widegt/loading.dart';
import '../../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/payment_controller.dart';
import 'add_payment.dart';

class PaymentView extends GetView<PaymentController> {
  PaymentView({Key? key}) : super(key: key);
  var dateFormat = DateFormat('dd-MM-yyyy');
  @override
  PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              h2,
              ProjectNameTitile(
                projectName: controller.argumentData["workname"] ?? "yjyt",
                screenTitile: "Payment",
                onTap: () {
                  Get.to(() => AddSubContractPaymnet());
                },
              ),
              Common2Date(
                ontap: () {
                  controller.update();
                  // controller.change();
                },
                statDate: controller.startDateController,
                endDate: controller.endDateController,
                startDateValue: controller.startDate,
                endDateValue: controller.endDate,
                onPressed: () {
                  // controller.filteringDates();
                  controller.update();
                  print("<-----------==---------------");
                },
              ),
              h4,
              GetBuilder<PaymentController>(
                builder: (controller) => controller.subCommonModel == null
                    ? Center(child: loadingthreebounce)
                    : controller.subCommonModel!.payments!.isEmpty
                        ? Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: 250),
                          )
                        : Expanded(
                            child: ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.subCommonModel!.payments!.length,
                              itemBuilder: (context, index) {
                                if (dateFormat
                                            .parse(controller.subCommonModel!
                                                .payments![index].createdDate!)
                                            .compareTo(DateTime.parse(controller
                                                .startDateController.text)) >=
                                        0 &&
                                    dateFormat
                                            .parse(controller.subCommonModel!
                                                .payments![index].createdDate!)
                                            .compareTo(DateTime.parse(controller
                                                .endDateController.text)) <=
                                        0) {
                                  return PaymnetListTile(index: index);
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                init: PaymentController(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaymnetListTile extends StatelessWidget {
  PaymnetListTile({super.key, required this.index});
  PaymentController controller = Get.put(PaymentController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2.h),
      padding: EdgeInsets.only(left: 2.h),
      height: 14.h,
      width: 100.w,
      decoration:
          BoxDecoration(color: bColor, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 35.w,
                child: Row(
                  children: [
                    Text(
                      'Tr.ID : ',
                      style: wheader12,
                    ),
                    Text(
                      controller
                              .subCommonModel!.payments![index].transactionId ??
                          "",
                      style: wheader12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Amount",
                    style: wheader10,
                  ),
                  w2,
                  const Text(
                    "₹ ",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 15.w,
                    child: Text(
                      controller.subCommonModel!.payments![index].trAmount ??
                          "",
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Bill Payment [ ID : ",
                    style: wheader10,
                  ),
                  w2,
                  SizedBox(
                    width: 15.w,
                    child: Text(
                      '${controller.subCommonModel!.payments![index].billId ?? ""}]',
                      style: TextStyle(fontSize: 10.sp, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Bill No :",
                    style: wheader10,
                  ),
                  w2,
                  SizedBox(
                    width: 15.w,
                    child: Text(
                      controller.subCommonModel!.payments![index].billNo ?? "",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.subCommonModel!.payments![index].createdDate ??
                        '',
                    style: wheader12,
                  ),
                ],
              ),
              w4,
            ],
          ),
        ],
      ),
    );
  }
}
