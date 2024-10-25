import 'package:get/get.dart';
import 'package:banwet/app/modules/stock/model/stocklistiteaams.dart';

import '../../../../common_widegt/launch_soon.dart';
import '../../../../data/model/project_icon_model.dart/project_icon.dart';
import '../../../../data/service/project_icon/getprojecticon.dart';
import '../../../../routes/app_pages.dart';
import '../../labour/labour_homeview.dart';
import '../../meterial_purchas/materialpurchase_home.dart';
import '../../tools/tools_home.dart';

class ProjectdetailedController extends GetxController {
  var arugumentData = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    getDetails();
  }

  //< ---- this function using  get icons and names move ---->

  ProjectIconss? projectIcons;
  getDetails() async {
    var result = await GetProjectIconService().getDashIcons();
    projectIcons = result;
    update();
  }

  //< ---- this function using  routing which page to move ---->
  routing(String values) {
    switch (values) {
      case "CLIENTPAYMENT":
        // Get.toNamed(Routes.CLIENT_PAYMENT, arguments: {
        //   "workid": arugumentData["workid"],
        //   "workname": arugumentData["workname"]
        // });
        Get.to(() => const LaunchSoon());
        break;
      case "PROJECTTASK":
        // Get.to(() => const LaunchSoon());
        Get.toNamed(Routes.project_task, arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "DAILYNOTE":
        Get.toNamed(Routes.PROJECT_DAILY_NOTE, arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "DAILYTASK":
        Get.toNamed(Routes.DAILYTASK, arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"],
        });
        // print(
        //     "${arugumentData["workid"]}");
        // DailytaskController().getDetail();
        break;
      case "EXPENSE":
        Get.toNamed(Routes.PROJECT_EXPENSE, arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "PURCHASE":
        Get.to(() => MaterialPurchaseHome(), arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "SUBCONTRACT":
        Get.toNamed(Routes.SUBCONTRACT, arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "STOCK":
        Get.to(() => const Stockiteams(), arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "DAILYCONSUMPTION":
        Get.to(() => const LaunchSoon());
        break;
      case "STOCKREPORT":
        Get.to(() => const LaunchSoon());
        break;
      case "LABOUR":
        Get.to(() => LabourHome(), arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "PROGRESSREPORT":
        Get.to(() => const LaunchSoon());
        break;
      case "TOOLS":
        // Get.to(() => const LaunchSoon());
        Get.to(() => ToolsHome(), arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "DOCUMENTS":
        Get.toNamed(Routes.Documents_project, arguments: {
          "workid": arugumentData["workid"],
          "workname": arugumentData["workname"]
        });
        break;
      case "HR":
        Get.to(() => const LaunchSoon());
        break;
      default:
        print("${values}mkkk");
        Get.to(() => const LaunchSoon());
        break;
    }
  }

  // List grids = [
  //   ['assets/images/clarity_coin-bag-lineClient.png', 'CLIENT PAYMENT', "/soon"],
  //   ['assets/images/mdi_report-lineProject Task.png', 'PROJECT TASK', "/soon"],
  //   ['assets/images/clarity_coin-bag-lineClient.png', 'DAILY NOTE', "/pDailyNote"],
  //   ['assets/images/clarity_coin-bag-lineClient.png', 'DAILY TASK', "/soon"],
  //   ['assets/images/T5.png', 'PURCHASE', '/purchase'],
  //   ['assets/images/T6.png', 'EXPENSE', "/expenseHome"],
  //   ['assets/images/T7.png', 'SUBCONTRACT', "/SubContractHome"],
  //   ['assets/images/T11.png', 'STOCK TRANSFER', "/soon"],
  //   ['assets/images/T8.png', 'DAILY CONSUMPTION', "/soon"],
  //   ['assets/images/T14.png', 'STOCK REPORT', "/soon"],
  //   ['assets/images/T10.png', 'LABOUR', '/labourHome'],
  //   ['assets/images/T15.png', 'PROGRESS REPORT', "/soon"],
  //   ['assets/images/T12.png', 'TOOLS', "/ToolList"],
  //   ['assets/images/T13.png', 'DOCUMENTS', "/soon"],
  //   ['assets/images/T16.png', 'HR', "/soon"],
  //   // ['assets/images/T15.png',  "/accepted"],
  // ];
  // static const String CLIENTPAYMENT =
  //     'assets/images/clarity_coin-bag-lineClient.png';
  // static const String PROJECTTASK =
  //     'assets/images/mdi_report-lineProject Task.png';
  // static const String DAILYNOTE = 'assets/images/T3.png';
  // static const String DAILYTASK = 'assets/images/T4.png';
  // static const String PURCHASE = 'assets/images/T5.png';
  // static const String EXPENSE = 'assets/images/T6.png';
  // static const String SUBCONTRACT = 'assets/images/T7.png';
  // static const String STOCKTRANSFER = 'assets/images/T11.png';
  // static const String DAILYCONSUMPTION = 'assets/images/T8.png';
  // static const String STOCKREPORT = 'assets/images/T14.png';
  // static const String LABOUR = 'assets/images/T10.png';
  // static const String PROGRESSREPORT = 'assets/images/T15.png';
  // static const String TOOLS = 'assets/images/T12.png';
  // static const String DOCUMENTS = 'assets/images/T13.png';
  // static const String HR = 'assets/images/T16.png';
}
