import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:banwet/app/modules/daily_note/controllers/daily_note_controller.dart';
import 'package:banwet/app/modules/labour_payment/controllers/labour_payment_controller.dart';
import 'package:banwet/app/modules/office_expense/controllers/office_expense_controller.dart';
import 'package:banwet/app/modules/travel_expense/controllers/travel_expense_controller.dart';

import '../../daily_note/views/daily_note_view.dart';
import '../../home/views/home_view.dart';
import '../../labour_payment/views/labour_payment_view.dart';
import '../../office_expense/views/office_expense_view.dart';
import '../../travel_expense/views/travel_expense_view.dart';
import 'package:intl/src/intl/date_format.dart';

class HomeLayoutController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController idleAnimation;
  late AnimationController onSelectedAnimation;
  late AnimationController onChangedAnimation;

  RxInt tapSelectIndex = 2.obs;
  OfficeExpenseController controller0 = Get.put(OfficeExpenseController());
  TravelExpenseController controller1 = Get.put(TravelExpenseController());
  DailyNoteController controller3 = Get.put(DailyNoteController());
  LabourPaymentController controller4 = Get.put(LabourPaymentController());
  Future<void> pagesdateclear() async {
    controller4.startDateController = controller4.endDateController = controller3
        .startDateController = controller3.endDateController = controller1
            .startDateController =
        controller1.endDateController = controller0.endDateController =
            controller0.startDateController = TextEditingController(
                text: DateFormat("yyyy-MM-dd").parse(DateTime.now().toString()).toString());

    controller0.change();
    controller0.filteringData();
    controller0.dateformats();

    controller1.change();
    controller1.filteringData();

    controller3.change();
    controller3.filteringData();

    controller4.change();
    controller4.filteringData();

    controller0.filteringData();
    controller0.dateformats();
    controller0.update();

    controller1.filteringData();
    controller1.update();

    controller3.filteringData();
    controller3.update();

    controller4.filteringData();
    controller4.update();
  }

  final screens = [
    OfficeExpenseView(),
    TravelExpenseView(),
    HomeView(),
    DailyNoteView(),
    LabourPaymentView()
    // Get.offAllNamed(Routes.HOME_LAYOUT),
    // Get.offAllNamed(Routes.HOME_LAYOUT),
    // Get.offAllNamed(Routes.HOME_LAYOUT),
    // Get.offAllNamed(Routes.HOME_LAYOUT),
    // Get.offAllNamed(Routes.HOME_LAYOUT),
  ].obs;
  Duration animationDuration = const Duration(milliseconds: 500);

  @override
  void onInit() {
    super.onInit();
    // NotificationController().getNotifications();
    idleAnimation = AnimationController(vsync: this);
    onSelectedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
    onChangedAnimation =
        AnimationController(vsync: this, duration: animationDuration);
  }

  @override
  void onClose() {
    idleAnimation.dispose();
    onSelectedAnimation.dispose();
    onChangedAnimation.dispose();
    super.onClose();
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:banwet/app/modules/daily_note/controllers/daily_note_controller.dart';
// import 'package:banwet/app/modules/labour_payment/controllers/labour_payment_controller.dart';
// import 'package:banwet/app/modules/office_expense/controllers/office_expense_controller.dart';
// import 'package:banwet/app/modules/travel_expense/controllers/travel_expense_controller.dart';
// import '../../daily_note/views/daily_note_view.dart';
// import '../../home/views/home_view.dart';
// import '../../labour_payment/views/labour_payment_view.dart';
// import '../../office_expense/views/office_expense_view.dart';
// import '../../travel_expense/views/travel_expense_view.dart';

// class HomeLayoutController extends GetxController
//     with GetTickerProviderStateMixin {
//   // late AnimationController idleAnimation;
//   // late AnimationController onSelectedAnimation;
//   // late AnimationController onChangedAnimation;

//   RxInt tapSelectIndex = 2.obs;
//   final screens = [
//     OfficeExpenseView(),
//     TravelExpenseView(),
//     HomeView(),
//     DailyNoteView(),
//     LabourPaymentView(),
//   ].obs;

//   Duration animationDuration = const Duration(milliseconds: 500);

//   OfficeExpenseController controller0 = Get.put(OfficeExpenseController());
//   TravelExpenseController controller1 = Get.put(TravelExpenseController());
//   DailyNoteController controller3 = Get.put(DailyNoteController());
//   LabourPaymentController controller4 = Get.put(LabourPaymentController());

//   Future<void> pagesdateclear() async {
//     String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

//     controller0.startDateController.text = currentDate;
//     controller0.endDateController.text = currentDate;
//     controller1.startDateController.text = currentDate;
//     controller1.endDateController.text = currentDate;
//     controller3.startDateController.text = currentDate;
//     controller3.endDateController.text = currentDate;
//     controller4.startDateController.text = currentDate;
//     controller4.endDateController.text = currentDate;

//     controller0.filteringData();
//     controller1.filteringData();
//     controller3.filteringData();
//     controller4.filteringData();

//     controller0.update();
//     controller1.update();
//     controller3.update();
//     controller4.update();
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     // idleAnimation = AnimationController(vsync: this);
//     // onSelectedAnimation =
//     //     AnimationController(vsync: this, duration: animationDuration);
//     // onChangedAnimation =
//     //     AnimationController(vsync: this, duration: animationDuration);
//   }

//   @override
//   void onClose() {
//     // idleAnimation.dispose();
//     // onSelectedAnimation.dispose();
//     // onChangedAnimation.dispose();
//     super.onClose();
//   }
// }
// class HomeLayoutController extends GetxController
//     with GetTickerProviderStateMixin {
//   late AnimationController homeLottieAnimation;

//   RxInt tapSelectIndex = 2.obs;

//   final screens = [
//     OfficeExpenseView(),
//     TravelExpenseView(),
//     HomeView(),
//     DailyNoteView(),
//     LabourPaymentView(),
//   ].obs;

//   Duration animationDuration = const Duration(milliseconds: 500);

//   OfficeExpenseController controller0 = Get.put(OfficeExpenseController());
//   TravelExpenseController controller1 = Get.put(TravelExpenseController());
//   DailyNoteController controller3 = Get.put(DailyNoteController());
//   LabourPaymentController controller4 = Get.put(LabourPaymentController());

//   Future<void> pagesdateclear() async {
//     String currentDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

//     controller0.startDateController.text = currentDate;
//     controller0.endDateController.text = currentDate;
//     controller1.startDateController.text = currentDate;
//     controller1.endDateController.text = currentDate;
//     controller3.startDateController.text = currentDate;
//     controller3.endDateController.text = currentDate;
//     controller4.startDateController.text = currentDate;
//     controller4.endDateController.text = currentDate;

//     controller0.filteringData();
//     controller1.filteringData();
//     controller3.filteringData();
//     controller4.filteringData();

//     controller0.update();
//     controller1.update();
//     controller3.update();
//     controller4.update();
//   }

//   @override
//   void onInit() {
//     super.onInit();

//     // Initialize Lottie animation controller
//     homeLottieAnimation = AnimationController(
//       vsync: this,
//       duration: const Duration(
//           seconds: 1), // Adjust based on your Lottie animation duration
//     );
//   }

//   // Call this when you need to trigger the Lottie animation
//   void triggerLottieAnimation() {
//     homeLottieAnimation.reset();
//     homeLottieAnimation.forward();
//   }

//   @override
//   void onClose() {
//     homeLottieAnimation.dispose();
//     super.onClose();
//   }
// }
