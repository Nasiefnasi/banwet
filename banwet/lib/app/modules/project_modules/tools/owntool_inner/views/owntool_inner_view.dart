import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/views/rentalreturns.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/views/rentedin.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/views/transferin.dart';
import 'package:banwet/app/modules/project_modules/tools/owntool_inner/views/transferout.dart';
import '../../../../../Style/const.dart';
import '../../../meterial_purchas/materialpurchase_home.dart';
import '../controllers/owntool_inner_controller.dart';
import 'addtooltarnsfer.dart';

// class OwntoolInnerView extends GetView<OwntoolInnerController> {
//   OwntoolInnerView({Key? key}) : super(key: key);

//   @override
//   OwntoolInnerController controller = Get.put(OwntoolInnerController());
//   @override
//   Widget build(BuildContext context) {
//     var mediaquery = MediaQuery.of(context).size;
//     return SafeArea(
//       bottom: false,
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               // height: mediaquery.height * .2,
//               width: double.infinity,
//               color: bColor,
//               child: Column(
//                 children: [
//                   h1,
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 2.h),
//                     child: ProjectNameTitile(
//                       lefticon: Colors.white,
//                       projectcolor: Colors.white,
//                       titlecolors: Colors.white,
//                       addbutton: const Icon(
//                         Icons.add_circle,
//                         color: Colors.white,
//                         size: 30,
//                       ),
//                       projectName: controller.argumnetData["workname"],
//                       screenTitile: controller.argumnetData["toolname"],
//                       onTap: () {
//                         if (controller.toolDetailsModel2 != null) {
//                           Get.to(() => AddToolTransfer());
//                         }
//                       },
//                     ),
//                   ),
//                   h3,
//                   Container(
//                     height: mediaquery.height * .06,
//                     // color: Colors.white,
//                     width: double.infinity,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         w1,
//                         iteams("Office", controller.argumnetData["Office"]),
//                         const VerticalDivider(
//                           endIndent: 1,
//                           indent: 10,
//                         ),
//                         iteams("Worksite", controller.argumnetData["Worksite"]),
//                         const VerticalDivider(
//                           endIndent: 1,
//                           indent: 10,
//                         ),
//                         iteams("Other Worksite",
//                             controller.argumnetData["Other Worksite"]),
//                         const VerticalDivider(
//                           endIndent: 1,
//                           indent: 10,
//                         ),
//                         iteams("Rentals", controller.argumnetData["Rentals"]),
//                         w1,
//                       ],
//                     ),
//                   ),
//                   h3,
//                 ],
//               ),
//             ),
//             h2,
//             // h1,
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 6),
//             //   child: Common2Date(
//             //     ontap: () {
//             //       controller.update();
//             //       // controller.filteringData();
//             //     },
//             //     statDate: TextEditingController(),
//             //     endDate: TextEditingController(),
//             //     startDateValue: TextEditingController(),
//             //     endDateValue: TextEditingController(),
//             //     onPressed: () {
//             //       // controller.filteringDates();
//             //       controller.update();
//             //       // controller.filteringData();
//             //       print("<-----------==---------------");
//             //     },
//             //   ),
//             // ),
//             // Padding(
//             //   padding: EdgeInsets.symmetric(horizontal: 2.h),
//             //   child: Row(
//             //     children: [
//             //       common('Owned Quantity', controller.argumnetData["quantity"]),
//             //       w2,
//             //       common('Quantity at Site',
//             //           controller.argumnetData["qunatityOnSite"]),
//             //     ],
//             //   ),
//             // ),
//             h1,
//             Container(
//               margin: EdgeInsets.symmetric(
//                 horizontal: 0.h,
//               ),
//               height: 6.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(00),
//                 // border: Border.all(color: Color(0xff46c9c9), width: 2),
//                 color: const Color.fromRGBO(234, 230, 238, 1),
//               ),
//               child: TabBar(
//                 isScrollable: true,
//                 indicatorSize: TabBarIndicatorSize.tab,
//                 labelColor: Colors.white, // Set the label color explicitly
//                 labelStyle: TextStyle(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 11.sp,
//                 ),
//                 unselectedLabelColor: Colors.black, // Color for unselected tabs
//                 unselectedLabelStyle: TextStyle(
//                   fontWeight:
//                       FontWeight.w500, // Adjust weight for unselected tabs
//                   fontSize: 11.sp,
//                 ),
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: bColor, // Background color for the selected tab
//                 ),
//                 controller: controller.tabBarcontoller,
//                 onTap: (value) {
//                   print;
//                   controller.count.value = value; // Handle tab change
//                 },
//                 tabs: const [
//                   Tab(text: 'Transfer In'),
//                   Tab(text: 'Transfer Out'),
//                   Tab(text: 'Rented In'), // Fixed capitalization consistency
//                   Tab(
//                     text: 'Rental Returns',
//                   ),
//                 ],
//               ),
//             ),
//             // listHeading(),
//             h1,
//             Expanded(
//               child: TabBarView(
//                   controller: controller.tabBarcontoller,
//                   children: const [
//                     transferInLog(),
//                     transferOutLog(),
//                     totalRentedIn(),
//                     rentreturnedLogs(),
//                   ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   iteams(title, amount) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           title,
//           style:
//               TextStyle(fontFamily: Medium, fontSize: 12, color: Colors.white),
//         ),
//         h03,
//         Text(
//           amount.toString(),
//           style:
//               TextStyle(fontFamily: Medium, fontSize: 13, color: Colors.white),
//         ),
//       ],
//     );
//   }
// }
class OwntoolInnerView extends GetView<OwntoolInnerController> {
  OwntoolInnerView({Key? key}) : super(key: key);

