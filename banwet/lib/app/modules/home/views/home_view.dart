// ignore_for_file: deprecated_member_use, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/activity/view/myactitty.dart';
import 'package:banwet/app/modules/notification/controllers/notification_controller.dart';
import 'package:banwet/app/modules/project_modules/dailytask/controllers/dailytask_controller.dart';
import '../../../Style/const.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';
import 'component/homecard_component.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class HomeView extends GetView<HomeController> {
  @override
  HomeController controller = Get.put(HomeController());
  NotificationController notificontroller = Get.put(NotificationController());
  DailytaskController taskController = Get.put(DailytaskController());
  HomeView({Key? key}) : super(key: key);
  DateTime backPressTime = DateTime.now();
  var storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    dHeight = MediaQuery.of(context).size.height;
    dWidth = MediaQuery.of(context).size.width;
    // print(storage.read('uid'));

    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(backPressTime);
        final warning = difference >= const Duration(seconds: 2);

        backPressTime = DateTime.now();
        if (warning) {
          Fluttertoast.showToast(msg: 'Press BACK again to exit!');
          return false;
        } else {
          Fluttertoast.cancel();
          // Get.back();
          //  Future.delayed(Duration.zero,(){
          //
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          //  });

          return true;
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<NotificationController>(
            builder: (controller) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    // top: dHeight! * 0.04,
                    // left: dWidth! * 0.06,
                    // right: dWidth! * 0.06,
                    ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: dHeight! * 0.04,
                          left: dWidth! * 0.06,
                          right: dWidth! * 0.06),
                      child: _header(context),
                    ),
                    height10,

                    Padding(
                      padding: EdgeInsets.only(
                          left: dWidth! * 0.06, right: dWidth! * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.salequotation, arguments: {
                                // "workid": arugumentData["workid"],
                                // "workname": arugumentData["workname"]
                              });
                            },
                            child: const banwetIteams(
                              image: 'assets/images/salequo.png',
                              text: "Sales Quotation",
                            ),
                          ),
                          InkWell(
                            onTap: ()async {
                              // Get.to(const SalesEstimation());

                             await Get.toNamed(Routes.saleEstimation, 
                            //  arguments: {
                            //     // "workid": arugumentData["workid"],
                            //     // "workname": arugumentData["workname"]
                            //   },
                              );
                            },
                            child: const banwetIteams(
                              image: 'assets/images/enquiry.png',
                              text: "Estimation",
                            ),
                          ),
                        ],
                      ),
                    ),
                    h2,
                    Padding(
                      padding: EdgeInsets.only(
                          left: dWidth! * 0.06, right: dWidth! * 0.06),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          banwetIteams(
                            image: 'assets/images/workorder.png',
                            text: "Work Order",
                          ),
                          banwetIteams(
                            image: 'assets/images/enquiryss.png',
                            text: "Enquiry",
                          ),
                        ],
                      ),
                    ),
                    h2,
                    Padding(
                      padding: EdgeInsets.only(
                          left: dWidth! * 0.06, right: dWidth! * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _project(),
                          _cash(),
                        ],
                      ),
                    ),
                    height5,
                    Padding(
                      padding: EdgeInsets.only(
                          left: dWidth! * 0.06, right: dWidth! * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            radius: 20,
                            onTap: () {
                              // Get.to(() => const LaunchSoon());
                              Get.to(const MyActivity());
                            },
                            child: const HomeCard(
                              image: 'assets/images/task.png',
                              firstText: 'My Activity',
                              secondText: "View Reports",
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              // taskController.homepageTaskModel = null;
                              taskController.gettaskDetails();
                              Get.toNamed(
                                Routes.Homepagedailytask,
                                //  arguments: {
                                //   // "workid": arugumentData["workid"],
                                //   // "workname": arugumentData["workname"]
                                // },
                              );
                            },
                            radius: 20,
                            child: const HomeCard(
                              image: 'assets/images/activity.png',
                              firstText: 'Task',
                              secondText: "Pending Task",
                            ),
                          )
                        ],
                      ),
                    ),
                    height5,
                    Padding(
                      padding: EdgeInsets.only(
                          left: dWidth! * 0.06, right: dWidth! * 0.06),
                      child: _late(),
                    ),
                    // height6,
                    // _imortance(context),
                    height4
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  homeadditionalIteams() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          color: bColor,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        const Icon(
          Icons.ac_unit_sharp,
          color: Colors.white,
        ),
        const Text(
          "Sales Quotation",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        h05,
      ]),
    );
  }

  Container _late() {
    return Container(
      height: dHeight! * 0.076,
      width: dWidth,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: bColor),
      child: Row(
        children: [
          width5,
          const Icon(
            Icons.access_time_outlined,
            color: Colors.white,
          ),
          width5,
          Obx(() => controller.userdetails.value.signedInRemarks != null
              ? Text(
                  controller.userdetails.value.signedInRemarks.toString(),
                  style:
                      wheader4.copyWith(color: Colors.white.withOpacity(0.8)),
                )
              : Text(
                  storage.read('late') ?? "",
                  // controller.userdetails.value.signedInRemarks.toString(),
                  style:
                      wheader4.copyWith(color: Colors.white.withOpacity(0.8)),
                ))
        ],
      ),
    );
  }

  _imortance(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Important Notifications',
              style: header5.copyWith(
                  color: Colors.red,
                  fontSize: 14.3,
                  fontWeight: FontWeight.w700),
            ),
            Container(width: dWidth! * 0.37, height: 4, color: bColor)
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4.9,
          //width: ,
          child: Swiper(
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: dHeight! * 002,
                width: dWidth,
                child: Card(
                  color: Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 12, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height5,
                        Text(
                          "Here are the values to use in your domain's DNS settings to configure MX records for Gmail with Google Workspace. Each record points to a Google mail server. For more information",
                          style: header5.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: 3,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: bColor,
                color: const Color.fromRGBO(171, 171, 171, 1),
                space: 5,
              ),
            ),
            duration: kDefaultAutoplayTransactionDuration,
            //control: SwiperControl(),
          ),
        ),
      ],
    );
  }

  GestureDetector _cash() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.CASH);
      },
      child: SizedBox(
        height: 28.h,
        width: 42.w,
        child: Card(
          elevation: 5,
          shadowColor: Colors.white,
          color: bColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/cash.png',
                        width: 20.w,
                        height: 13.h,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cash',
                      style: wheader15,
                    ),
                    Row(
                      children: [
                        Text(
                          '₹ ',
                          style: TextStyle(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Obx(() {
                          return Text(
                            controller.cashModel.value.totalBalance.toString(),
                            style: wheader9,
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _project() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PROJECT_VIEW);
      },
      child: SizedBox(
        height: 28.h,
        width: 42.w,
        child: Card(
          elevation: 5,
          shadowColor: Colors.white,
          color: bColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/project-management.png',
                        width: 20.w,
                        height: 13.h,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Projects',
                      style: wheader15,
                    ),
                    Obx(() {
                      return Text(
                        "${controller.projectCount.value.toString()} Assigned Projects",
                        style: wheader9,
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SETTINGS);
                },
                child:
                    //  Obx(() {
                    //   return
                    Container(
                  width: 73,
                  height: 73,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: bColor, width: 2),
                  ),
                  child: Obx(() => ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        // child: const CircleAvatar()
                        child: CachedNetworkImage(
                          imageUrl: controller.userdetails.value.photo ?? "",
                          //                            "${Get.find<AuthController>(tag: 'auth').userDatas.value.photo.toString()}",
                          //color: Colors.black,
                          height: 5.h,
                          width: 20.w,

                          placeholder: (context, url) => const SizedBox(),
                          errorWidget: (context, url, error) =>
                              const CircularProgressIndicator(),
                        ),
                      )),
                )
                // }),
                ),
            width20,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Hello',
                    style: header5.copyWith(
                        fontSize: 36, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(controller.userdetails.value.name ?? "",
                        style: header5.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ),
          ],
        ),
        // Obx(() {
        //   //  Get.find<ProjectController>();

        //   return

        HomePageNotification(notificontroller: notificontroller)
        // }),
      ],
    );
  }
}

