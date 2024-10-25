import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/labour_list_controller.dart';

class SearchWidgets extends StatelessWidget {
  SearchWidgets({super.key});
  LabourListController controller = Get.put(LabourListController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: SizedBox(
        height: 45,
        child: CupertinoSearchTextField(
          decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border.all(color: Colors.black54.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          onChanged: (value) {
            controller.searchText.value = value;
            controller.filterData();
          },
          itemSize: 16.sp,
          // backgroundColor: Colors.white,
          //  borderRadius: BorderRadius.circular(12),

          prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset("assets/images/Vecto.png")

              // const Icon(
              //   Icons.search_outlined,
              //   size: 25,
              // ),
              ),
          placeholder: 'Search Labour Name',
        ),
      ),
    );
  }
}
