import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/modules/stock/controllers/stockcontrollers.dart';

class StockSearching extends StatelessWidget {
  StockSearching({super.key});
  StockControllers controller = Get.put(StockControllers());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: CupertinoSearchTextField(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black54.withOpacity(0.3), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        onChanged: (value) {
          print(value);
          controller.searchText.value = value;
          controller.filterstocktData(value);
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
        placeholder: 'Search Stock',
      ),
    );
  }
}

class StockConsumptiondate extends StatelessWidget {
  StockConsumptiondate({super.key});
  StockControllers controller = Get.put(StockControllers());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 2,
        //     blurRadius: 2,
        //     offset: const Offset(0, 2), // changes position of shadow
        //   ),
        // ],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1.5),
      ),
      child: SizedBox(
        height: 45,
        child: CupertinoSearchTextField(
          backgroundColor: Colors.white,
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   border: Border.all(color: Colors.black54.withOpacity(0.3), width: 1),
          //   borderRadius: BorderRadius.circular(12),
          // ),
          onChanged: (value) {
            print(value);
            controller.searchText.value = value;
            controller.filterData(value);
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
          placeholder: 'Search Stock',
        ),
      ),
    );
  }
}
