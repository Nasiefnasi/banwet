import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common2date.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../../../common_widegt/metriallistshowdialoge.dart';
import '../../materialpurchase_home.dart';
import '../controllers/purchase_bill_controller.dart';
import 'addpurchase_bill.dart';

class PurchaseBillView extends GetView<PurchaseBillController> {
  PurchaseBillView({Key? key}) : super(key: key);
  var dateFormat = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h),
        child: Column(
          children: [
            h2,
            ProjectNameTitile(
              projectName: controller.argumentData["workname"],
              screenTitile: "Purchase Bill",
              onTap: () {
                Get.to(() => AddPurchaseBill());
              },
            ),
            Common2Date(
              statDate: controller.startDateController,
              endDate: controller.endDateController,
              onPressed: () {
                controller.update();
                controller.filterAndCalculateTotalWagse(
                    controller.requestHomeModel?.data == null
                        ? []
                        : controller.requestHomeModel!.data!.toList());
              },
              ontap: () {
                controller.update();
              },
            ),
            h3,
            GetBuilder<PurchaseBillController>(
              builder: (controller) => controller.requestHomeModel == null
                  ? Center(
                      child: SizedBox(
                          height: dHeight! * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [loadingthreebounce],
                          )))
                  : controller.filteredList.value.length == 0
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * .4,
                          width: double.infinity,
                          child: Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: 250),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 10,
                            ),
                            // physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                controller.requestHomeModel!.data!.length,
                            itemBuilder: (context, index) {
                              if (dateFormat
                                          .parse(controller.requestHomeModel!
                                              .data![index].createdDate!)
                                          .compareTo(DateTime.parse(controller
                                              .startDateController.text)) >=
                                      0 &&
                                  dateFormat
                                          .parse(controller.requestHomeModel!
                                              .data![index].createdDate!)
                                          .compareTo(DateTime.parse(controller
                                              .endDateController.text)) <=
                                      0) {
                                return ListTIle(
                                  index: index,
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
              init: PurchaseBillController(),
            )
          ],
        ),
      ),
    ));
  }
}

class ListTIle extends StatelessWidget {
  final int index;
  ListTIle({super.key, required this.index});
  PurchaseBillController controller = Get.put(PurchaseBillController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // controller.requestDetailModels.value.items = await null;
        // controller.getEcachbiiDetails(
        //     controller.requestHomeModel!.data![index].orderId!);
        // metrialshowListdialog(
        //     context,
        //     controller.requestHomeModel!.data![index].orderId!,
        //     controller.requestDetailModels);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 15),
        // height: 20.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Purchase  ID : ",
                        style: wheader11,
                        children: [
                      TextSpan(
                          text:
                              "#${controller.requestHomeModel?.data?[index].orderId ?? ""}",
                          style: wheader11)
                    ])),
                InkWell(
                  onTap: () async {
                    controller.requestDetailModels.value.items = await null;
                    controller.getEcachbiiDetails(
                        controller.requestHomeModel!.data![index].orderId!);
                    metrialshowListdialog(
                        context,
                        controller.requestHomeModel!.data![index].orderId!,
                        controller.requestDetailModels);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/svg/eye.svg"),
                  ),
                ),
              ],
            ),
            RichText(
                text: TextSpan(
                    text: "Created By : ",
                    style: popin16W400.copyWith(fontSize: 14),
                    children: [
                  TextSpan(
                      text:
                          "${controller.requestHomeModel?.data?[index].createdBy ?? ""} | ${DateFormat('dd MMM yyyy').format(
                        DateFormat('dd-MM-yyyy').parse(
                          controller
                                  .requestHomeModel?.data?[index].createdDate ??
                              "",
                        ),
                      )}",
                      style: wheader11)
                ])),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    // color: Colors.amber,
                    child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                            text: "Supplier : ",
                            style:
                                wheader11.copyWith(fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                  text: controller.requestHomeModel
                                          ?.data?[index].supplierName ??
                                      "",
                                  style: wheader11)
                            ])),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: InkWell(
                    onTap: () {
                      Get.to(() => const LaunchSoon());
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(child: Text("GRN", style: header10)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
