import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/stock/Apimodel/stocktransferpostarray.dart';
import 'package:banwet/app/modules/stock/Apimodel/strockfiltertranfer.dart';
import 'package:banwet/app/modules/stock/controllers/stockcontrollers.dart';

class StockTransferItem extends StatelessWidget {
  StockTransferItem({super.key});

  final StockControllers controller = Get.put(StockControllers());

  final List<TextEditingController> textControllers = [];

  @override
  Widget build(BuildContext context) {
    var argumentData = Get.arguments;
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SubmitButtons(
          isLoading: controller.transferloading,
          text: "Submit",
          onTap: () {
            controller.selectQuantitySubmit(context);
          },
        ),
      ),
      // bottomNavigationBar: GestureDetector(
      //   onTap: () async {
      //     controller.selectQuantitySubmit(context);
      //     //   if (controller.posttransferstatuscode.value == "true") {
      //     //     // await Get.to(() => const SubmitDone());
      //     //            //  Get.to(StockReport(pageshowindex: 1,));

      //     // await Get.toNamed(
      //     //       Routes.Stock_Report1,
      //     //       arguments: {
      //     //         "workid": argumentData["workid"],
      //     //         "workname": argumentData["workname"],
      //     //       },
      //     //     );
      //     //   }
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      //     child: Container(
      //       height: 7.h,
      //       width: 100.w,
      //       decoration: BoxDecoration(
      //           color: bColor,
      //           borderRadius:
      //               const BorderRadius.all(const Radius.circular(5))),
      //       child: Center(
      //         child: Obx(() => controller.isLoading.value
      //             ? SpinKitThreeBounce(color: bColor)
      //             : Text(
      //                 'Submit',
      //                 style: header15.copyWith(color: Colors.white),
      //               )),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ProjectNameTitile(
                addbutton: const SizedBox(),
                projectName: controller.argumentData["workname"],
                screenTitile: "Stock Transfers",
                onTap: () {
                  // Handle tap event
                },
              ),
              h3,
              // StockSearching(),
              Container(
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
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.2), width: 1.5),
                ),
                child: SizedBox(
                  height: 45,
                  child: CupertinoSearchTextField(
                    itemSize: 16.sp,
                    backgroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset("assets/images/Vecto.png")

                        // const Icon(
                        //   Icons.search_outlined,
                        //   size: 25,
                        // ),
                        ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    // controller: controller.controller,
                    placeholder: 'Search Stock',
                    onChanged: (value) {
                      print(value);
                      controller.searchText.value = value;
                      controller.filterstocktData(value);
                    },
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     contentPadding: const EdgeInsets.symmetric(
                  //         vertical: 10.0, horizontal: 10.0),
                  //     prefixIcon: Padding(
                  //       padding: const EdgeInsets.all(10),
                  //       child: Image.asset("assets/images/Vecto.png"),
                  //     ),
                  //     hintText: 'Search Stock',
                  //     hintStyle: TextStyle(
                  //         fontSize: 14.sp,
                  //         color: Colors.grey,
                  //         fontFamily: regular),
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Colors.black54.withOpacity(0.3), width: 1),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //           color: Colors.black54.withOpacity(0.3), width: 1),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Colors.black26, width: 1),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //   ),
                  // onChanged: (value) {
                  //   print(value);
                  //   controller.searchText.value = value;
                  //   controller.filterstocktData(value);
                  // },
                  //   style: TextStyle(fontSize: 16.sp),
                  // ),
                ),
              ),
              h2,
              Expanded(
                child: controller.stocktransferFiltermodel == null
                    ? Center(
                        child: Lottie.asset(
                            repeat: false,
                            "assets/images/qrbRtDHknE.json",
                            height: 250),
                      )
                    : GetBuilder<StockControllers>(
                        init: StockControllers(),
                        builder: (controller) {
                          if (textControllers.isEmpty) {
                            for (var i = 0;
                                i <
                                    controller
                                        .stocktransferFiltermodel!.data.length;
                                i++) {
                              textControllers
                                  .add(TextEditingController(text: "0"));
                            }
                          }

                          return Obx(
                            () => controller.stockData.value.length == 0
                                ?
                                // controller.filteredData.value.length == 0
                                // ?
                                stocklistpart(controller, mediaquery,
                                    controller.stocktransferFiltermodel!.data)
                                : stocklistpart(controller, mediaquery,
                                    controller.stockData.value),
                          );
                          // : ListView.builder(
                          //     itemCount:
                          //         controller.filteredData.value.length,
                          //     itemBuilder: (context, index) {
                          //       var details =
                          //           controller.filteredData.value[index];
                          //       var availableQty = details.availableQty;

                          //       return StokeTransferIteamsCard(
                          //         availableQty: availableQty,
                          //         index: index,
                          //         textControllers: textControllers,
                          //         details: details,
                          //       );
                          //     },
                          //   );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView stocklistpart(StockControllers controller, Size mediaquery,
      List<Stocktransferdata> detail) {
    return ListView.builder(
      itemCount: detail.length,
      itemBuilder: (context, index) {
        var details = detail[index];

        // controller
        //   .stocktransferFiltermodel!.data[index]

        // );
        var availableQty = details.availableQty;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: mediaquery.height * .12,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            details.stockName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: regular,
                            ),
                          ),
                          Text(
                            details.unitName,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: SemiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          "assets/images/arroe.png",
                        ),
                      ),
                    ),
                    w2,
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: mediaquery.height * 0.06,
                            width: 106,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color.fromARGB(255, 54, 51, 140),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10),
                                child: TextField(
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    if (double.tryParse(value) != null &&
                                        double.parse(value) > availableQty) {
                                      textControllers[index].text =
                                          availableQty.toString();
                                      textControllers[index].selection =
                                          TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: textControllers[index]
                                                      .text
                                                      .length));
                                    } else {
                                      controller.stockiteams.removeWhere(
                                          (element) =>
                                              element.material_id ==
                                              details.materialId.toString());

                                      controller.stockiteams.add(
                                          StockArrayIteams(
                                              location_id:
                                                  details.locationId.toString(),
                                              material_id:
                                                  details.materialId.toString(),
                                              quantity: textControllers[index]
                                                  .text
                                                  .toString(),
                                              stock_id:
                                                  details.stockId.toString(),
                                              unit_id:
                                                  details.unitId.toString()));
                                    }

                                    print(controller.stockiteams.toList());
                                  },
                                  controller: textControllers[index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        width: 1.0,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(bottom: 5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          h1,
                          Text(
                            "Available Qty : ${availableQty.toString()}",
                            style: header9.copyWith(
                              fontFamily: Medium,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black12,
                )
              ],
            ),
          ),
        );

        //  StokeTransferIteamsCard(
        //   availableQty: availableQty,
        //   index: index,
        //   textControllers: textControllers,
        //   details: details,
        // );
      },
    );
  }
}
