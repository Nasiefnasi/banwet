import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import '../../../../../Style/const.dart';
import '../../../../../routes/app_pages.dart';
import '../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/own_tools_controller.dart';
import 'addown_tools.dart';

class OwnToolsView extends GetView<OwnToolsController> {
  OwnToolsView({Key? key}) : super(key: key);
  @override
  final OwnToolsController controller = Get.put(OwnToolsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: Column(
            children: [
              h1,
              ProjectNameTitile(
                projectName: controller.argumnetData["workname"],
                screenTitile: "Tools",
                onTap: () {
                  controller.clear();
                  Get.to(() => AddOwnTools());
                },
              ),
              h2,
              search(),
              h3,
              GetBuilder<OwnToolsController>(
                builder: (controller) => controller.toolsHomeModel ==
                        null // waiting api data
                    ? Center(
                        child: SizedBox(
                            height: dHeight! * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SpinKitThreeBounce(
                                  size: 30.sp,
                                  color: bColor,
                                ),
                              ],
                            )))
                    : controller.filteredData.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * .65,
                            // color: Colors.black,
                            child: Center(
                              child: Lottie.asset(
                                  repeat: false,
                                  "assets/images/qrbRtDHknE.json",
                                  height: 250),
                            ),
                          )
                        : Expanded(
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                      // height: 10,
                                      ),
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: controller.filteredData.length,
                              itemBuilder: (context, index) {
                                return OwnToolListTiles(
                                  index,
                                );
                              },
                            ),
                          ),
                init: OwnToolsController(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  search() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.h),
      child: SizedBox(
        height: 45,
        child: CupertinoSearchTextField(
          decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border.all(color: Colors.black54.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          onChanged: (value) {
            controller.searchText.value = value;
            controller.filterData();
          },
          itemSize: 16.sp,
          // backgroundColor: Colors.white,
          //  borderRadius: BorderRadius.circular(12),

          prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/images/Vecto.png")

              // const Icon(
              //   Icons.search_outlined,
              //   size: 25,
              // ),
              ),
          placeholder: 'Search Tool Name',
        ),
      ),
    );
  }
}

// class OwnToolListTile extends GetView<OwnToolsController> {
//   OwnToolListTile(this.index, {super.key});
//   @override
//   OwnToolsController controller = Get.put(OwnToolsController());
//   @override
//   final int index;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Get.toNamed(Routes.OWNTOOL_INNER, arguments: {
//           "workid": controller.argumnetData["workid"],
//           "toolid": controller.filteredData[index].toolId,
//           "workname": controller.argumnetData["workname"],
//           "toolname": controller.filteredData[index].name,
//           "quantity": controller.filteredData[index].ownedQty,
//           "qunatityOnSite": controller.filteredData[index].ownedQty
//         });
//       },
//       child: Container(
//         margin: EdgeInsets.only(bottom: 2.h),
//         padding: EdgeInsets.symmetric(horizontal: 2.h),
//         height: 13.h,
//         width: 100.w,
//         decoration: BoxDecoration(
//             color: bColor, borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 35.w,
//                   child: Text(
//                     controller.filteredData[index].name ?? "",
//                     style: wheader13,
//                   ),
//                 ),
//                 h1,
//                 Text(
//                   controller.filteredData[index].categoryName ?? "",
//                   style: wheader10,
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Qty at Site : ${controller.filteredData[index].totalQtyPresent ?? ""}',
//                           style: wheader11,
//                         ),
//                       ],
//                     ),
//                     h1,
//                     Text(
//                       'Own Qty : ${controller.filteredData[index].ownedQty ?? ""}',
//                       style: wheader11,
//                     ),
//                   ],
//                 ),
//                 w4,
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class OwnToolListTiles extends GetView<OwnToolsController> {
  const OwnToolListTiles(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var data = controller.filteredData[index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        radius: 10,
        onTap: () {
          Get.toNamed(Routes.OWNTOOL_INNER, arguments: {
            "workid": controller.argumnetData["workid"],
            "toolid": controller.filteredData[index].toolId,
            "workname": controller.argumnetData["workname"],
            "toolname": controller.filteredData[index].name,
            "quantity": controller.filteredData[index].ownedQty,
            "qunatityOnSite": controller.filteredData[index].ownedQty,
            "Office": data.totalatoffice ?? "0",
            "Worksite": data.totalatsite ?? "0",
            "Other Worksite": data.total_at_other_sites ?? "0",
            "Rentals": data.totalrentedatsite ?? "0",
          });
        },
        child: Container(
          // height: mediaquery.height * .2,
          decoration: BoxDecoration(
              color: bColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.filteredData[index].name ?? "",
                            style: TextStyle(
                                fontFamily: Medium,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            controller.filteredData[index].categoryName ?? "",
                            style: TextStyle(
                                fontFamily: regular,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            title: "Description",
                            titleStyle:
                                TextStyle(fontSize: 20, fontFamily: SemiBold),
                            content: TextField(
                              decoration: const InputDecoration(),
                              textAlign: TextAlign.center,
                              // textAlign:,
                              maxLines: 10,
                              minLines: 1,
                              readOnly: true,
                              controller: TextEditingController(
                                text: data.description,
                              ),
                            ));
                      },
                      child: const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                    ),
                    // w2,
                  ],
                ),
                const Divider(),
                h04,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    iteams("Office", data.totalatoffice ?? "0"),
                    iteams("Worksite", data.totalatsite ?? "0"),
                    iteams("Other Worksite", data.total_at_other_sites ?? "0"),
                    iteams("Rentals", data.totalrentedatsite ?? "0"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  iteams(title, amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style:
              TextStyle(fontFamily: Medium, fontSize: 12, color: Colors.white),
        ),
        h03,
        Text(
          amount.toString(),
          style:
              TextStyle(fontFamily: Medium, fontSize: 13, color: Colors.white),
        ),
      ],
    );
  }
}
