import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
// import 'package:get/route_manager.dart';
import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/stock/controllers/stockcontrollers.dart';

// class StockReport extends StatelessWidget {
//   StockReport({
//     super.key,
//     this.pageshowindex,
//   });
//   late dynamic pageshowindex;

//   @override
//   Widget build(BuildContext context) {
//     final StockControllers controller = Get.put(StockControllers());
//     return GetBuilder(
//       builder: (controller) => DefaultTabController(
//         initialIndex: pageshowindex,
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             leading: const SizedBox(),
//             // title: const Text(
//             //   'Flutter Custom TabBar',
//             //   style: TextStyle(fontSize: 16),
//             // ),
//             centerTitle: true,
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(150),
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     children: [
//                       ProjectNameTitile(
//                         addbutton: const SizedBox(),
//                         projectName: controller.argumentData["workname"] ?? "",
//                         screenTitile: "Stock Report",
//                         onTap: () {
//                           // Handle tap event
//                         },
//                       ),
//                       h2,
//                       Common2Date(
//                         ontap: () {
//                           controller.change();
//                         },
//                         statDate: controller.startDateController,
//                         endDate: controller.endDateController,
//                         startDateValue: controller.startDate,
//                         endDateValue: controller.endDate,
//                         onPressed: () {
//                           controller.filterAndCalculatestocktransfer(
//                               controller.stockTransferReportModel!.data == null
//                                   ? []
//                                   : controller.stockTransferReportModel!.data);
//                           controller.update();

//                           controller.filterAndCalculatestockconsumption(
//                               controller.stockConsumptionReportModel!.data ==
//                                       null
//                                   ? []
//                                   : controller
//                                       .stockConsumptionReportModel!.data);
//                           controller.update();
//                         },
//                       ),
//                       h3,
//                       Container(
//                         height: 42,
//                         // margin: const EdgeInsets.symmetric(horizontal: 20),
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                           color: Color.fromARGB(255, 236, 236, 236),
//                         ),
//                         child: const TabBar(
//                           indicatorSize: TabBarIndicatorSize.tab,
//                           dividerColor: Colors.transparent,
//                           indicator: BoxDecoration(
//                             color: Color.fromARGB(255, 0, 106, 151),
//                             borderRadius: BorderRadius.all(Radius.circular(10)),
//                           ),
//                           labelColor: Colors.white,
//                           unselectedLabelColor: Colors.black54,
//                           tabs: [
//                             TabItem(
//                               title: 'Consumption',
//                             ),
//                             TabItem(
//                               title: 'Transfer',
//                             ),
//                             // TabItem(title: 'Deleted', count: 1),
//                           ],
//                         ),
//                       ),
//                       h1,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           body: const TabBarView(
//             children: [
//               // Center(child: Text('Inbox Page')),
//               ConsumptionReport(),
//               TransferReport()
//             ],
//           ),
//         ),
//       ),
//       init: StockControllers(),
//     );
//   }
// }
class StockReport extends StatelessWidget {
  const StockReport({
    super.key,
    this.pageshowindex,
  });

  final int? pageshowindex;

  @override
  Widget build(BuildContext context) {
    final StockControllers controller = Get.put(StockControllers());

    return GetBuilder<StockControllers>(
      builder: (_) {
        return DefaultTabController(
          initialIndex: pageshowindex ?? 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(150),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        ProjectNameTitile(
                          addbutton: const SizedBox(),
                          projectName:
                              controller.argumentData["workname"] ?? "",
                          screenTitile: "Stock Report",
                          onTap: () {
                            // Handle tap event
                          },
                        ),
                        h2,
                        Common2Date(
                          ontap: () {
                            controller.change();
                          },
                          statDate: controller.startDateController,
                          endDate: controller.endDateController,
                          startDateValue: controller.startDate,
                          endDateValue: controller.endDate,
                          onPressed: () {
                            controller.filterAndCalculatestocktransfer(
                              controller.stockTransferReportModel?.data ?? [],
                            );
                            controller.update();

                            controller.filterAndCalculatestockconsumption(
                              controller.stockConsumptionReportModel?.data ??
                                  [],
                            );
                            controller.update();
                          },
                        ),
                        h3,
                        Container(
                          height: 42,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromARGB(255, 236, 236, 236),
                          ),
                          child: const TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                              color: Color.fromARGB(255, 0, 106, 151),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.black54,
                            tabs: [
                              TabItem(
                                title: 'Consumption',
                              ),
                              TabItem(
                                title: 'Transfer',
                              ),
                            ],
                          ),
                        ),
                        h1,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: const SafeArea(
              child: TabBarView(
                children: [
                  ConsumptionReport(),
                  TransferReport(),
                ],
              ),
            ),
          ),
        );
      },
      init: StockControllers(),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  // final int count;

  const TabItem({
    super.key,
    required this.title,
    // required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
          // count > 0
          //     ? Container(
          //         margin: const EdgeInsetsDirectional.only(start: 5),
          //         padding: const EdgeInsets.all(3),
          //         decoration: BoxDecoration(
          //           color: Colors.grey.shade200,
          //           shape: BoxShape.circle,
          //         ),
          //         child: Center(
          //           child:
          //            Text(
          //             count > 9 ? "9+" : count.toString(),
          //             style: const TextStyle(
          //               color: Colors.black54,
          //               fontSize: 10,
          //             ),
          //           ),
          //         ),
          //       )
          //     : const SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}

class ConsumptionReport extends StatefulWidget {
  const ConsumptionReport({super.key});

  @override
  State<ConsumptionReport> createState() => _ConsumptionReportState();
}

class _ConsumptionReportState extends State<ConsumptionReport> {
  final StockControllers controller = Get.put(StockControllers());
  @override
  void initState() {
    StockControllers().stockconsumtiondetails();
    StockControllers().update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');
    final StockControllers controller = Get.put(StockControllers());
    var mediaqury = MediaQuery.of(context).size;
    return SafeArea(
        child: GetBuilder(
      builder: (controller) {
        if (controller.stockconsumtionloading.value == true) {
          return Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [loadingthreebounce],
              ),
            ),
          );
        }

        // if(controller.stockConsumptionReportModel==null){
        //   return Center(
        //                 child: Lottie.asset(
        //                     repeat: false,
        //                     "assets/images/qrbRtDHknE.json",
        //                     height: 250),
        //               );

        // }

        return Obx(
          () => controller.filteredList.value.length == 0
              ? Center(
                  child: Lottie.asset(
                      repeat: false,
                      "assets/images/qrbRtDHknE.json",
                      height: 250),
                )
              : ListView.builder(
                  itemCount:
                      controller.stockConsumptionReportModel!.data.length,
                  itemBuilder: (context, index) {
                    var details =
                        controller.stockConsumptionReportModel!.data[index];

                    if (dateFormat
                                .parse(controller.stockConsumptionReportModel!
                                    .data[index].date)
                                .compareTo(DateTime.parse(
                                    controller.startDateController.text)) >=
                            0 &&
                        dateFormat
                                .parse(controller.stockConsumptionReportModel!
                                    .data[index].date)
                                .compareTo(DateTime.parse(
                                    controller.endDateController.text)) <=
                            0) {
                      return iteamcard(
                        details: details,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
        );
      },
      init: StockControllers(),
    ));
  }
}

class iteamcard extends StatelessWidget {
  const iteamcard({super.key, this.details});
  final details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        // height: 100,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          details.material,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: regular,
                              color: Colors.white),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          details.unit,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: SemiBold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  )),
                  Container(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "Qty: ${details.consumedQty.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: Medium,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white54,
              ),
              Text(
                details.date.toString(),
                style: TextStyle(
                    fontSize: 14, fontFamily: regular, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class transferiteamcard extends StatelessWidget {
  const transferiteamcard({super.key, this.details});
  final details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: bColor, borderRadius: BorderRadius.circular(10)),
        // height: 100,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          details.material,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: regular,
                              color: Colors.white),
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          details.unit,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: SemiBold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  )),
                  Container(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "Qty: ${details.transferredQty.toString()}",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: Medium,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.white54,
              ),
              Text(
                details.date.toString(),
                style: TextStyle(
                    fontSize: 14, fontFamily: regular, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class TransferReport extends StatelessWidget {
//   const TransferReport({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var dateFormat = DateFormat('dd-MM-yyyy');
//     final StockControllers controller = Get.put(StockControllers());
//     var mediaqury = MediaQuery.of(context).size;
//     return SafeArea(
//         child: GetBuilder(
//       builder: (controller) {
//         if (controller.stockTransferReportModel == null) {
//           return Center(
//             child: SizedBox(
//               height: MediaQuery.of(context).size.height * .5,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [loadingthreebounce],
//               ),
//             ),
//           );
//         }
//         // if(controller.stockTransferReportModel==null){
//         // return Center(
//         //               child: Lottie.asset(
//         //                   repeat: false,
//         //                   "assets/images/qrbRtDHknE.json",
//         //                   height: 250),
//         //             );

//         // }

//         return controller.filteredtransferList.value.length == 0
//             ? Center(
//                 child: Lottie.asset(
//                     repeat: false,
//                     "assets/images/qrbRtDHknE.json",
//                     height: 250),
//               )
//             : controller.stockTransferReportModel == null
//                 ? Center(
//                     child: Lottie.asset(
//                         repeat: false,
//                         "assets/images/qrbRtDHknE.json",
//                         height: 250),
//                   )
//                 : ListView.builder(
//                     itemCount: controller.stockTransferReportModel!.data.length,
//                     itemBuilder: (context, index) {
//                       var details =
//                           controller.stockTransferReportModel!.data[index];

//                       if (dateFormat
//                                   .parse(controller.stockTransferReportModel!
//                                       .data![index].date!)
//                                   .compareTo(DateTime.parse(
//                                       controller.startDateController.text)) >=
//                               0 &&
//                           dateFormat
//                                   .parse(controller.stockTransferReportModel!
//                                       .data![index].date!)
//                                   .compareTo(DateTime.parse(
//                                       controller.endDateController.text)) <=
//                               0) {
//                         return transferiteamcard(
//                           details: details,
//                         );
//                       } else {
//                         return const SizedBox();
//                       }
//                     },
//                   );
//       },
//       init: StockControllers(),
//     ));
//   }
// }
// class TransferReport extends StatefulWidget {
//   const TransferReport({super.key});

//   @override
//   State<TransferReport> createState() => _TransferReportState();
// }

// class _TransferReportState extends State<TransferReport> {
//   final StockControllers controller = Get.put(StockControllers());
//   @override
//   void initState() {
//     controller.stocktransferdetails();

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final StockControllers controller = Get.put(StockControllers());
//     var dateFormat = DateFormat('dd-MM-yyyy');
//     var mediaqury = MediaQuery.of(context).size;

//     return SafeArea(
//       child: GetBuilder<StockControllers>(
//         builder: (_) {
//           if (controller.stockTransferReportModel == null) {
//             return Center(
//               child: SizedBox(
//                 height: mediaqury.height * .5,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [loadingthreebounce], // Make sure this is defined
//                 ),
//               ),
//             );
//           }

//           return controller.filteredtransferList.value.isEmpty
//               ? Center(
//                   child: Lottie.asset(
//                       repeat: false,
//                       "assets/images/qrbRtDHknE.json",
//                       height: 250),
//                 )
//               : ListView.builder(
//                   itemCount: controller.stockTransferReportModel!.data.length,
//                   itemBuilder: (context, index) {
//                     var details =
//                         controller.stockTransferReportModel!.data[index];

//                     if (dateFormat.parse(details.date!).compareTo(
//                                 DateTime.parse(
//                                     controller.startDateController.text)) >=
//                             0 &&
//                         dateFormat.parse(details.date!).compareTo(
//                                 DateTime.parse(
//                                     controller.endDateController.text)) <=
//                             0) {
//                       return transferiteamcard(
//                         details: details,
//                       );
//                     } else {
//                       return const SizedBox();
//                     }
//                   },
//                 );
//         },
//       ),
//     );
//   }
// }
class TransferReport extends StatefulWidget {
  const TransferReport({super.key});

  @override
  State<TransferReport> createState() => _TransferReportState();
}

class _TransferReportState extends State<TransferReport> {
  final StockControllers controller = Get.put(StockControllers());

  @override
  void initState() {
    super.initState();
    StockControllers().stocktransferdetails();
    StockControllers().update();
  }

  // void _loadData() async {
  //   await controller.stocktransferdetails();
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');
    var mediaqury = MediaQuery.of(context).size;

    return SafeArea(child: GetBuilder<StockControllers>(builder: (controlle) {
      if (controlle.stocktransferloading.value) {
        return Center(
          child: SizedBox(
            height: mediaqury.height * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [loadingthreebounce], // Ensure this is defined
            ),
          ),
        );
      }
      // controlle.stocktransferloading.value
      //     ? Center(
      //         child: SizedBox(
      //           height: mediaqury.height * .5,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [loadingthreebounce], // Ensure this is defined
      //           ),
      //         ),
      //       )
      return Obx(
        () => controller.filteredtransferList.value.length == 0
            ? Center(
                child: Lottie.asset(
                  repeat: false,
                  "assets/images/qrbRtDHknE.json",
                  height: 250,
                ),
              )
            :
            // if (controller.stockTransferReportModel == null) {
            //   return Center(
            //     child: SizedBox(
            //       height: mediaqury.height * .5,
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [loadingthreebounce], // Ensure this is defined
            //       ),
            //     ),
            //   );
            // }

            // if (controller.filteredtransferList.value.isEmpty) {
            //   return Center(
            //     child: Lottie.asset(
            //       repeat: false,
            //       "assets/images/qrbRtDHknE.json",
            //       height: 250,
            //     ),
            //   );
            // }

            ListView.builder(
                itemCount: controller.stockTransferReportModel!.data.length,
                itemBuilder: (context, index) {
                  var details =
                      controller.stockTransferReportModel!.data[index];

                  if (dateFormat.parse(details.date).compareTo(DateTime.parse(
                              controller.startDateController.text)) >=
                          0 &&
                      dateFormat.parse(details.date).compareTo(DateTime.parse(
                              controller.endDateController.text)) <=
                          0) {
                    return transferiteamcard(details: details);
                  } else {
                    return const SizedBox();
                  }
                },
              ),
      );
    }));
  }
}