class banwetIteams extends StatelessWidget {
  const banwetIteams({
    super.key,
    this.text,
    this.image,
  });
  final text;
  final image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      width: 42.w,
      child: Card(
        elevation: 5,
        shadowColor: Colors.white,
        color: bColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      image,
                      // width: 20.w,
                      height: 4.h,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: SemiBold,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageNotification extends StatefulWidget {
  const HomePageNotification({
    super.key,
    required this.notificontroller,
  });

  final NotificationController notificontroller;

  @override
  State<HomePageNotification> createState() => _HomePageNotificationState();
}

class _HomePageNotificationState extends State<HomePageNotification> {
  @override
  void initState() {
    super.initState();
    NotificationController().getNotifications();
  }

  NotificationController controller1 = Get.put(NotificationController());
  final String _version = '';
  // Future<void> _getAppVersion() async {
  //   final packageInfo = await PackageInfo.fromPlatform();
  //   setState(() {
  //     _version = packageInfo.version;
  //   });
  // }
  //  Future<void> _getAppVersion() async {
  //   // final version = await FlutterVersion.getVersion();
  //   setState(() {
  //     _version = version;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller1.getNotifications();
        // print(
        //     "THis is veron code ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] ${_version}");
        Get.toNamed(Routes.NOTIFICATION);
      },
      child: Container(
        child: Stack(
          children: [
            Lottie.asset(
              'assets/images/33262-icons-bell-notification.json',
              height: 58,
              animate: true,
              // repeat: Get.find<NotificationController>(tag: 'noti')
              //         .loading
              //         .isFalse
              //     ? true
              //     : false
              // //controller5.loading.isFalse?true:false,
              // ),
            ),
            // notificontroller.notificationModel?.data?.length != 0
            // ?
            // notificontroller.notificationModel?.data?.length == 0
            Positioned(
                left: 21,
                // top: 1,
                // bottom: 5,
                child: Container(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 8, vertical: 2),
                  // height: 24,
                  // width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blue),
                  // radius:
                  //     widget.notificontroller.notificationModel!.data!.length >=
                  //             99
                  //         ? 12.5
                  //         : 13,
                  child: Center(
                    child: Text(
                      widget.notificontroller.notificationModel == null
                          ? "0"
                          : widget.notificontroller.notificationModel!.data ==
                                      null ||
                                  widget.notificontroller.notificationModel!
                                          .data!.length ==
                                      0
                              ? "0"
                              : widget.notificontroller.notificationModel!.data!
                                          .length >=
                                      99
                                  ? "99+"
                                  : widget.notificontroller.notificationModel
                                          ?.data?.length
                                          .toString() ??
                                      "0",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ))
            // : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
