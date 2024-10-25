import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
// import 'package:banwet/app/modules/office_expense/views/office_expense_view.dart';

import '../../../Style/const.dart';
import '../controllers/home_layout_controller.dart';

class HomeLayoutView extends GetView<HomeLayoutController> {
  var previousIndex;

  HomeLayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    dHeight = MediaQuery.of(context).size.height;
    dWidth = MediaQuery.of(context).size.width;

    return Container(
      color: bColor,
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
            body: Obx(
              () => IndexedStack(
                index: controller.tapSelectIndex.value,
                children: controller.screens,
              ),
            ),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                unselectedIconTheme: const IconThemeData(color: Colors.grey),
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.red,
                currentIndex: controller.tapSelectIndex.value,
                selectedFontSize: 3.sp,
                onTap: (index) async {
                  await controller.pagesdateclear();
                  controller.onSelectedAnimation.reset();
                  controller.onSelectedAnimation.forward();
                  controller.onChangedAnimation.value = 1;

                  previousIndex = controller.tapSelectIndex.value;

                  controller.tapSelectIndex.value = index;
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          size: 20.sp,
                          color: controller.tapSelectIndex.value == 0
                              ? bColor
                              : Colors.grey,

                          //     height: 40,
                          // width: 80,
                          //  controller: controller.tapSelectIndex == 1
                          //      ? onSelectedAnimation
                          //      : previousIndex == 1
                          //      ? onChangedAnimation
                          //      : idleAnimation),
                        ),
                        height3,
                        Text(
                          'Office Expense',
                          style: header5.copyWith(fontSize: 6.5.sp),
                        )
                      ],
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Icon(
                          Icons.card_travel_outlined,
                          size: 20.sp,
                          color: controller.tapSelectIndex.value == 1
                              ? bColor
                              : Colors.grey,
                        ),
                        height3,
                        Text(
                          'Travel Expense',
                          style: header5.copyWith(fontSize: 6.5.sp),
                        )
                      ],
                    ),
                    label: "Travel Expense",
                  ),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        controller.tapSelectIndex.value == 2
                            ? Lottie.asset(
                                "assets/images/nYiHABjQ3r.json",
                                height: 4.h,
                                controller: controller.tapSelectIndex.value == 2
                                    ? controller.onSelectedAnimation
                                    : previousIndex == 2
                                        ? controller.onChangedAnimation
                                        : controller.idleAnimation,
                              )
                            : Lottie.asset(
                                "assets/images/nYiHABjQ3r.json",
                                height: 4.h,
                                controller: controller.tapSelectIndex.value == 2
                                    ? controller.onSelectedAnimation
                                    : previousIndex == 2
                                        ? controller.onChangedAnimation
                                        : controller.idleAnimation,
                              ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          'Home',
                          style: header5.copyWith(
                            fontSize: 7.sp,
                          ),
                        )
                      ],
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                      icon: Column(
                        children: [
                          Icon(
                            Icons.event_note,
                            size: 20.sp,
                            color: controller.tapSelectIndex.value == 3
                                ? bColor
                                : Colors.grey,
                          ),
                          height3,
                          Text(
                            'Daily Note',
                            style: header5.copyWith(fontSize: 6.5.sp),
                          )
                        ],
                      ),
                      label: "",
                      backgroundColor: Colors.red),
                  BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: 20.sp,
                          color: controller.tapSelectIndex.value == 4
                              ? bColor
                              : Colors.grey,
                        ),
                        height3,
                        Text(
                          'Labour Payment',
                          style: header5.copyWith(fontSize: 6.5.sp),
                        )
                      ],
                    ),
                    label: "Labour Payment",
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
// class HomeLayoutView extends GetView<HomeLayoutController> {
//   @override
//   Widget build(BuildContext context) {
//     var previousIndex;
//     double dHeight = MediaQuery.of(context).size.height;
//     double dWidth = MediaQuery.of(context).size.width;

//     return Container(
//       color: bColor,
//       child: SafeArea(
//         left: false,
//         right: false,
//         bottom: false,
//         child: Scaffold(
//           body: Obx(() {
//             return IndexedStack(
//               index: controller.tapSelectIndex.value,
//               children: controller.screens,
//             );
//           }),
//           bottomNavigationBar: Obx(
//             () => BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               unselectedIconTheme: const IconThemeData(color: Colors.grey),
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               backgroundColor: Colors.white,
//               selectedItemColor: Colors.black,
//               unselectedItemColor: Colors.red,
//               currentIndex: controller.tapSelectIndex.value,
//               selectedFontSize: 12, // Adjust the font size as needed
//               onTap: (index) {
//                 controller.onSelectedAnimation.reset();
//                 controller.onSelectedAnimation.forward();
//                 controller.onChangedAnimation.value = 1;
//                 previousIndex = controller.tapSelectIndex.value;

//                 if (previousIndex == index) {
//                   controller.refreshScreen(index);
//                 } else {
//                   controller.tapSelectIndex.value = index;
//                 }
//               },
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Icon(
//                         Icons.account_balance_wallet,
//                         size: 20.sp,
//                         color: controller.tapSelectIndex.value == 0
//                             ? bColor
//                             : Colors.grey,
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         'Office Expense',
//                         style: header5.copyWith(fontSize: 6.5.sp),
//                       ),
//                     ],
//                   ),
//                   label: "",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Icon(
//                         Icons.card_travel_outlined,
//                         size: 20.sp,
//                         color: controller.tapSelectIndex.value == 1
//                             ? bColor
//                             : Colors.grey,
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         'Travel Expense',
//                         style: header5.copyWith(fontSize: 6.5.sp),
//                       ),
//                     ],
//                   ),
//                   label: "Travel Expense",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Lottie.asset(
//                         "assets/images/nYiHABjQ3r.json",
//                         height: 4.h,
//                         controller: controller.tapSelectIndex.value == 2
//                             ? controller.onSelectedAnimation
//                             : previousIndex == 2
//                                 ? controller.onChangedAnimation
//                                 : controller.idleAnimation,
//                       ),
//                       SizedBox(height: 1),
//                       Text(
//                         'Home',
//                         style: header5.copyWith(fontSize: 7.sp),
//                       ),
//                     ],
//                   ),
//                   label: "",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Icon(
//                         Icons.event_note,
//                         size: 20.sp,
//                         color: controller.tapSelectIndex.value == 3
//                             ? bColor
//                             : Colors.grey,
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         'Daily Note',
//                         style: header5.copyWith(fontSize: 6.5.sp),
//                       ),
//                     ],
//                   ),
//                   label: "",
//                   backgroundColor: Colors.red,
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Column(
//                     children: [
//                       Icon(
//                         Icons.person,
//                         size: 20.sp,
//                         color: controller.tapSelectIndex.value == 4
//                             ? bColor
//                             : Colors.grey,
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         'Labour Payment',
//                         style: header5.copyWith(fontSize: 6.5.sp),
//                       ),
//                     ],
//                   ),
//                   label: "Labour Payment",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
