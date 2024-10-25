import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common2date.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../../../common_widegt/metriallistshowdialoge.dart';
import '../../materialpurchase_home.dart';
import '../controllers/purchase_order_controller.dart';
import 'create.purchase.order.dart';

class PurchaseOrderView extends GetView<PurchaseOrderController> {
  PurchaseOrderView({Key? key}) : super(key: key);
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
              screenTitile: "Purchase Order",
              onTap: () {
                Get.to(() => AddPurchaseOrder());
              },
            ),
            h1,
            Common2Date(
              statDate: controller.startDateController,
              endDate: controller.endDateController,
              onPressed: () {
                controller.filteringDate();

                controller.update();
              },
              ontap: () {
                controller.filteringDate();

                controller.update();
              },
            ),
            h3,
            GetBuilder<PurchaseOrderController>(
              builder: (controller) => controller.requestHomeModel == null
                  ? Center(
                      child: SizedBox(
                          height: dHeight! * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [loadingthreebounce],
                          )))
                  : controller.filterList.value.length == 0
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
                          child: ListView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.filterList.value.length,
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
              init: PurchaseOrderController(),
            )
          ],
        ),
      ),
    ));
  }
}

class ListTIle extends StatelessWidget {
  var dateFormat = DateFormat('dd-MM-yyyy');
  final int index;
  ListTIle({super.key, required this.index});
  PurchaseOrderController controller = Get.put(PurchaseOrderController());
  @override
  Widget build(BuildContext context) {
    String dateString = controller.delivarydate.text;

    String formattedDate = DateFormat('dd MMM yyyy')
        .format(DateFormat('dd-MM-yyyy').parse(dateString.split(' ')[0]));
    return GestureDetector(
      onTap: () async {
        controller.requestDetailModels.value.items = await null;
        controller.getEcachbiiDetails(
            controller.requestHomeModel!.data![index].orderId!);
        metrialshowListdialog(
            context,
            controller.requestHomeModel!.data![index].orderId!,
            controller.requestDetailModels);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 15),
        width: double.infinity,
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
                        text: "PO ID : ",
                        style: popin16W500.copyWith(
                            fontSize: 15, color: Colors.white),
                        children: [
                      TextSpan(
                        text:
                            "#${controller.requestHomeModel?.data?[index].orderId ?? ""}",
                        style: popin16W500.copyWith(
                            fontSize: 15, color: Colors.white),
                      )
                    ])),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset("assets/svg/eye.svg"),
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
                      style: popin16W400.copyWith(fontSize: 14))
                ])),
            const SizedBox(height: 5),
            RichText(
                text: TextSpan(
                    text: "Excepted Delivery  : ",
                    style: popin16W400.copyWith(
                      fontSize: 14,
                      color: const Color(
                        0xffe7b400,
                      ),
                    ),
                    children: [
                  TextSpan(
                    text: controller
                            .requestHomeModel?.data?[index].delivery_date ??
                        "",

                    //  DateFormat('dd MMM yyyy').format(
                    //   DateTime.parse(controller.delivarydate.text),
                    // ),

                    // controller.delivarydate.text,
                    style: popin16W400.copyWith(
                      fontSize: 14,
                      color: const Color(
                        0xffe7b400,
                      ),
                    ),
                  )
                ])),
            h3,
            Row(
              children: [
                RichText(
                    text: TextSpan(
                        text: "Supplier : ",
                        style: popin16W500.copyWith(
                            fontSize: 14, color: Colors.white),
                        children: [
                      TextSpan(
                        text: controller
                                .requestHomeModel?.data?[index].supplierName ??
                            "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.10,
                        ),
                      )
                    ])),
                Text(
                  controller.requestHomeModel?.data?[index].approvalStatus ??
                      "",
                  style: popin16W400.copyWith(fontSize: 14),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
