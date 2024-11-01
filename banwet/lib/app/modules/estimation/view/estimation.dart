import 'package:banwet/app/common_widegt/common2date.dart';
import 'package:banwet/app/common_widegt/loading.dart';
import 'package:banwet/app/modules/estimation/controllers/estimationController.dart';
import 'package:banwet/app/modules/estimation/view/addestimation.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SalesEstimation extends GetView<Estimationcontroller> {
  const SalesEstimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ProjectNameTitile(
                screenTitile: "Estimation",
                onTap: () {
                  Get.to(const Addestimation());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Common2Date(
              ontap: () {
                controller.filterQuotaiondate();
                controller.change();
              },
              statDate: controller.startDateController,
              endDate: controller.endDateController,
              startDateValue: controller.startDate,
              endDateValue: controller.endDate,
              onPressed: () {
                // controller.filteringDates();
                // controller.filterAndCalculate();
                 controller.filterQuotaiondate();
                controller.update();
                print("<-------------");
              },
            ),
            ),Expanded(
                child: GetBuilder<Estimationcontroller>(
              builder: (controller) => Obx(
                () => controller.estimationloading.value
                    ? Column(
                        children: [
                          h5,
                          Center(child: loadingthreebounce),
                        ],
                      )
                    : Obx(() => 
                      controller.flterdetails.value.isEmpty
                          ? Center(
                              child: Lottie.asset(
                                  // repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            )
                          : ListView.builder(
                              itemCount:controller. flterdetails.value.length,
                              itemBuilder: (context, index) {
                                var details =
                                    controller. flterdetails.value[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Container(
                                    // height: ,
                                    // width: 800,
                      
                                    decoration: BoxDecoration(
                                        color: bColor,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15  , vertical: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            details.estimationId.toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: Medium,
                                                color: Colors.white),
                                          ),
                                          h1,
                                          Text(
                                            details.date.toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: regular,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                    ),
              ),
              init: Estimationcontroller(),
            ))
          ],
        )),
      ),
    );
  }
}
