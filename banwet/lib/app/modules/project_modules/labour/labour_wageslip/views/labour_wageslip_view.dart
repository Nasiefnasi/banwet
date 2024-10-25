import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common2date.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../../../data/model/WageModel/wage_slip_model.dart';
import '../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/labour_wageslip_controller.dart';
import 'component/bottomsheet.dart';
import 'component/countandamount_component.dart';
import 'component/labourwagesliplisttile.dart';

class LabourWageslipView extends GetView<LabourWageslipController> {
  LabourWageslipView({Key? key}) : super(key: key);
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    List<SlipData> filteredList = [];
    double totalWage = 0.0;
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              children: [
                h2,
                ProjectNameTitile(
                  projectName: controller.argumentData["workname"],
                  screenTitile: "Labour Wage Slips",
                  onTap: () {
                    Get.bottomSheet(
                      BottomSheetWidegt(
                        workid: controller.argumentData["workid"],
                        workname: controller.argumentData["workname"],
                      ),
                      // Optional parameters
                      backgroundColor: Colors.white,
                      elevation: 8.0,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                    );
                    // Get.to(() => AddLabourActivity());
                  },
                ),
                h2,
                Common2Date(
                  ontap: () {
                    controller.update();
                    controller.filterData();
                  },
                  statDate: controller.startDateController,
                  endDate: controller.endDateController,
                  startDateValue: controller.startDate,
                  endDateValue: controller.endDate,
                  onPressed: () {
                    controller.filterData();
                    controller.update();
                    controller.filterAndCalculateTotalWage(
                        controller.wageSlipModel?.data == null
                            ? []
                            : controller.wageSlipModel!.data!);
                    // controller.filteringDates();
                    controller.update();
                    print("<--------------------------");
                  },
                ),
                h2,
                CountAndAmountContainer1(),
                h2,
                GetBuilder<LabourWageslipController>(
                  builder: (controller) => controller.wageSlipModel == null
                      ? Center(
                          child: SizedBox(
                              height: dHeight! * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [loadingthreebounce],
                              )))
                      : controller.filteredList.value.length == 0
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
                                    controller.wageSlipModel!.data!.length,
                                itemBuilder: (context, index) {
                                  if (dateFormat
                                              .parse(controller.wageSlipModel!
                                                  .data![index].createdDate!)
                                              .compareTo(DateTime.parse(
                                                  controller.startDateController
                                                      .text)) >=
                                          0 &&
                                      dateFormat
                                              .parse(controller.wageSlipModel!
                                                  .data![index].createdDate!)
                                              .compareTo(DateTime.parse(
                                                  controller.endDateController
                                                      .text)) <=
                                          0) {
                                    return LabourWageSlip(index);
                                  } else {
                                    return const SizedBox();
                                  }
                                },
                              ),
                            ),
                  init: LabourWageslipController(),
                )
              ],
            ),
          )),
    );
  }
}
