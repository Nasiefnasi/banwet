import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../Style/const.dart';
import '../../controllers/purchase_order_controller.dart';

class Indiaction extends StatelessWidget {
  Indiaction({super.key, required this.onTap, required this.postionNotifier});
  PurchaseOrderController controller = Get.put(PurchaseOrderController());
  void Function() onTap;
  ValueNotifier<bool> postionNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: postionNotifier,
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    onTap();
                    // controller.editUpdate();
                    // print(controller.edit1);
                  },
                  child: value
                      ? Container(
                          padding: EdgeInsets.all(1.2.h),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: bColor2,
                              borderRadius: BorderRadius.circular(50)),
                          child: CircleAvatar(
                            radius: 0.1.h,
                            backgroundColor: bColor,
                          ),
                        )
                      : Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: bColor2,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: bColor, width: 2)),
                          child: const Icon(Icons.edit),
                        )),
              h1,
              Text(
                'Select Suppller',
                style: header8,
              )
            ],
          ),
          // w1,
          Column(
            children: [
              Container(
                height: 0.3.h,
                width: 26.w,
                decoration: DottedDecoration(
                    shape: Shape.line,
                    linePosition: LinePosition.bottom,
                    color: bColor,
                    dash: const [1, 4]),
              ),
              h2
            ],
          ),
          w4,
          Column(
            children: [
              GestureDetector(
                  onTap: () async {
                    if (controller.k1key.currentState!.validate()) {
                      // await controller.editUpdate();
                      postionNotifier.value = true;
                      postionNotifier.notifyListeners();
                    }
                  },
                  child: value
                      ? Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: bColor2,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: bColor, width: 2)),
                          child: const Icon(Icons.edit),
                        )
                      : Container(
                          padding: EdgeInsets.all(1.2.h),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: bColor2,
                              borderRadius: BorderRadius.circular(50)),
                          child: CircleAvatar(
                            radius: 0.1.h,
                            backgroundColor: bColor,
                          ),
                        )),
              h1,
              Text(
                'Add Material',
                style: header8,
              )
            ],
          )
        ],
      ),
    );
  }
}
