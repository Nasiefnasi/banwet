import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/data/model/notification.model/notification_model.dart';
import 'package:banwet/app/data/service/notification.service/otification.service.dart';
import 'package:banwet/app/modules/notification/controllers/notification_controller.dart';

import '../../../data/model/ProjectModel/project_assign.dart';
import '../../../data/model/cash_model.dart';
import '../../../data/model/user/use_home.dart';
import '../../../data/service/assigend_project/get_assigned_project.dart';
import '../../../data/service/auth/getuserdata.dart';
import '../../../data/service/cash/cash_service.dart';

// import 'package:smartbuild/app/modules/projectmodules/project_view/controllers/project_view_controller.dart';

class HomeController extends GetxController {
  RxString projectCount = "".obs;
  AssignProjectModel? assignProjectModel;
  //  get data from api (assigend peoject);
  // NotificationController notificationscontroller =
  //     Get.find<NotificationController>();
  getDetails() async {
    var result = await AssignedProject().getAssignedProject();
    assignProjectModel = result;
    projectCount.value = assignProjectModel!.data!.length.toString();
    update();
  }

  var cashModel = CashModel().obs;

  getcashDetails() async {
    var result = await CashService().getPayemntDatails();
    cashModel.value = result;
    update();
  }

  var notifir = NotificationModel().obs;
  GetNotifiers() async {
    var results = await NotificationService().getNotification();
    // notifir.value = results.;
  }

  var storage = GetStorage();
  var userdetails = UserHomeModel().obs;
  Future<void> getOnGoing() async {
    var result = await GetUserdata().fetchOnGoing();

    userdetails.value = result;
    update();
    storage.write('late', userdetails.value.signedInRemarks);
    log(userdetails.value.signedInRemarks.toString());
  }

  @override
  void onInit() {
    super.onInit();
    NotificationController().getNotifications();
    getOnGoing();
    getDetails();
    getcashDetails();
    GetNotifiers();
  }
}
