import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/index.dart';
import '../Style/const.dart';
import '../data/model/RequestModel/request_detail_model.dart';

metrialshowListdialog(
    context, String? id, Rx<RequestDetailModel> requestDetailModels) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            height: 70.h,
            width: 100.w,
            child: SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    height: 66.h,
                    width: 100.w,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(1.5.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bill Id : $id",
                                style: header12.copyWith(
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                  onTap: () => Get.back(),
                                  child: const Icon(Icons.close))
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 2.h),
                          decoration: BoxDecoration(
                            color: bColor,
                            // borderRadius: BorderRadius.vertical(
                            //     top: Radius.circular(15)
                            // )
                          ),
                          height: 5.h,
                          width: 100.w,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    SizedBox(
                                      width: 28.w,
                                      child: Text(
                                        'Material',
                                        style: wheader4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    w1,
                                    Text(
                                      'Qty',
                                      style: wheader4,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    const Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                    w1
                                  ],
                                ),
                                //    Text('Item $item', style: textStyle),
                              ],
                            ),
                          ),
                        ),
                        Obx(() {
                          return requestDetailModels.value.items == null
                              ? SizedBox(
                                  // color: Colors.amber,
                                  height:
                                      MediaQuery.of(context).size.height * .4,
                                  width: 300,
                                  child: Center(child: loadingthreebounce2))
                              : ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      requestDetailModels.value.items?.length ??
                                          0,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 2.h),
                                      height: 7.h,
                                      width: 100.w,
                                      color: Colors.white,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                SizedBox(
                                                  width: 31.w,
                                                  child: Text(
                                                    requestDetailModels
                                                            .value
                                                            .items?[index]
                                                            .materialName ??
                                                        "",
                                                    style: header4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  requestDetailModels
                                                          .value
                                                          .items![index]
                                                          .quantity ??
                                                      "",
                                                  style: header4,
                                                )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 4.w,
                                                ),
                                                GestureDetector(
                                                    onTap: () {
                                                      Get.defaultDialog(
                                                        radius: 10,
                                                        backgroundColor:
                                                            Colors.white,
                                                        title: "Description",
                                                        titleStyle: TextStyle(
                                                          fontSize: 18,
                                                          fontFamily: Medium,
                                                        ),
                                                        middleTextStyle:
                                                            header11,
                                                        middleText:
                                                            requestDetailModels
                                                                    .value
                                                                    .items?[
                                                                        index]
                                                                    .description ??
                                                                "",
                                                      );
                                                    },
                                                    child: const Icon(
                                                      Icons.info_outline,
                                                    )),
                                                w1,
                                              ],
                                            ),
                                            //    Text('Item $item', style: textStyle),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                      height: 0.1.h,
                                    );
                                  },
                                );
                        })
                      ],
                    ),
                  ),
                ]),
          );
        });
      });
}
