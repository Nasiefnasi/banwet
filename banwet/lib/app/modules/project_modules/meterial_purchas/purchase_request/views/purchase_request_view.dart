import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/data/model/RequestModel/request_detail_model.dart';

import '../../../../../Style/const.dart';
import '../../../../../common_widegt/common2date.dart';
import '../../../../../common_widegt/loading.dart';
import '../../../../../common_widegt/metriallistshowdialoge.dart';
import '../../materialpurchase_home.dart';
import '../controllers/purchase_request_controller.dart';
import 'create_purchase.request.dart';

class PurchaseRequestView extends GetView<PurchaseRequestController> {
  PurchaseRequestView({Key? key}) : super(key: key);
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
              screenTitile: "Purchase Request",
              onTap: () {
                Get.to(() => CreatePurchaseRequest());
              },
            ),
            Common2Date(
              statDate: controller.startDateController,
              endDate: controller.endDateController,
              onPressed: () {
                controller.update();
                controller.filterAndCalculateTotalWage(
                    controller.requestHomeModel?.data == null
                        ? []
                        : controller.requestHomeModel!.data!.toList());
              },
              ontap: () {
                controller.update();
              },
            ),
            h3,
            GetBuilder<PurchaseRequestController>(
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
                          height: MediaQuery.of(context).size.height * .6,
                          width: double.infinity,
                          child: Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: 250),
                          ),
                        )
                      //  Center(
                      //     child: Lottie.asset(
                      //         repeat: false,
                      //         "assets/images/qrbRtDHknE.json",
                      //         height: 250),
                      //   )
                      : Expanded(
                          child: ListView.builder(
                              physics: const ScrollPhysics(),
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
                              }),
                        ),
              init: PurchaseRequestController(),
            )
          ],
        ),
      ),
    ));
  }
}

class ListTIle extends StatelessWidget {
  RequestDetailModel requestdetailmodel = RequestDetailModel();
  final int index;
  ListTIle({super.key, required this.index});
  PurchaseRequestController controller = Get.put(PurchaseRequestController());
  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 10),
        height: 11.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Request ID : ",
                        style: popin16W500.copyWith(
                            fontSize: 15, color: Colors.white),
                        children: [
                      TextSpan(
                          text:
                              "#${controller.requestHomeModel?.data?[index].orderId ?? ""}",
                          style: popin16W400)
                    ])),
                h1,
                Text(
                  DateFormat('dd MMM yyyy').format(
                    DateFormat('dd-MM-yyyy').parse(
                      controller.requestHomeModel?.data?[index].createdDate ??
                          "",
                    ),
                  ),
                  style:
                      popin16W500.copyWith(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 3),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        controller.requestHomeModel!.data![index].approvalStatus
                            .toString(),
                        style: wheader9.copyWith(
                            color: controller.requestHomeModel?.data?[index]
                                        .approvalStatus ==
                                    "Approved"
                                ? sucess
                                : controller.requestHomeModel?.data?[index]
                                            .approvalStatus ==
                                        "Rejected"
                                    ? pending
                                    : inProgress),
                      ),
                    ),
                  ],
                ),
                w2,
                SvgPicture.asset("assets/svg/eye.svg"),
                // const Icon(
                //   Icons.arrow_forward_ios,
                //   color: Colors.white,
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
