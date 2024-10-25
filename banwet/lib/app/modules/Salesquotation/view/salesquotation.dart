import 'package:banwet/app/common_widegt/common2date.dart';
import 'package:banwet/app/common_widegt/index.dart';
import 'package:banwet/app/modules/Salesquotation/controller/salequotation.dart';
import 'package:banwet/app/modules/Salesquotation/view/addselectiteams.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Salesquotation extends GetView<QuotationController> {
  const Salesquotation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ProjectNameTitile(
                screenTitile: "Quotation",
                onTap: () {
                  // return addestimation(context);
                  Get.to(const Selectitams());
                },
              ),
            ),
            // Common2Date(
            //   ontap: () {},
            //   statDate: TextEditingController(),
            //   endDate: TextEditingController(),
            //   onPressed: () {},
            // ),
            Common2Date(
              ontap: () {
                // controller.filterAndCalculate();
                controller.change();
              },
              statDate: controller.startDateController,
              endDate: controller.endDateController,
              startDateValue: controller.startDate,
              endDateValue: controller.endDate,
              onPressed: () {
                // controller.filteringDates();
                // controller.filterAndCalculate();
                controller.update();
                print("<-------------");
              },
            ),
            Expanded(
                child: GetBuilder<QuotationController>(
              builder: (controller) => controller.salequotation == null
                  ? Column(
                      children: [
                        h5,
                        Center(child: loadingthreebounce),
                      ],
                    )
                  : controller.salequotation!.data.isEmpty
                      ? Center(
                          child: Lottie.asset(
                              repeat: false,
                              "assets/images/qrbRtDHknE.json",
                              height: 250),
                        )
                      : ListView.builder(itemBuilder: (context, index) {
                          var details = controller.salequotation!.data[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              // height: ,
                              // width: 800,

                              decoration: BoxDecoration(
                                  color: bColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Quotation ID",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: Medium,
                                          color: Colors.white),
                                    ),
                                    h1,
                                    Text(
                                      "Quotation Date",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: regular,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
              init: QuotationController(),
            ))
          ],
        )),
      ),
    );
  }

  // addestimation(BuildContext context) {
  //   final _formKey = GlobalKey<FormState>();
  //   final controller = MultiSelectController<User>();

  //   var items = [
  //     User(name: "hello", id: 2),
  //     User(name: "hello1", id: 3),
  //     User(name: "hello3", id: 4),
  //     User(name: "hell7o", id: 5),
  //     User(name: "hello7", id: 6),
  //     User(name: "hello7", id: 7),
  //     User(name: "hell5o", id: 8),
  //     User(name: "hello57", id: 9),
  //     User(name: "hello14", id: 11),
  //     User(name: "hello13", id: 12),
  //   ];

  //   // Get.defaultDialog(
  //   //   backgroundColor: Colors.white,
  //   //   radius: 10,
  //   //   title: "Add Estimation",
  //   //   titlePadding: const EdgeInsets.only(top: 15),
  //   //   titleStyle: const TextStyle(fontFamily: 'Medium', fontSize: 16),
  //   //   content:
  //   // );
  //   Get.dialog(Dialog(
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Form(
  //         key: _formKey,
  //         child: MultiDropdown<User>(
  //           items: items
  //               .map((user) => DropdownItem(label: user.name, value: user))
  //               .toList(),
  //           controller: controller,
  //           enabled: true,
  //           searchEnabled: true,
  //           chipDecoration: ChipDecoration(
  //             backgroundColor: Colors.black12.withOpacity(0.1),
  //             wrap: true,
  //             runSpacing: 2,
  //             spacing: 10,
  //           ),
  //           fieldDecoration: FieldDecoration(
  //             hintText: 'Select Users',
  //             hintStyle: const TextStyle(color: Colors.black87),
  //             prefixIcon: const Icon(Icons.people),
  //             showClearIcon: false,
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(12),
  //               borderSide: const BorderSide(color: Colors.grey),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(12),
  //               borderSide: const BorderSide(color: Colors.black87),
  //             ),
  //           ),
  //           dropdownDecoration: DropdownDecoration(
  //             marginTop: 1,
  //             maxHeight: MediaQuery.of(context).size.height * .4,
  //             // ignore: prefer_const_constructors
  //             header: Padding(
  //               padding: EdgeInsets.all(8),
  //               child: Text(
  //                 'Select users from the list',
  //                 textAlign: TextAlign.start,
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),
  //           dropdownItemDecoration: DropdownItemDecoration(
  //             selectedIcon: const Icon(Icons.check_box, color: Colors.green),
  //             disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
  //             // itemDecoration: BoxDecoration(
  //             //   border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
  //             // ),
  //           ),
  //           validator: (value) {
  //             if (value == null || value.isEmpty) {
  //               return 'Please select a user';
  //             }
  //             return null;
  //           },
  //           onSelectionChange: (selectedItems) {
  //             debugPrint("OnSelectionChange: $selectedItems");
  //           },
  //         ),
  //       ),
  //     ),
  //   ));
  // }
  // addestimation() {
  //   final _formKey = GlobalKey<FormState>();
  //   final controller = MultiSelectController<User>();

  //   var items = [
  //     User(name: "hello", id: 2),
  //     User(name: "hello1", id: 3),
  //     User(name: "hello3", id: 4),
  //     User(name: "hell7o", id: 5),
  //     User(name: "hello7", id: 6),
  //     User(name: "hello7", id: 7),
  //     User(name: "hell5o", id: 8),
  //     User(name: "hello57", id: 9),
  //     User(name: "hello14", id: 11),
  //     User(name: "hello13", id: 12),
  //   ];

  //   Get.defaultDialog(
  //     backgroundColor: Colors.white,
  //     radius: 10,
  //     title: "Add Estimation",
  //     titlePadding: EdgeInsets.only(top: 15),
  //     titleStyle: TextStyle(fontFamily: Medium, fontSize: 16),
  //     content: Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: Column(
  //         children: [
  //           Form(
  //             key: _formKey,
  //             child: MultiDropdown<User>(
  //               items: items
  //                   .map((user) => DropdownItem(label: user.name, value: user))
  //                   .toList(),
  //               controller: controller,
  //               enabled: true,
  //               searchEnabled: true,
  //               // chipDecoration: const ChipDecoration(
  //               //   backgroundColor: Colors.yellow,
  //               //   wrap: true,
  //               //   runSpacing: 2,
  //               //   spacing: 10,
  //               // ),
  //               // fieldDecoration: FieldDecoration(
  //               //   hintText: 'Countries',
  //               //   hintStyle: const TextStyle(color: Colors.black87),
  //               //   prefixIcon: Icon(Icons.flag),
  //               //   showClearIcon: false,
  //               //   border: OutlineInputBorder(
  //               //     borderRadius: BorderRadius.circular(12),
  //               //     borderSide: const BorderSide(color: Colors.grey),
  //               //   ),
  //               //   focusedBorder: OutlineInputBorder(
  //               //     borderRadius: BorderRadius.circular(12),
  //               //     borderSide: const BorderSide(color: Colors.black87),
  //               //   ),
  //               // ),
  //               dropdownDecoration: const DropdownDecoration(
  //                 marginTop: 1,
  //                 maxHeight: 500,
  //                 header: Padding(
  //                   padding: EdgeInsets.all(8),
  //                   child: Text(
  //                     'Select countries from the list',
  //                     textAlign: TextAlign.start,
  //                     style:
  //                         TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //                   ),
  //                 ),
  //               ),
  //               dropdownItemDecoration: DropdownItemDecoration(
  //                 selectedIcon:
  //                     const Icon(Icons.check_box, color: Colors.green),
  //                 disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
  //               ),
  //               validator: (value) {
  //                 if (value == null || value.isEmpty) {
  //                   return 'Please select a country';
  //                 }
  //                 return null;
  //               },
  //               onSelectionChange: (selectedItems) {
  //                 debugPrint("OnSelectionChange: $selectedItems");
  //               },
  //             ),
  //           ),
  //           const SizedBox(height: 12),
  //           ElevatedButton(
  //             onPressed: () {
  //               if (_formKey.currentState?.validate() ?? false) {
  //                 final selectedItems = controller.selectedItems;
  //                 debugPrint("Selected Items: $selectedItems");
  //               }
  //             },
  //             child: const Text('Submit'),
  //           ),
  //           // Other buttons (Select All, Unselect All, etc.) can be uncommented and used as needed
  //         ],
  //       ),
  //     ),
  //   );
  // }
  // //
}

class User {
  final String name;
  final int id;

  User({required this.name, required this.id});
}
