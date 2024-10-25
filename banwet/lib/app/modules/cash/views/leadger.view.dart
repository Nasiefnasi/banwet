import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/style/const.dart';

import '../controllers/cash_controller.dart';

class LedgerView extends GetView<CashController> {
  LedgerView({super.key});
  CashController cashController = Get.put(CashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Ledger',
          style: header2.copyWith(
            fontFamily: Medium,
            fontSize: 18.sp,
          ),
        ),
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: Common2Date(
                ontap: () {
                  controller.change();
                  controller.filteringData();
                  controller.update();
                },
                statDate: controller.startDateController,
                endDate: controller.endDateController,
                startDateValue: controller.startDate,
                endDateValue: controller.endDate,
                onPressed: () {
                  controller.filteringData();

                  // controller.filteringDates();
                  controller.update();
                  print("<--------------------------");
                },
              ),
            ),
            h3,
            GetBuilder<CashController>(
              builder: (controller) => controller.ledgerModel == null
                  ? const SizedBox.shrink()
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 2.h),
                      width: double.infinity,
                      height: 102,
                      decoration: ShapeDecoration(
                        color: bColor,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF8D8D8D)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Balance ',
                            style: popin14W300,
                          ),
                          h1,
                          RichText(
                              text: TextSpan(
                                  text: '₹ ',
                                  style: const TextStyle(
                                      fontSize: 26,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                  children: [
                                TextSpan(
                                  text: controller
                                          .ledgerModel?.data?.totalBalance ??
                                      "",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.05,
                                  ),
                                )
                              ])),
                        ],
                      )),
                    ),
            ),
            h3,
            GetBuilder<CashController>(
              builder: (controller) {
                return cashController.ledgerModel == null
                    ? loadingthreebounce
                    : Table(
                        columnWidths: const {
                          0: FlexColumnWidth(2.5),
                          1: FlexColumnWidth(5),
                          2: FlexColumnWidth(3),
                        },
                        // border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(
                              decoration: const BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0),
                                    topRight: Radius.circular(0),
                                  )),
                              children: [
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.fill,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              right: BorderSide(
                                                  color: Color(0xFFC0C0C0),
                                                  width: 1))),
                                      height: 6.h,
                                      child: Center(
                                          child: Text(
                                        'Date',
                                        style: header11,
                                      ))),
                                ),
                                SizedBox(
                                    height: 6.h,
                                    child: Center(
                                        child: Text(
                                      'Description',
                                      style: header11,
                                    ))),
                                TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.fill,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color: Color(0xFFC0C0C0),
                                                  width: 1))),
                                      height: 6.h,
                                      child: Center(
                                          child: Text(
                                        'Amount',
                                        style: header11,
                                      ))),
                                ),
                              ]),
                          ...generateTableRows(),
                        ],
                      );
              },
              init: CashController(),
            )
          ],
        ),
      ),
    );
  }
}

generateTableRows() {
  List<TableRow> rows = [];
  CashController cont = Get.put(CashController());
  if (cont.filterList.value != null) {
    for (int i = 0; i < cont.filterList.value.length; i++) {
      // var transaction = <Transactions>[].obs;
      dynamic transaction = cont.filterList.value[i];
      bool isEven = i % 2 == 0;

      rows.add(
        TableRow(
          decoration: BoxDecoration(
              color:
                  isEven ? const Color(0xFFF0F0F0) : const Color(0xFFD9D9D9)),
          // borderRadius: BorderRadius.circular(10)),
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.fill,
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right:
                            BorderSide(color: Color(0xFFC0C0C0), width: .5))),
                height: 6.h,
                child: Center(
                  child: Text(
                    transaction.date ?? "",
                    style: header10.copyWith(fontFamily: regular),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(1.h),
              child: Center(
                child: Text(
                  transaction.description ?? "",
                  style: header10.copyWith(fontFamily: regular),
                ),
              ),
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.fill,
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Color(0xFFC0C0C0), width: .5))),
                height: 6.h,
                child: Center(
                    child: Text(
                  transaction.type == "debit"
                      ? transaction.debit ?? ""
                      : transaction.credit ?? "",
                  style: header10.copyWith(
                      color: transaction.type == "debit"
                          ? Colors.red
                          : Colors.green),
                )),
              ),
            ),
          ],
        ),
      );
    }
  }

  return rows;
}
