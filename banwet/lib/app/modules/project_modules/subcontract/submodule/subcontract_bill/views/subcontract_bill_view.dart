import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/subcontract/submodule/subcontract_bill/views/update.subcontract.bill.dart';

import '../../../../../../Style/const.dart';
import '../../../../../../common_widegt/common2date.dart';
import '../../../../../../common_widegt/deletedialoge.dart';
import '../../../../../../common_widegt/loading.dart';
import '../../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/subcontract_bill_controller.dart';
import 'addsubcontract_bill.dart';

class SubcontractBillView extends GetView<SubcontractBillController> {
  SubcontractBillView({Key? key}) : super(key: key);
  var dateFormat = DateFormat('dd-MM-yyyy');
  @override
  SubcontractBillController controller = Get.put(SubcontractBillController());

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
                screenTitile: "Bills",
                onTap: () {
                  controller.taxpersentageController.text = "0.0";
                  controller.taxpersentage.value = 0.0;
                  Get.to(() => AddSubcontractBill());
                },
              ),
              Common2Date(
                ontap: () {
                  controller.filteringData();
                  controller.update();
                  // controller.change();
                },
                statDate: controller.startDateController,
                endDate: controller.endDateController,
                startDateValue: controller.startDate,
                endDateValue: controller.endDate,
                onPressed: () {
                  controller.filteringData();
                  controller.update();

                  print("<-----------==---------------");
                },
              ),
              h4,
              GetBuilder<SubcontractBillController>(
                builder: (controller) => controller.subCommonModel == null
                    ? Center(child: loadingthreebounce)
                    : controller.filterList.value.length == 0
                        ? SizedBox(
                            height: 50.h,
                            child: Center(
                              child: Lottie.asset(
                                  repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            ),
                          )
                        : Expanded(
                            child: ListView.builder(
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  controller.subCommonModel!.bills!.length,
                              itemBuilder: (context, index) {
                                if (dateFormat
                                            .parse(controller.subCommonModel!
                                                .bills![index].createdDate!)
                                            .compareTo(DateTime.parse(controller
                                                .startDateController.text)) >=
                                        0 &&
                                    dateFormat
                                            .parse(controller.subCommonModel!
                                                .bills![index].createdDate!)
                                            .compareTo(DateTime.parse(controller
                                                .endDateController.text)) <=
                                        0) {
                                  return BillListTile(index: index);
                                } else {
                                  return const SizedBox();
                                }
                              },
                            ),
                          ),
                init: SubcontractBillController(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BillListTile extends GetView<SubcontractBillController> {
  BillListTile({super.key, required this.index});
  @override
  SubcontractBillController controller = Get.put(SubcontractBillController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(itemsBetweenDates().length);
        //
        // id = controller.reqDatas.value.data?[index].orderId;
        // controller.idAdd(id);
        // controller.reqDetailGet();
        // _requestDetails(context);
        //
        //  print(id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        height: 13.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
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
                        'Bill No : ',
                        style: wheader10,
                      ),
                      Text(
                        controller.subCommonModel!.bills![index].billNo ?? "",
                        style: wheader10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Payable",
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
                        controller.subCommonModel!.bills![index]
                                .billPayableAmount ??
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
                      "Paid",
                      style: wheader10,
                    ),
                    w2,
                    rupees(),
                    SizedBox(
                      width: 15.w,
                      child: Text(
                        controller
                                .subCommonModel!.bills![index].billTotalPaid ??
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
                      "Balance",
                      style: wheader10,
                    ),
                    w2,
                    rupees(),
                    SizedBox(
                      width: 15.w,
                      child: Text(
                        controller.subCommonModel!.bills![index]
                                .billBalanceAmount ??
                            "",
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
                      controller.subCommonModel!.bills![index].createdDate
                          .toString(),
                      style: wheader12,
                    ),
                  ],
                ),
                w4,
                controller.subCommonModel!.bills![index].createdDate
                            .toString() ==
                        DateFormat("dd-MM-y").format(DateTime.now()).toString()
                    ? PopupMenuButton<String>(
                        onSelected: (value) {
                          if ("delete" == value) {
                            expDelete(context, index, () {
                              controller.delete(controller
                                  .subCommonModel!.bills![index].billId
                                  .toString());
                              controller.getDetails();
                              controller.update();
                            });
                          } else if ("edit" == value) {
                            var data = controller.subCommonModel!.bills![index];
                            controller.billNo.text = data.billNo.toString();
                            controller.billDate.text = data.billDate.toString();
                            controller.grossAmountController.text =
                                data.billGrossAmount ?? "";
                            controller.taxpersentageController.text =
                                data.billTaxPercent ?? "";
                            controller.paidAmountController.text =
                                data.billAmount ?? "";
                            controller.paidDate.text = data.billDate ?? "";
                            controller.remark.text = data.billRemarks ?? "";
                            // controller.paidFromAccount.text =
                            //     data.billCreditAc ?? "";
                            // controller.paymentMode.text =
                            //     data.billCreditAc ?? "";
                            // ddddsadasdasd
                            Get.to(UpdateSubContractBill(), arguments: {
                              "billId": controller
                                      .subCommonModel?.bills?[index].billId ??
                                  "",
                              "workid": controller
                                      .subCommonModel?.bills?[index].workId ??
                                  "",
                              // "contractId":
                              //     controller.subCommonModel?.bills?[index]. ??
                              //         "",
                              "billDate": controller
                                      .subCommonModel?.bills?[index].billDate ??
                                  "",
                              "billNo": controller
                                      .subCommonModel?.bills?[index].billNo ??
                                  "",
                              "billPaidAmt": controller.subCommonModel
                                      ?.bills?[index].billTotalPaid ??
                                  "",
                              "taxpercent": controller.subCommonModel
                                      ?.bills?[index].billTaxPercent ??
                                  "",
                              "billPaidDate": controller
                                      .subCommonModel?.bills?[index].billDate ??
                                  "",
                              "billRemarks": controller.subCommonModel
                                      ?.bills?[index].billDescription ??
                                  "",
                              "billDebitAct": controller.subCommonModel
                                      ?.bills?[index].billCreditAc ??
                                  "",
                              "billPayMode": controller.subCommonModel
                                      ?.bills?[index].billPayableAmount ??
                                  "",
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        ),
                        surfaceTintColor: Colors.white,
                        itemBuilder: (context) {
                          return [
                            const PopupMenuItem(
                              value: "edit",
                              child: Text(
                                "Edit",
                              ),
                            ),
                            const PopupMenuItem(
                                value: "delete", child: Text("Delete"))
                          ];
                        })
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
