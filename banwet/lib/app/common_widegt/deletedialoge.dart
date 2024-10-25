import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../Style/const.dart';

expDelete(context, index, void Function() onTap) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            //  height:80.h,
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
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                    // height: 25.h,
                    width: 100.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        h1,
                        SvgPicture.asset(
                          "assets/images/delete.svg",
                          width: 5.w,
                          height: 5.h,
                        ),
                        h1,
                        Text(
                          "Warning",
                          style: header15,
                        ),
                        h1,
                        Text(
                          "Do you Want Delete?",
                          style: header10.copyWith(
                              color: const Color.fromARGB(255, 139, 131, 131)),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 5.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    Get.back();
                                    onTap();
                                  },
                                  // child: Container(
                                  //   height: 4.h,
                                  //   width: 30.w,
                                  //   decoration: BoxDecoration(
                                  //       color: bColor,
                                  //       borderRadius: BorderRadius.circular(13)),
                                  child: Center(
                                      child: Text(
                                    'Yes',
                                    style:
                                        header12.copyWith(color: Colors.black),
                                  )),
                                  //  ),
                                ),
                              ),
                              const VerticalDivider(
                                thickness: 1, color: Colors.black26,endIndent: 5,indent: 2,
                              ),
                              Expanded(
                                child: InkWell(onTap: () {
                                  return Get.back();
                                },
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      // child: Container(
                                      //   height: 4.h,
                                      //   width: 30.w,
                                      //   decoration: BoxDecoration(
                                      //       color: bColor,
                                      //       borderRadius: BorderRadius.circular(13)),
                                      //   child: Center(
                                      child: Text(
                                        'No',
                                        style: header12.copyWith(
                                            color: Colors.black),
                                        // )
                                        //),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          );
        });
      });
}

// info dialoge

infoDialoge(BuildContext context, String? title, String? description) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return SizedBox(
            //  height: 70.h,
            width: 100.w,
            child: SimpleDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.zero,
                children: [
                  Container(
                    padding: EdgeInsets.all(2.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    //height: 66.h,
                    width: 100.w,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(''),
                            Text(
                              "Info",
                              style: header12.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                                onTap: () => Get.back(),
                                child: const Icon(Icons.close))
                          ],
                        ),
                        h2,
                        Row(
                          children: [
                            Container(
                              width: 1.7.w,
                              height: 2.2.h,
                              color: bColor,
                            ),
                            w3,
                            Text(
                              "Tittle",
                              style: header11.copyWith(),
                            )
                          ],
                        ),
                        h2,
                        Container(
                          height: 5.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black12.withOpacity(0.1)),
                              color: bColor2,
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              w3,
                              Text(
                                title!,
                                style: header11,
                              ),
                            ],
                          ),
                        ),
                        h2,
                        Row(
                          children: [
                            Container(
                              width: 1.7.w,
                              height: 2.2.h,
                              color: bColor,
                            ),
                            w3,
                            Text(
                              "Description",
                              style: header11,
                            ),
                          ],
                        ),
                        h2,
                        Container(
                          height: 12.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black12.withOpacity(0.1)),
                              color: bColor2,
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              w3,
                              Expanded(
                                  child: Text(
                                description!,
                                style: header11,
                              )),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          );
        });
      });
}