  @override
  OwntoolInnerController controller = Get.put(OwntoolInnerController());

  // List of tab names corresponding to the tabs
  final List<String> tabNames = [
    'Transfer In',
    'Transfer Out',
    'Rented In',
    'Rental Returns'
  ];

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;

    // Attach listener to TabController in the build method
    // controller.tabBarcontoller.addListener(() {
    //   if (!controller.tabBarcontoller.indexIsChanging) {
    //     // Get the current index and tab name
    //     controller.index.value = controller.tabBarcontoller.index;
    //     String tabName = tabNames[controller.index.value];

    //     // You can now use this tabName or index as needed
    //     print('Current Tab: $tabName, Index: ${controller.index.value}');
    //   }
    // });
    controller.indexchange();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              color: bColor,
              child: Column(
                children: [
                  h1,
                  Obx(
                    () => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: ProjectNameTitile(
                        lefticon: Colors.white,
                        projectcolor: Colors.white,
                        titlecolors: Colors.white,
                        addbutton: controller.index.value == 3
                            ? const SizedBox()
                            : const Icon(
                                Icons.add_circle,
                                color: Colors.white,
                                size: 30,
                              ),
                        projectName: controller.argumnetData["workname"],
                        screenTitile: controller.argumnetData["toolname"],
                        onTap: () {
                          if (controller.toolDetailsModel2 != null) {
                            Get.to(() => AddToolTransfer());
                          }
                        },
                      ),
                    ),
                  ),
                  h3,
                  SizedBox(
                    height: mediaquery.height * .06,
                    width: double.infinity,
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          w1,
                          // iteams("Office", controller.argumnetData["Office"]),
                          // const VerticalDivider(endIndent: 1, indent: 10),
                          // iteams("Worksite", controller.argumnetData["Worksite"]),
                          // const VerticalDivider(endIndent: 1, indent: 10),
                          // iteams("Other Worksite",
                          //     controller.argumnetData["Other Worksite"]),
                          // const VerticalDivider(endIndent: 1, indent: 10),
                          // iteams("Rentals", controller.argumnetData["Rentals"]),
                          iteams("Office", controller.officecount.value),
                          const VerticalDivider(endIndent: 1, indent: 10),
                          iteams("Worksite", controller.worksitecount.value),
                          const VerticalDivider(endIndent: 1, indent: 10),
                          iteams("Other Worksite",
                              controller.otherworksitecount.value),
                          const VerticalDivider(endIndent: 1, indent: 10),
                          iteams("Rentals", controller.rentalscount.value),
                          w1,
                        ],
                      ),
                    ),
                  ),
                  h3,
                ],
              ),
            ),
            h2,
            h1,
            Container(
              margin: EdgeInsets.symmetric(horizontal: 0.h),
              height: 6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(00),
                color: const Color.fromRGBO(234, 230, 238, 1),
              ),
              child: TabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                ),
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                ),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bColor,
                ),
                controller: controller.tabBarcontoller,
                onTap: (value) {
                  controller.count.value = value; // Handle tab change
                  String tabName = tabNames[value];
                  print('Tab selected via tap: $tabName');
                },
                tabs: const [
                  Tab(text: 'Transfer In'),
                  Tab(text: 'Transfer Out'),
                  Tab(text: 'Rented In'),
                  Tab(text: 'Rental Returns'),
                ],
              ),
            ),
            h1,
            Expanded(
              child: TabBarView(
                controller: controller.tabBarcontoller,
                children: const [
                  transferInLog(),
                  transferOutLog(),
                  totalRentedIn(),
                  rentreturnedLogs(),
                ],
              ),
            ),
          ],
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

