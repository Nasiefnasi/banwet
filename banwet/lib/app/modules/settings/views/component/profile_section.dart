import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../../Style/const.dart';
import '../../../home/controllers/home_controller.dart';
import '../../controllers/settings_controller.dart';

class DutySignoffCard extends StatelessWidget {
  DutySignoffCard({super.key});
  HomeController controller = Get.put(HomeController());
  SettingsController settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 0.18,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0,
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.black12)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 12),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      w2,
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 85,
                          height: 85,
                          decoration: BoxDecoration(
                            color: bColor2,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: bColor, width: 2),
                          ),
                          child: Obx(() => ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl:
                                    controller.userdetails.value.photo ?? "",
                                height: 5.h,
                                width: 20.w,
                                placeholder: (context, url) => const SizedBox(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ))),
                        ),
                      ),
                      width20,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            h2,
                            //  Obx(() =>
                            SizedBox(
                              // color: Colors.amber,
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                controller.userdetails.value.name ?? "",
                                style: header5.copyWith(
                                    fontSize: 16, fontFamily: Medium),
                              ),
                            ),
                            // ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    // "CACASCAS CASCASCXSAXsxDX",
                                    controller.userdetails.value.roletitle ??
                                        "",
                                    style: header5.copyWith(
                                        fontSize: 16,
                                        // fontWeight: FontWeight.w600,
                                        fontFamily: regular),
                                  ),
                                ),
                                // GestureDetector(
                                //   onTap: () async {
                                //     Position position = await settingsController
                                //         .determinePosition();
                                //     settingsController
                                //         .getAddressFromLatLong(position);
                                //     print(position.longitude);
                                //     Get.bottomSheet(bottomSheet2());
                                //   },
                                //   child: Container(
                                //     height: 40,
                                //     width: dWidth! * 0.38,
                                //     decoration: BoxDecoration(
                                //         borderRadius: BorderRadius.circular(10),
                                //         color: Colors.red),
                                //     child: Center(
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           Text(
                                //             'Duty Sign Off',
                                //             style: wheader4,
                                //           ),
                                //           w2,
                                //           const Icon(
                                //             Icons.logout_outlined,
                                //             color: Colors.white,
                                //           )
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Positioned(
              //   right: 0,
              //   bottom: 20,
              //   child: GestureDetector(
              //     onTap: () async {
              //       Position position =
              //           await settingsController.determinePosition();
              //       settingsController.getAddressFromLatLong(position);
              //       print(position.longitude);
              //       Get.bottomSheet(bottomSheet2());
              //     },
              //     child: Container(
              //       height: 40,
              //       width: dWidth! * 0.38,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.red),
              //       child: Center(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'Duty Sign Off',
              //               style: wheader4,
              //             ),
              //             w2,
              //             const Icon(
              //               Icons.logout_outlined,
              //               color: Colors.white,
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
