import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../Style/const.dart';
import '../controllers/addwageslip_controller.dart';
import 'component/index.dart';

class Addwage extends GetView<AddwageslipController> {
  @override
  Addwage({super.key});
  @override
  AddwageslipController controller = Get.put(AddwageslipController());
  ValueNotifier<bool> postionNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                h3,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back_ios)),
                    width5,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Individual Wage Slips ",
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
                h2,
                Indiaction(
                  onTap: () {
                    postionNotifier.value = false;
                    postionNotifier.notifyListeners();
                  },
                  postionNotifier: postionNotifier,
                ),
                GetBuilder<AddwageslipController>(
                  builder: (controller) {
                    if (controller.wageListModel == null) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      controller.paidAccount();
                      return ValueListenableBuilder(
                        valueListenable: postionNotifier,
                        builder: (context, value, child) => value
                            ? AddPAymentComponent()
                            : SelectLabourComponent(
                                postionNotifier: postionNotifier),
                      );
                    }
                  },
                  init: AddwageslipController(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