common(String? text, String? text2) {
  return Container(
    height: 7.h,
    width: 43.w,
    decoration:
        BoxDecoration(color: bColor, borderRadius: BorderRadius.circular(7)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(text!, style: wheader5),
        Text('${text2!} nos', style: wheader5),
      ],
    ),
  );
}

// common(String? text, String? text2) {
//   return Container(
//     height: 7.h,
//     width: 43.w,
//     decoration:
//         BoxDecoration(color: bColor, borderRadius: BorderRadius.circular(7)),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Text(
//           text!,
//           style: wheader5,
//         ),
//         Text(
//           '${text2!} nos',
//           style: wheader5,
//         )
//       ],
//     ),
//   );
// }

class ToolsAdd extends StatelessWidget {
  ToolsAdd({
    super.key,
    // required this.workid, required this.workname.key,
  });
  // final String workid;
  // final String workname;
  // LabourWageslipController controller = LabourWageslipController();
  OwntoolInnerController controller = Get.put(OwntoolInnerController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 100.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(5.h))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              if (controller.toolDetailsModel2 != null) {
                Get.to(() => AddToolTransfer());
              }
            },
            child: Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: bColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/512/5571/5571608.png",
                    color: Colors.white,
                    height: 3.h,
                    width: 7.w,
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  w4,
                  Text(
                    "Add Own Tool",
                    style: wheader13,
                  ),
                ],
              )),
            ),
          ),
          h2,
          GestureDetector(
            onTap: () {
              if (controller.toolDetailsModel2 != null) {
                Get.to(() => AddToolTransfer());
              }
              // Get.back();
              // Get.to(() => AddToolTransfer(), arguments: {
              //   // "workid": workid,
              //   // "workname": workname,
              // });
            },
            child: Container(
              height: 6.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: bColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://cdn-icons-png.flaticon.com/512/1547/1547275.png",
                    color: Colors.white,
                    height: 3.h,
                    width: 7.w,
                    placeholder: (context, url) => const SizedBox(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  w4,
                  Text(
                    "Add Rent Tool",
                    style: wheader13,
                  ),
                ],
              )),
            ),
          ),
          h2,
          // GestureDetector(
          //   onTap: () {
          //     Get.back();

          //     // Get.to(() => Addwage(), arguments: {
          //     //   "workid": workid,
          //     //   "workname": workname,
          //     // });
          //     Get.to(() {
          //       return const GroupWage();
          //     });
          //   },
          //   child: Container(
          //     height: 6.h,
          //     width: 90.w,
          //     decoration: BoxDecoration(
          //         color: bColor, borderRadius: BorderRadius.circular(10)),
          //     child: Center(
          //         child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         CachedNetworkImage(
          //           imageUrl:
          //               "https://cdn-icons-png.flaticon.com/512/1547/1547275.png",
          //           color: Colors.white,
          //           height: 3.h,
          //           width: 7.w,
          //           placeholder: (context, url) => const SizedBox(),
          //           errorWidget: (context, url, error) =>
          //               const Icon(Icons.error),
          //         ),
          //         w4,
          //         Text(
          //           "Group Wage Slip",
          //           style: wheader13,
          //         ),
          //       ],
          //     )),
          //   ),
          // ),
        ],
      ),
    );
  }
}
