import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/data/model/ProjectModel/project_assign.dart';
import 'package:banwet/app/style/const.dart';

import '../../../../../routes/app_pages.dart';

class ProjectListTile extends StatelessWidget {
  ProjectListTile({
    super.key,
    required this.controller,
    required this.index,
  });
  final ProjectData controller;
  int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PROJECTDETAILED, arguments: {
          "workid": controller.workId,
          "workname": controller.workName
        });
      },
      child: SizedBox(
        child: Card(
          // surfaceTintColor: Colors.red,
          elevation: 0,

          shadowColor: Colors.white,
          color: bColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          w1,
                          SvgPicture.asset(
                            'assets/svg/file.svg',
                            width: 18,
                            height: 20,
                          ),
                          w2,
                          SizedBox(
                            width: 70.w,
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              controller.workName ?? "",
                              style: popin16W400.copyWith(fontSize: 14),
                              // maxLines: 2,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   padding:
                      //       const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(50)),
                      //   child: Text(
                      //     controller.filteredData.value[index].workStatus ?? "",
                      //     style: wheader9.copyWith(
                      //         color: controller
                      //                     .filteredData.value[index].workStatus ==
                      //                 "Completed"
                      //             ? sucess
                      //             : controller.filteredData.value[index].workStatus ==
                      //                     "Pending"
                      //                 ? pending
                      //                 : inProgress),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                h1,
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      controller.workStatus ?? "",
                      style: wheader9.copyWith(
                          color: controller.workStatus == "Completed"
                              ? sucess
                              : controller.workStatus == "Pending"
                                  ? pending
                                  : inProgress),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
