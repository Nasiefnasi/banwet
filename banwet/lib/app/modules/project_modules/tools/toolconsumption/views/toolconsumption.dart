import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:banwet/app/common_widegt/common2date.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/project_modules/tools/toolconsumption/views/addtoolsreturnconsuption.dart';
import 'package:banwet/app/style/const.dart';

class ToolConsumption extends StatelessWidget {
  const ToolConsumption({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            color: bColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: ProjectNameTitile(
                addbutton: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.add,
                      color: bColor,
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
                titlecolors: Colors.white,
                lefticon: Colors.white,
                projectcolor: Colors.white,
                projectName: " controller.argumnetData[workname]",
                screenTitile: "Tools Return & Consuption",
                onTap: () {
                  Get.to(() => AddToolReturnConsuptiom());
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Common2Date(
              ontap: () {
                // controller.update();
                // controller.filteringData();
              },
              statDate: TextEditingController(),
              endDate: TextEditingController(),
              startDateValue: TextEditingController(),
              endDateValue: TextEditingController(),
              onPressed: () {
                // controller.filteringDates();
                // controller.update();
                // controller.filteringData();
                print("<-----------==---------------");
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: bColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Driller',
                                        style: TextStyle(
                                            fontFamily: Medium,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                                      h1,
                                      Text(
                                        'Category',
                                        style: TextStyle(
                                            fontFamily: regular,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      onPressed: () {},
                                      child: Text(
                                        'Rent',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: Medium,
                                            color: Colors.black),
                                      )),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ),
                          h1,
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Price Per Day ₹     250',
                                        style: TextStyle(
                                            fontFamily: regular,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
                                      h1,
                                      Text(
                                        'Total Paid ₹    566  ',
                                        style: TextStyle(
                                            fontFamily: Medium,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Returned Qty  55',
                                        style: TextStyle(
                                            fontFamily: regular,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
                                      h1,
                                      Text(
                                        'Balance ₹    566  ',
                                        style: TextStyle(
                                            fontFamily: Medium,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Text(
                            'Consuption Date : 05-09-2024',
                            style: TextStyle(
                                fontFamily: Medium,
                                fontSize: 12,
                                color: Colors.white),
                          ),
                          h1,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
