import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/loading.dart';
import '../controllers/projectdetailed_controller.dart';

// ignore: must_be_immutable
class ProjectdetailedView extends GetView<ProjectdetailedController> {
  ProjectdetailedView({Key? key}) : super(key: key);

  @override
  ProjectdetailedController controller = Get.put(ProjectdetailedController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: bColor2),
          backgroundColor: bColor,
          surfaceTintColor: bColor,
          title: Text(
            controller.arugumentData["workname"],
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<ProjectdetailedController>(
          builder: (controller) {
            if (controller.projectIcons == null) {
              return Center(child: loadingthreebounce);
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    // height10,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.black12,
                        child: GridView.count(
                            childAspectRatio: .9999999999999999999,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            // physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            children: List.generate(
                                controller.projectIcons!.data!.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.routing(controller
                                      .projectIcons!
                                      .data![index]
                                      .iconName!
                                      .removeAllWhitespace
                                      .toUpperCase());
                                  print(controller.projectIcons!.data![index]
                                      .iconTitle!.removeAllWhitespace
                                      .toUpperCase());
                                },
                                child: Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 91,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // color:
                                          //     const Color.fromRGBO(22, 22, 97, 1)
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/images/${controller.projectIcons!.data![index].iconName!.removeAllWhitespace}.png',
                                            height: 40,
                                            width: 40,
                                            color: const Color.fromARGB(
                                                255, 0, 106, 151),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   height: 7,
                                      // ),
                                      Center(
                                        child: Text(
                                          textAlign: TextAlign.center,
                                          controller.projectIcons!.data![index]
                                              .iconName!
                                              .trim()
                                              .toString(),
                                          style: TextStyle(
                                              // fontWeight: FontWeight.w500,
                                              fontFamily: Medium,
                                              fontSize: 8.5.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                      // Divider(thickness: 1,color: Colors.black12,)
                                    ],
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// import '../../../../Style/const.dart';
// import '../../../../common_widegt/loading.dart';
// import '../controllers/projectdetailed_controller.dart';

// // ignore: must_be_immutable
// class ProjectdetailedView extends GetView<ProjectdetailedController> {
//   ProjectdetailedView({Key? key}) : super(key: key);

//   @override
//   ProjectdetailedController controller = Get.put(ProjectdetailedController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: bColor2),
//         backgroundColor: bColor,
//         surfaceTintColor: bColor,
//         title: Text(
//           controller.arugumentData["workname"],
//           style: const TextStyle(color: Colors.white, fontSize: 15),
//         ),
//         centerTitle: true,
//       ),
//       body: GetBuilder<ProjectdetailedController>(
//         builder: (controller) {
//           if (controller.projectIcons == null) {
//             return Center(child: loadingthreebounce);
//           } else {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GridView.builder(
//                 itemCount: controller.projectIcons!.data!.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   crossAxisSpacing: 0,
//                   mainAxisSpacing: 0,
//                   childAspectRatio: 1,
//                 ),
//                 itemBuilder: (context, index) {
//                   return Stack(
//                     children: [
//                       // Grid item
//                       Container(
//                         color: Colors.white,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: 80,
//                               width: 91,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Center(
//                                 child: Image.asset(
//                                   'assets/images/${controller.projectIcons!.data![index].iconName!.removeAllWhitespace}.png',
//                                   height: 70,
//                                   width: 40,
//                                   color: const Color.fromARGB(255, 0, 106, 151),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               textAlign: TextAlign.center,
//                               controller.projectIcons!.data![index]
//                                   .iconName!
//                                   .trim()
//                                   .toString(),
//                               style: TextStyle(
//                                 fontFamily: Medium,
//                                 fontSize: 8.5.sp,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       // Vertical divider
//                       if ((index + 1) % 3 != 0)
//                         Positioned(
//                           right: 0,
//                           top: 0,
//                           bottom: 0,
//                           child: Container(
//                             width: 1,
//                             color: Colors.black26,
//                           ),
//                         ),
//                       // Horizontal divider
//                       if (index < (controller.projectIcons!.data!.length + 3))
//                         Positioned(
//                           left: 0,
//                           right: 0,
//                           bottom: 0,
//                           child: Container(
//                             height: 1,
//                             color: Colors.black26,
//                           ),
//                         ),
//                     ],
//                   );
//                 },
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
