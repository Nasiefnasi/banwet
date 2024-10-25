import 'package:banwet/app/modules/Salesquotation/binding/saleQuotation_binding.dart';
import 'package:banwet/app/modules/Salesquotation/view/salesquotation.dart';
import 'package:get/get.dart';
import 'package:banwet/app/modules/Dailytaskdetails/bindings/dailytast_binding.dart';
import 'package:banwet/app/modules/daily_note/views/homepageside_Task/taskpage.dart';
import 'package:banwet/app/modules/documents/bindings/document_binding.dart';
import 'package:banwet/app/modules/documents/views/documents.dart';
// import 'package:banwet/app/modules/office_expense/bindings/office_expense_binding.dart';
// import 'package:banwet/app/modules/office_expense/views/office_expense_view.dart';
// import 'package:banwet/app/modules/project_modules/dailytask/controllers/dailytask_controller.dart';
import 'package:banwet/app/modules/project_modules/tools/toolTransfer/bindings/renttool_binding.dart';
import 'package:banwet/app/modules/project_modules/tools/toolconsumption/views/toolconsumption.dart';
import 'package:banwet/app/modules/projecttask/binding/project_task.dart';
import 'package:banwet/app/modules/projecttask/view/peojecttask.dart';
import 'package:banwet/app/modules/stock/controllers/stockbuild.dart';
import 'package:banwet/app/modules/stock/model/Stockconsumption/stockconsumptionlist.dart';
import 'package:banwet/app/modules/stock/model/Stockreport/stockreport.dart';
import 'package:banwet/app/modules/stock/model/stocktransfer/stocktransfer.dart';

import '../modules/cash/bindings/cash_binding.dart';
import '../modules/cash/views/cash_view.dart';
import '../modules/daily_note/bindings/daily_note_binding.dart';
import '../modules/daily_note/views/daily_note_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_layout/bindings/home_layout_binding.dart';
import '../modules/home_layout/views/home_layout_view.dart';
import '../modules/labour_payment/bindings/labour_payment_binding.dart';
import '../modules/labour_payment/views/labour_payment_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/project_modules/client_payment/bindings/client_payment_binding.dart';
import '../modules/project_modules/client_payment/views/client_payment_view.dart';
import '../modules/project_modules/dailytask/bindings/dailytask_binding.dart';
import '../modules/project_modules/dailytask/views/dailytask_view.dart';
import '../modules/project_modules/labour/labour_activity/bindings/labour_activity_binding.dart';
import '../modules/project_modules/labour/labour_activity/views/labour_activity_view.dart';
import '../modules/project_modules/labour/labour_list/bindings/labour_list_binding.dart';
import '../modules/project_modules/labour/labour_list/views/labour_list_view.dart';
import '../modules/project_modules/labour/labour_wageslip/bindings/labour_wageslip_binding.dart';
import '../modules/project_modules/labour/labour_wageslip/views/labour_wageslip_view.dart';
import '../modules/project_modules/meterial_purchas/purchase_bill/bindings/purchase_bill_binding.dart';
import '../modules/project_modules/meterial_purchas/purchase_bill/views/purchase_bill_view.dart';
import '../modules/project_modules/meterial_purchas/purchase_order/bindings/purchase_order_binding.dart';
import '../modules/project_modules/meterial_purchas/purchase_order/views/purchase_order_view.dart';
import '../modules/project_modules/meterial_purchas/purchase_request/bindings/purchase_request_binding.dart';
import '../modules/project_modules/meterial_purchas/purchase_request/views/purchase_request_view.dart';
import '../modules/project_modules/project_daily_note/bindings/project_daily_note_binding.dart';
import '../modules/project_modules/project_daily_note/views/project_daily_note_view.dart';
import '../modules/project_modules/project_expense/bindings/project_expense_binding.dart';
import '../modules/project_modules/project_expense/views/project_expense_view.dart';
import '../modules/project_modules/project_view/bindings/project_view_binding.dart';
import '../modules/project_modules/project_view/views/project_view_view.dart';
import '../modules/project_modules/projectdetailed/bindings/projectdetailed_binding.dart';
import '../modules/project_modules/projectdetailed/views/projectdetailed_view.dart';
import '../modules/project_modules/subcontract/bindings/subcontract_binding.dart';
import '../modules/project_modules/subcontract/submodule/subcontract.activity/bindings/activity_binding.dart';
import '../modules/project_modules/subcontract/submodule/subcontract.activity/views/activity_view.dart';
import '../modules/project_modules/subcontract/submodule/subcontract.payment/bindings/payment_binding.dart';
import '../modules/project_modules/subcontract/submodule/subcontract.payment/views/payment_view.dart';
import '../modules/project_modules/subcontract/submodule/subcontract_bill/bindings/subcontract_bill_binding.dart';
import '../modules/project_modules/subcontract/submodule/subcontract_bill/views/subcontract_bill_view.dart';
import '../modules/project_modules/subcontract/views/subcontract_view.dart';
import '../modules/project_modules/tools/own_tools/bindings/own_tools_binding.dart';
import '../modules/project_modules/tools/own_tools/views/own_tools_view.dart';
import '../modules/project_modules/tools/owntool_inner/bindings/owntool_inner_binding.dart';
import '../modules/project_modules/tools/owntool_inner/views/owntool_inner_view.dart';
// import '../modules/project_modules/tools/renttool/bindings/renttool_binding.dart';
import '../modules/project_modules/tools/toolTransfer/views/tooltransfer.dart';
import '../modules/project_modules/tools/renttool_inner/bindings/renttool_inner_binding.dart';
import '../modules/project_modules/tools/renttool_inner/views/renttool_inner_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash_login&panching/attendance_marking/bindings/attendance_marking_binding.dart';
import '../modules/splash_login&panching/attendance_marking/views/attendance_marking_view.dart';
import '../modules/splash_login&panching/company_login/bindings/company_login_binding.dart';
import '../modules/splash_login&panching/company_login/views/company_login_view.dart';
import '../modules/splash_login&panching/splash/bindings/splash_binding.dart';
import '../modules/splash_login&panching/splash/views/splash_view.dart';
import '../modules/splash_login&panching/staff_login/bindings/staff_login_binding.dart';
import '../modules/splash_login&panching/staff_login/views/staff_login_view.dart';
import '../modules/splash_login&panching/welcome/bindings/welcome_binding.dart';
import '../modules/splash_login&panching/welcome/views/welcome_view.dart';
import '../modules/travel_expense/bindings/travel_expense_binding.dart';
import '../modules/travel_expense/views/travel_expense_view.dart';

