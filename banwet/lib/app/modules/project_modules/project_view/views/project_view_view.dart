import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../Style/const.dart';
import '../../../../common_widegt/loading.dart';
import '../controllers/project_view_controller.dart';
import 'component/index.dart';

class ProjectViewView extends GetView<ProjectViewController> {
  const ProjectViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: bColor,
        child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: Scaffold(
            body: Column(
              children: [
                HeaderComponent(),
                const SizedBox(
                  height: 15,
                ), // page header and search field
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.h),
                    child: GetBuilder<ProjectViewController>(
                      builder: (controller) {
                        if (controller.filteredData.isEmpty) {
                          return Center(
                            child: SizedBox(
                              height: dHeight! * 0.5,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [loadingthreebounce],
                              ),
                            ),
                          );
                        } else if (controller.filteredData.value.length == 0) {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(
                                //   'assets/images/No data-pana.svg',
                                //   height: dHeight! * 0.2,
                                // ),
                                // height6,
                                Text(
                                  ' You have not been \n Assigned any projects',
                                  style: header2.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                      color: const Color(0xff898989)),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          );
                        } else {
                          return Obx(
                            () => ListView.separated(
                              separatorBuilder: (context, index) => h05,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.filteredData.value.length,
                              itemBuilder: (context, index) {
                                var details =
                                    controller.filteredData.value[index];
                                return ProjectListTile(
                                  controller: details,
                                  index: index,
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
