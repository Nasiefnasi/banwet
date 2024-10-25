import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/stock/controllers/stockcontrollers.dart';

import 'package:banwet/app/routes/app_pages.dart';
import 'package:banwet/app/style/const.dart';

class Stockiteams extends StatefulWidget {
  const Stockiteams({super.key});

  @override
  State<Stockiteams> createState() => _StockiteamsState();
}

class _StockiteamsState extends State<Stockiteams> {
  var argumentData = Get.arguments;

  StockControllers stocksontrollers = StockControllers();
  @override
  void initState() {
    stocksontrollers.stocktransfercontroller();
    // stocksontrollers.stocktranferIdpost("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stock',
          style: header2.copyWith(
            fontFamily: Medium,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(2.h),
              child: const Row(
                children: [
                  // GestureDetector(
                  //     onTap: () => Get.back(),
                  //     child: const Icon(Icons.arrow_back_ios)),
                  // w2,
                  // Text(
                  //   'Labour & Wage Slip',
                  //   style: header2.copyWith(
                  //       fontSize: 23.sp, fontWeight: FontWeight.w600),
                  // ),
                ],
              ),
            ),
            AnimationLimiter(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(seconds: 1),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: GestureDetector(
                                onTap: () {
                                  // Get.toNamed(item[index][1].toString());
                                  routing(item[index][1].toString());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(1.h),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                  height: 10.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                      color: bColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            item[index][2],
                                            width: 10.w,
                                            height: 4.h,
                                            color: Colors.white,
                                          ),
                                          width5,
                                          Text(
                                            item[index][0],
                                            style: wheader2,
                                          )
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Colors.white,
                                        size: 17.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ));
                    })),
          ],
        ),
      ),
    );
  }

  routing(String values) async {
    switch (values) {
      case "Stock Transfer":
        Get.toNamed(Routes.STOCK_TRANSFER, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;
      case "Stock Consumption":
        Get.toNamed(Routes.Stock_Consumption, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });

        break;
      case "Stock Report":
        Get.toNamed(Routes.Stock_Report0, arguments: {
          "workid": argumentData["workid"],
          "workname": argumentData["workname"],
        });
        break;

      default:
        print("${values}mkkk");
        Get.to(() => const LaunchSoon());
        break;
    }
  }

  List item = [
    ['Stock Transfer', 'Stock Transfer', 'assets/images/mdi_transfer.png'],
    ['Stock Consumption', 'Stock Consumption', 'assets/images/consumption.png'],
    ['Stock Report', 'Stock Report', 'assets/images/report.png'],
  ];
}