part 'app_routes.dart';

class AppPages {
  var argumentData = Get.arguments ?? {};
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.COMPANY_LOGIN,
      page: () => CompanyLoginView(),
      binding: CompanyLoginBinding(),
    ),
    GetPage(
      name: _Paths.STAFF_LOGIN,
      page: () => StaffLoginView(),
      binding: StaffLoginBinding(),
    ),
    GetPage(
      transition: Transition.upToDown,
      name: _Paths.ATTENDANCE_MARKING,
      page: () => AttendanceMarkingView(),
      binding: AttendanceMarkingBinding(),
    ),
    GetPage(
      name: _Paths.HOME_LAYOUT,
      page: () => HomeLayoutView(),
      binding: HomeLayoutBinding(),
    ),
    GetPage(
      name: _Paths.TRAVEL_EXPENSE,
      page: () => TravelExpenseView(),
      binding: TravelExpenseBinding(),
    ),
    GetPage(
      name: _Paths.LABOUR_PAYMENT,
      page: () => LabourPaymentView(),
      binding: LabourPaymentBinding(),
    ),
    GetPage(
      name: _Paths.DAILY_NOTE,
      page: () => DailyNoteView(),
      binding: DailyNoteBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_VIEW,
      page: () => const ProjectViewView(),
      binding: ProjectViewBinding(),
    ),
    GetPage(
      name: _Paths.PROJECTDETAILED,
      page: () => ProjectdetailedView(),
      binding: ProjectdetailedBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DAILY_NOTE,
      page: () => ProjectDailyNoteView(),
      binding: ProjectDailyNoteBinding(),
    ),
    GetPage(
      name: _Paths.SUBCONTRACT,
      page: () => const SubcontractView(),
      binding: SubcontractBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      transition: Transition.leftToRight,
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_EXPENSE,
      page: () => ProjectExpenseView(),
      binding: ProjectExpenseBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_REQUEST,
      page: () => PurchaseRequestView(),
      binding: PurchaseRequestBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_ORDER,
      page: () => PurchaseOrderView(),
      binding: PurchaseOrderBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASE_BILL,
      page: () => PurchaseBillView(),
      binding: PurchaseBillBinding(),
    ),
    GetPage(
      name: _Paths.OWN_TOOLS,
      page: () => OwnToolsView(),
      binding: OwnToolsBinding(),
    ),
    GetPage(
      name: _Paths.LABOUR_LIST,
      page: () => const LabourListView(),
      binding: LabourListBinding(),
    ),
    GetPage(
      name: _Paths.ACTIVITY,
      page: () => ActivityView(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.SUBCONTRACT_BILL,
      page: () => SubcontractBillView(),
      binding: SubcontractBillBinding(),
    ),
    GetPage(
      name: _Paths.LABOUR_ACTIVITY,
      page: () => LabourActivityView(),
      binding: LabourActivityBinding(),
    ),
    GetPage(
      name: _Paths.LABOUR_WAGESLIP,
      page: () => LabourWageslipView(),
      binding: LabourWageslipBinding(),
    ),
    GetPage(
        name: _Paths.RENTTOOL,
        page: () => RenttoolView(),
        binding: RenttoolBinding()
        // RenttoolBinding(),
        ),
    GetPage(
      name: _Paths.OWNTOOL_INNER,
      page: () => OwntoolInnerView(),
      binding: OwntoolInnerBinding(),
    ),
    GetPage(
      name: _Paths.RENTTOOL_INNER,
      page: () => const RenttoolInnerView(),
      binding: RenttoolInnerBinding(),
    ),
    GetPage(
      name: _Paths.CASH,
      page: () => const CashView(),
      binding: CashBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.DAILYTASK,
      page: () => DailytaskView(),
      binding: DailytaskBindings(),
    ),
    GetPage(
      name: _Paths.CLIENT_PAYMENT,
      page: () => const ClientPaymentView(),
      binding: ClientPaymentBinding(),
    ),
    GetPage(
      name: _Paths.STOCK_TRANSFER,
      page: () => StockTransfer(),
      binding: StockBinding(),
    ),
    GetPage(
      name: _Paths.Stock_Consumption,
      page: () => StockConsumptionList(),
      binding: StockBinding(),
    ),
    GetPage(
      name: _Paths.Stock_Report0,
      page: () => const StockReport(
        pageshowindex: 0,
      ),
      binding: StockBinding(),
    ),
    GetPage(
      name: _Paths.Stock_Report1,
      page: () => const StockReport(
        pageshowindex: 1,
      ),
      binding: StockBinding(),
    ),
    GetPage(
      name: _Paths.My_Activity,
      page: () => const StockReport(
        pageshowindex: 1,
      ),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: _Paths.TOOLSConsumption,
      page: () => const ToolConsumption(),
      binding: null,
    ),
    GetPage(
      name: _Paths.project_task,
      page: () => const Peojecttask(),
      binding: ProjectTaskBinding(),
    ),
    GetPage(
      name: _Paths.Homepagedailytask,
      page: () => const HomeTask(),
      binding: DailytaskBinding(),
    ),
    GetPage(
      name: _Paths.Documents_project,
      page: () => const DocumentsPage(),
      binding: DocumentBinding(),
    ),
    GetPage(
      name: _Paths.salequotation,
      page: () => const Salesquotation(),
      binding: SalesQuotationBinding(),
    ),
    // GetPage(
    //   name: _Paths.HomeView,
    //   page: () => HomeView(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DailyNoteView,
    //   page: () => DailyNoteView(),
    //   binding: DailyNoteBinding(),
    // ),
    // GetPage(
    //   name: _Paths.LabourPaymentView,
    //   page: () => LabourPaymentView(),
    //   binding: LabourPaymentBinding(),
    // ),
  ];
}