logoutDialog(context, void Function() onTap) {
  return
      //  showDialog(
      //                                   context: context,
      //                                   builder: (BuildContext context) {
      //                                     return StatefulBuilder(builder:
      //                                         (BuildContext context,
      //                                             StateSetter setState) {
      //                                       return SizedBox(
      //                                         //  height:80.h,
      //                                         width: 100.w,
      //                                         child: SimpleDialog(
      //                                             shape: RoundedRectangleBorder(
      //                                                 borderRadius:
      //                                                     BorderRadius.circular(
      //                                                         15)),
      //                                             contentPadding: EdgeInsets.zero,
      //                                             titlePadding: EdgeInsets.zero,
      //                                             children: [
      //                                               Container(
      //                                                 decoration: BoxDecoration(
      //                                                     color: Colors.white,
      //                                                     borderRadius:
      //                                                         BorderRadius.circular(
      //                                                             15)),
      //                                                 padding: EdgeInsets.symmetric(
      //                                                     vertical: 2.h,
      //                                                     horizontal: 2.h),
      //                                                 // height: 25.h,
      //                                                 width: 100.w,
      //                                                 child: Column(
      //                                                   crossAxisAlignment:
      //                                                       CrossAxisAlignment
      //                                                           .center,
      //                                                   children: [
      //                                                     h1,
      //                                                     SvgPicture.asset(
      //                                                       "assets/images/delete.svg",
      //                                                       width: 5.w,
      //                                                       height: 5.h,
      //                                                     ),
      //                                                     h1,
      //                                                     Text(
      //                                                       "Warning",
      //                                                       style: header15,
      //                                                     ),
      //                                                     h1,
      //                                                     Text(
      //                                                       "Do you Want Delete?",
      //                                                       style: header10.copyWith(
      //                                                           color: const Color
      //                                                               .fromARGB(255,
      //                                                               139, 131, 131)),
      //                                                     ),
      //                                                     const Divider(
      //                                                       thickness: 1,
      //                                                     ),
      //                                                     SizedBox(
      //                                                       height: 5.h,
      //                                                       child: Row(
      //                                                         mainAxisAlignment:
      //                                                             MainAxisAlignment
      //                                                                 .center,
      //                                                         children: [
      //                                                           Expanded(
      //                                                             child: InkWell(
      //                                                               onTap:
      //                                                                   () async {
      //                                                                 Get.back();
      //                                                                 onTap();
      //                                                                   },
      //                                                               child: Center(
      //                                                                   child: Text(
      //                                                                 'Yes',
      //                                                                 style: header12
      //                                                                     .copyWith(
      //                                                                         color:
      //                                                                             Colors.black),
      //                                                               )),
      //                                                               //  ),
      //                                                             ),
      //                                                           ),
      //                                                           const VerticalDivider(
      //                                                             thickness: 1,
      //                                                           ),
      //                                                           Expanded(
      //                                                             child: Center(
      //                                                               child: InkWell(
      //                                                                 onTap: () {
      //                                                                   Get.back();
      //                                                                 },
      //                                                                 // child: Container(
      //                                                                 //   height: 4.h,
      //                                                                 //   width: 30.w,
      //                                                                 //   decoration: BoxDecoration(
      //                                                                 //       color: bColor,
      //                                                                 //       borderRadius: BorderRadius.circular(13)),
      //                                                                 //   child: Center(
      //                                                                 child: Text(
      //                                                                   'No',
      //                                                                   style: header12
      //                                                                       .copyWith(
      //                                                                           color:
      //                                                                               Colors.black),
      //                                                                   // )
      //                                                                   //),
      //                                                                 ),
      //                                                               ),
      //                                                             ),
      //                                                           ),
      //                                                         ],
      //                                                       ),
      //                                                     ),
      //                                                   ],
      //                                                 ),
      //                                               ),
      //                                             ]),
      //                                     );
      //                                     )});}}

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return SizedBox(
                //  height:80.h,
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
                        padding: EdgeInsets.symmetric(
                            vertical: 2.h, horizontal: 2.h),
                        // height: 25.h,
                        width: 100.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            h1,
                            Icon(Icons.warning,color: Colors.amber,size: 5.h,),
                            // SvgPicture.asset(
                            //   "assets/images/delete.svg",
                            //   width: 5.w,  height: 5.h,
                            // ),
                            h1,
                            Text(
                              "Warning",
                              style: header15,
                            ),
                            h1,
                            Text(
                              "Do you Want Delete?",
                              style: header10.copyWith(
                                  color:
                                      const Color.fromARGB(255, 139, 131, 131)),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 5.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () async {
                                        Get.back();
                                        onTap();
                                        // Get.back();
                                      },
                                      // child: Container(
                                      //   height: 4.h,
                                      //   width: 30.w,
                                      //   decoration: BoxDecoration(
                                      //       color: bColor,
                                      //       borderRadius: BorderRadius.circular(13)),
                                      child: Center(
                                          child: Text(
                                        'Yes',
                                        style: header12.copyWith(
                                            color: Colors.black),
                                      )),
                                      //  ),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    endIndent: 5,indent: 2,
                                    thickness: 1,
                                    color: Colors.black26,
                                  ),
                                  Expanded(
                                    child: InkWell(onTap: () {
                                      return Get.back();

                                    },
                                      child: Center(
                                        child: InkWell(
                                          onTap: () {
                                      
                                           return Get.back();
                                            // Navigator.pop(context);
                                          },
                                          // child: Container(
                                          //   height: 4.h,
                                          //   width: 30.w,
                                          //   decoration: BoxDecoration(
                                          //       color: bColor,
                                          //       borderRadius: BorderRadius.circular(13)),
                                          //   child: Center(
                                          child: Text(
                                            'No',
                                            style: header12.copyWith(
                                                color: Colors.black),
                                            // )
                                            //),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              );
            });
          });
}
