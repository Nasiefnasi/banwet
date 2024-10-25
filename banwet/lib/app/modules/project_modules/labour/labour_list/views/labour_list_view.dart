import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../controllers/labour_list_controller.dart';
import 'add_labour.dart';
import 'component/search_component.dart';

class LabourListView extends GetView<LabourListController> {
  const LabourListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              h2,
              titlee(),
              h2,
              SearchWidgets(),
              h2,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GetBuilder<LabourListController>(
                  builder: (controller) => controller.labourListModel ==
                          null // waiting api data
                      ? Center(
                          child: SizedBox(
                              height: dHeight! * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SpinKitThreeBounce(
                                    size: 30.sp,
                                    color: bColor,
                                  ),
                                ],
                              )))
                      : controller.filteredData.isEmpty
                          ? Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .7,
                                    child: Center(
                                      child: Lottie.asset(
                                          repeat: false,
                                          "assets/images/qrbRtDHknE.json",
                                          height: 250),
                                    ),
                                  )
                                  // SvgPicture.asset(
                                  //   'assets/images/No data-pana.svg',
                                  //   // color: bColor,
                                  //   height: dHeight! * 0.2,
                                  // ),
                                  // height6,
                                  // Text(
                                  //   'No Projects yet !',
                                  //   style: header2.copyWith(fontSize: 25),
                                  // )
                                ],
                              ),
                            )
                          : ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 10,
                              ),
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: controller.filteredData.length,
                              itemBuilder: (context, index) {
                                return LabourtListTile(
                                  index: index,
                                );
                              },
                            ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding titlee() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios)),
              width5,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Labours',
                    style: header15,
                  ),
                  SizedBox(
                    width: 57.w,
                    child: Text(
                      controller.argumentData["workname"],
                      style: header9,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              )
            ],
          ),
          GestureDetector(
              onTap: () {
                controller.clear();
                Get.to(() => AddLobour());
              },
              child: Lottie.asset('assets/images/Jp7tjlAjLj.json',
                  height: 9.h, width: 20.w))
        ],
      ),
    );
  }
}

class LabourtListTile extends StatelessWidget {
  LabourtListTile({super.key, required this.index});
  LabourListController controller = Get.put(LabourListController());
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: bColor, width: 2),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: controller.filteredData[index].photo.toString(),
                  )),
            ),
            width5,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.filteredData[index].labourName ?? "",
                  style: header2.copyWith(fontSize: 13.sp, fontFamily: regular),
                ),
                Text(
                  controller.filteredData[index].workType ?? "",
                  style: header4.copyWith(fontSize: 10.sp, fontFamily: regular),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
