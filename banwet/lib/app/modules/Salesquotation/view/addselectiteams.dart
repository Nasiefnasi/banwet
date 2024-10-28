// import 'package:banwet/app/data/model/quotationtemplate/templatemodel.dart';
// import 'package:banwet/app/modules/Salesquotation/controller/salequotation.dart';
// import 'package:banwet/app/modules/Salesquotation/view/addsalesQuotatiom.dart';
// import 'package:banwet/app/modules/Salesquotation/view/salesquotation.dart';
// import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
// import 'package:banwet/app/style/const.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:multi_dropdown/multi_dropdown.dart';

// class Selectitams extends GetView<QuotationController> {
//   Selectitams({super.key});

//   final _formKey = GlobalKey<FormState>();

//   final controllers = MultiSelectController<Quotationtempla>();

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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Add Quotation",
//           style: TextStyle(fontSize: 16, fontFamily: Medium),
//         ),
//       ),
//       resizeToAvoidBottomInset: false,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         child: SubmitButtons(
//             isLoading: false.obs,
//             onTap: () {
//               Get.to(const AddSalesQuotatiom());
//             },
//             text: "Submit"),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // h8,
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Form(
//                 key: _formKey,
//                 child: MultiDropdown<Quotationtempla>(
//                   items: controller.quotationTemplate!.data!
//                       .map(
//                         (e) =>
//                             DropdownItem(label: e.title ?? "Unnamed Template"),
//                       )
//                       .toList(),

//                   // items
//                   //     .map(
//                   //         (user) => DropdownItem(label: user.name, value: user))
//                   //     .toList(),
//                   controller: controllers,
//                   enabled: true,
//                   searchEnabled: true,
//                   chipDecoration: ChipDecoration(
//                     backgroundColor: Colors.black12.withOpacity(0.1),
//                     wrap: false,
//                     runSpacing: 2,
//                     spacing: 10,
//                   ),
//                   fieldDecoration: FieldDecoration(
//                     hintText: 'Select Users',
//                     hintStyle: const TextStyle(color: Colors.black87),
//                     // prefixIcon: const Icon(Icons.people),
//                     showClearIcon: false,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(color: Colors.black87),
//                     ),
//                   ),
//                   dropdownDecoration: DropdownDecoration(
//                     // marginTop: 1,
//                     maxHeight: MediaQuery.of(context).size.height * .65,
//                   ),
//                   dropdownItemDecoration: DropdownItemDecoration(
//                     selectedIcon:
//                         const Icon(Icons.check_box, color: Colors.green),
//                     disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
//                     // itemDecoration: BoxDecoration(
//                     //   border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
//                     // ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select a user';
//                     }
//                     return null;
//                   },
//                   onSelectionChange: (selectedItems) {
//                     debugPrint("OnSelectionChange: $selectedItems");
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:banwet/app/data/model/quotationtemplate/templatemodel.dart';
// import 'package:banwet/app/modules/Salesquotation/controller/salequotation.dart';
// import 'package:banwet/app/modules/Salesquotation/view/addsalesQuotatiom.dart';
// import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
// import 'package:banwet/app/style/const.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:multi_dropdown/multi_dropdown.dart';

// class Selectitams extends GetView<QuotationController> {
//   Selectitams({super.key});

//   final _formKey = GlobalKey<FormState>();
//   final controllers = MultiSelectController<Quotationtempla>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Add Quotation",
//           style: TextStyle(fontSize: 16, fontFamily: Medium),
//         ),
//       ),
//       resizeToAvoidBottomInset: false,
//       bottomNavigationBar: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//         child: SubmitButtons(
//           isLoading: false.obs,
//           onTap: () {
//             if (_formKey.currentState!.validate()) {
//               Get.to(const AddSalesQuotatiom());
//             }
//           },
//           text: "Submit",
//         ),
//       ),
//       body: SafeArea(
//         child: Obx(
//           () {
//             if (controller.quotationTemplate?.data == null) {
//               return Center(child: CircularProgressIndicator());
//             }
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               child: Form(
//                 key: _formKey,
//                 child: MultiDropdown<Quotationtempla>(
//                   items: controller.quotationTemplate!.data!
//                       .map(
//                         (e) => DropdownItem(
//                           label: e.title ?? "Unnamed Template",
//                           value: e,
//                         ),
//                       )
//                       .toList(),
//                   controller: controllers,
//                   enabled: true,
//                   searchEnabled: true,
//                   chipDecoration: ChipDecoration(
//                     backgroundColor: Colors.black12.withOpacity(0.1),
//                     wrap: false,
//                     runSpacing: 2,
//                     spacing: 10,
//                   ),
//                   fieldDecoration: FieldDecoration(
//                     hintText: 'Select Templates',
//                     hintStyle: const TextStyle(color: Colors.black87),
//                     showClearIcon: false,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                       borderSide: const BorderSide(color: Colors.black87),
//                     ),
//                   ),
//                   dropdownDecoration: DropdownDecoration(
//                     maxHeight: MediaQuery.of(context).size.height * .65,
//                   ),
//                   dropdownItemDecoration: DropdownItemDecoration(
//                     selectedIcon:
//                         const Icon(Icons.check_box, color: Colors.green),
//                     disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select a template';
//                     }
//                     return null;
//                   },
//                   onSelectionChange: (selectedItems) {
//                     debugPrint("OnSelectionChange: $selectedItems");
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:banwet/app/data/model/quotationtemplate/templatemodel.dart';
import 'package:banwet/app/modules/Salesquotation/controller/salequotation.dart';
import 'package:banwet/app/modules/Salesquotation/view/addsalesQuotatiom.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/style/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_dropdown/multi_dropdown.dart';

class Selectitams extends GetView<QuotationController> {
  Selectitams({super.key});

  final _formKey = GlobalKey<FormState>();
  final controllers = MultiSelectController<Quotationtempla>();

  @override
  Widget build(BuildContext context) {
    final items = (controller.quotationTemplate?.data ?? [])
        .map(
            (e) => DropdownItem(label: e.title ?? "Unnamed Template", value: e))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Quotation",
          style: TextStyle(fontSize: 16, fontFamily: Medium),
        ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SubmitButtons(
          isLoading: false.obs,
          onTap: () {
            if (_formKey.currentState!.validate() &&
                controller.selectiteam.value.isNotEmpty) {
              Get.to(const AddSalesQuotatiom());
            }
          },
          text: "Submit",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child:
                // , items == null || items.isEmpty
                //     ? const Center(child: CircularProgressIndicator())
                //     : ,
                MultiDropdown<Quotationtempla>(
              onSearchChange: (value) {
                // print(value);
              },
              items: items,
              controller: controllers,
              enabled: true,
              searchEnabled: true,
              chipDecoration: ChipDecoration(
                backgroundColor: Colors.black12.withOpacity(0.1),
                wrap: false,
                runSpacing: 2,
                spacing: 10,
              ),
              fieldDecoration: FieldDecoration(
                hintText: 'Select Quotation',
                hintStyle: TextStyle(color: Colors.black87, fontFamily: Medium),
                showClearIcon: false,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(color: Colors.black87),
                ),
              ),
              dropdownDecoration: DropdownDecoration(
                maxHeight: MediaQuery.of(context).size.height * .68,
              ),
              dropdownItemDecoration: DropdownItemDecoration(
                selectedIcon: const Icon(Icons.check_box, color: Colors.green),
                disabledIcon: Icon(Icons.lock, color: Colors.grey.shade300),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a template';
                }
                return null;
              },
              onSelectionChange: (selectedItems) {
                for (var item in selectedItems) {
                  if (item != null) {
                    controller.selectiteam.value.clear();
                    debugPrint("Selected Item: ${item.createdDate}");
                    controller.selectiteam.value.addAll(selectedItems.toList());

                    print(
                        "the ithshhhs"); // Replace 'createdBy' with the field you need to print
                  } else {
                    debugPrint("Selected Item is null");
                  }
                }
                print(controller.selectiteam.value.length);
              },
            ),
          ),
        ),
      ),
    );
  }
}
