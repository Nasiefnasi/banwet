import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/data/model/quotationtemplate/templatemodel.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/Salesquotation/controller/salequotation.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
// import 'package:html_editor_enhanced/html_editor.dart';
import 'package:searchfield/searchfield.dart';
import 'package:sizer/sizer.dart';

// class AddSalesQuotatiom extends GetView<QuotationController> {
//   const AddSalesQuotatiom({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar:
//           SubmitButtons(isLoading: false.obs, onTap: () {}, text: "Submit"),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SafeArea(
//             child: SingleChildScrollView(
//           child: Column(
//             children: [
//               h1,
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: ProjectNameTitile(
//                   addbutton: const SizedBox(),
//                   screenTitile: "Add Quotation",
//                   onTap: () {},
//                 ),
//               ),
//               h1,
//               Padding(
//                 padding: const EdgeInsets.only(left: 1),
//                 child: SearchField(
//                     searchStyle:
//                         header11.copyWith(color: Colors.black, fontSize: 11.sp),
//                     suggestionItemDecoration: BoxDecoration(
//                       color: bColor2,
//                     ),
//                     suggestionStyle: header11.copyWith(
//                       color: Colors.black54,
//                     ),
//                     controller: TextEditingController(),
//                     validator: (p0) {
//                       return null;

//                       // if (controller.expTypeCtrl.text.isEmpty) {
//                       //   return '';
//                       // } else if (!controller.expType
//                       //     .any((e) => e.toString() == p0)) {
//                       //   return 'Invalid Expense Type';
//                       // } else {
//                       //   return null;
//                       // }
//                     },
//                     searchInputDecoration: InputDecoration(
//                       labelText: 'Expense Type',
//                       hintStyle: header11.copyWith(
//                         fontSize: 11.sp,
//                         color: Colors.black54,
//                       ),
//                       labelStyle: header11.copyWith(
//                           color: Colors.black54, fontSize: 12.sp),
//                       suffixIcon:
//                           const Icon(Icons.arrow_drop_down, color: Colors.grey),
//                       icon: CachedNetworkImage(
//                         imageUrl:
//                             "https://cdn-icons-png.flaticon.com/512/9298/9298945.png",
//                         color: Colors.black38,
//                         height: 3.h,
//                         width: 7.w,
//                         placeholder: (context, url) => const SizedBox(),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.error),
//                       ),
//                       enabledBorder: const UnderlineInputBorder(
//                         borderSide: BorderSide(width: 1, color: Colors.black26),
//                       ),
//                     ),
//                     suggestions: const []
//                     //  controller.expType
//                     //     .map(
//                     //       (e) => SearchFieldListItem(
//                     //         e.toString(),
//                     //         child: Text('  ${e.toString()}', style: header11),
//                     //         item: e.toString(),
//                     //       ),
//                     //     )
//                     //     .toList(),
//                     // onSuggestionTap: (val){
//                     //   headId=val.item;
//                     //
//                     // },
//                     ),
//               ),
//               NewCaseTextField(
//                   validator: Validators.noneEmptyValidator,
//                   labelstyle: header11.copyWith(
//                     color: Colors.black54,
//                   ),
//                   mediaquery: MediaQuery.of(context).size,
//                   controller: TextEditingController(),
//                   keyboard: TextInputType.name,
//                   label: "Quotation Type",
//                   icon: SizedBox(
//                       height: 3.6.h,
//                       child: Image.asset("assets/images/quotationtype.png"))),
//               h1,
//               NewCaseTextField(
//                   validator: Validators.noneEmptyValidator,
//                   labelstyle: header11.copyWith(
//                     color: Colors.black54,
//                   ),
//                   mediaquery: MediaQuery.of(context).size,
//                   controller: TextEditingController(),
//                   keyboard: TextInputType.name,
//                   label: "Customer Name",
//                   icon: SizedBox(
//                       height: 3.6.h,
//                       child: Image.asset("assets/images/quotationtype.png"))),
//               h1,
//               NewCaseTextField(
//                   validator: Validators.noneEmptyValidator,
//                   labelstyle: header11.copyWith(
//                     color: Colors.black54,
//                   ),
//                   mediaquery: MediaQuery.of(context).size,
//                   controller: TextEditingController(),
//                   keyboard: TextInputType.name,
//                   label: "Address",
//                   icon: SizedBox(
//                       height: 3.6.h,
//                       child: Image.asset("assets/images/addresa.png"))),
//               h1,
//               NewCaseTextField(
//                   validator: Validators.noneEmptyValidator,
//                   labelstyle: header11.copyWith(
//                     color: Colors.black54,
//                   ),
//                   mediaquery: MediaQuery.of(context).size,
//                   controller: TextEditingController(),
//                   keyboard: TextInputType.name,
//                   label: "State",
//                   icon: SizedBox(
//                       height: 3.6.h,
//                       child: Image.asset("assets/images/quotationtype.png"))),
//               h1,
//               SizedBox(
//                 height: 56,
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: NewCaseTextField(
//                           validator: Validators.noneEmptyValidator,
//                           labelstyle: header11.copyWith(
//                             color: Colors.black54,
//                           ),
//                           mediaquery: MediaQuery.of(context).size,
//                           controller: TextEditingController(),
//                           keyboard: TextInputType.name,
//                           label: "Quotation  Date",
//                           icon: SizedBox(
//                               height: 3.h,
//                               child:
//                                   Image.asset("assets/images/dateicon.png"))),
//                     ),
//                     Expanded(
//                       child: NewCaseTextField(
//                           validator: Validators.noneEmptyValidator,
//                           labelstyle: header11.copyWith(
//                             color: Colors.black54,
//                           ),
//                           mediaquery: MediaQuery.of(context).size,
//                           controller: TextEditingController(),
//                           keyboard: TextInputType.name,
//                           label: "Expiry Date",
//                           icon: SizedBox(
//                               height: 3.h,
//                               child:
//                                   Image.asset("assets/images/dateicon.png"))),
//                     ),
//                   ],
//                 ),
//               ),
//               h1,
//               CardDetails()
//               // ListView.builder(
//               //   physics: const NeverScrollableScrollPhysics(),
//               //   shrinkWrap: false,
//               //   itemBuilder: (context, index) =>
//               //       selectquotationdetails(context),
//               // ),
//               // selectquotationdetails(context),
//               // Padding(
//               //   padding: const EdgeInsets.only(),
//               //   child: Container(
//               //     constraints: const BoxConstraints(maxHeight: 63),
//               //     child: SearchField(
//               //       searchStyle: header11.copyWith(
//               //         color: Colors.black,
//               //       ),

//               //       suggestionItemDecoration: BoxDecoration(color: bColor2),
//               //       // validator: Validators.noneEmptyValidator,
//               //       // controller: controller.selectcontractor,
//               //       suggestionStyle: header10.copyWith(
//               //           color: Colors.black87, fontFamily: light),
//               //       searchInputDecoration: InputDecoration(
//               //         labelText: 'Quotation Type',
//               //         labelStyle: header11.copyWith(
//               //           color: Colors.black54,
//               //         ),
//               //         suffixIcon:
//               //             const Icon(Icons.arrow_drop_down, color: Colors.grey),
//               //         icon: cImage(
//               //             "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
//               //         enabledBorder: const UnderlineInputBorder(
//               //           borderSide: BorderSide(
//               //               color:
//               //                   //  iserror.value != false
//               //                   //     ? Colors.red
//               //                   //     :
//               //                   Colors.black26,
//               //               width: 1.0),
//               //         ),
//               //       ),
//               //       // suggestions: controller1.selectedDropdowndataModel!.contractors
//               //       //     .map(
//               //       //       (e) => SearchFieldListItem(
//               //       //         e.contractorName.toString(),
//               //       //         child: Text(
//               //       //           "  ${e.contractorName}",
//               //       //           style: header10,
//               //       //         ),
//               //       //         item: e.contractorId,
//               //       //       ),
//               //       //     )
//               //       //     .toList(),
//               //       suggestions: [],
//               //       onSuggestionTap: (value) {
//               //         // controller.contractor.value = value.item.toString();
//               //         print(value.item.toString());
//               //         // type = value.item;
//               //         // print(_workType.text);
//               //         // print(type);
//               //       },
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }

// }
class AddSalesQuotation extends GetView<QuotationController> {
  const AddSalesQuotation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SubmitButtons(
        isLoading: false.obs,
        onTap: () {},
        text: "Submit",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // Header or title widget
                SizedBox(
                    height:
                        16), // Replace with actual `h1` padding if necessary

                ProjectNameTitile(
                  addbutton: const SizedBox(),
                  screenTitile: "Add Quotation",
                  onTap: () {},
                ),

                SizedBox(height: 16), // Replace with `h1`

                // Search Field
                SearchField(
                  searchStyle:
                      header11.copyWith(color: Colors.black, fontSize: 11.sp),
                  suggestionItemDecoration: BoxDecoration(color: bColor2),
                  suggestionStyle: header11.copyWith(color: Colors.black54),
                  controller: TextEditingController(),
                  validator: (p0) {
                    return null;
                  },
                  searchInputDecoration: InputDecoration(
                    labelText: "Quotation Type",
                    hintStyle: header11.copyWith(
                        fontSize: 11.sp, color: Colors.black54),
                    labelStyle: header11.copyWith(
                        color: Colors.black54, fontSize: 12.sp),
                    suffixIcon:
                        const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    icon: SizedBox(
                      height: 3.6.h,
                      child: Image.asset("assets/images/quotationtype.png"),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black26),
                    ),
                  ),
                  suggestions: controller.quotationtype
                      .map((e) => SearchFieldListItem(
                            e,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(e,
                                  style:
                                      header11.copyWith(color: Colors.black)),
                            ),
                          ))
                      .toList(),
                ),

                // SizedBox(height: 16),

                // Text fields
                // NewCaseTextField(
                //   validator: Validators.noneEmptyValidator,
                //   labelstyle: header11.copyWith(color: Colors.black54),
                //   mediaquery: MediaQuery.of(context).size,
                //   controller: TextEditingController(),
                //   keyboard: TextInputType.name,
                //   label: "Quotation Type",
                //   icon: SizedBox(
                //     height: 3.6.h,
                //     child: Image.asset("assets/images/quotationtype.png"),
                //   ),
                // ),

                SizedBox(height: 16), // Replace with `h1`

                NewCaseTextField(
                  validator: Validators.noneEmptyValidator,
                  labelstyle: header11.copyWith(color: Colors.black54),
                  mediaquery: MediaQuery.of(context).size,
                  controller: TextEditingController(),
                  keyboard: TextInputType.name,
                  label: "Customer Name",
                  icon: SizedBox(
                    height: 3.6.h,
                    child: Image.asset("assets/images/quotationtype.png"),
                  ),
                ),

                SizedBox(height: 16), // Replace with `h1`

                NewCaseTextField(
                  validator: Validators.noneEmptyValidator,
                  labelstyle: header11.copyWith(color: Colors.black54),
                  mediaquery: MediaQuery.of(context).size,
                  controller: TextEditingController(),
                  keyboard: TextInputType.name,
                  label: "Address",
                  icon: SizedBox(
                    height: 3.6.h,
                    child: Image.asset("assets/images/addresa.png"),
                  ),
                ),

                SizedBox(height: 16), // Replace with `h1`

                NewCaseTextField(
                  validator: Validators.noneEmptyValidator,
                  labelstyle: header11.copyWith(color: Colors.black54),
                  mediaquery: MediaQuery.of(context).size,
                  controller: TextEditingController(),
                  keyboard: TextInputType.name,
                  label: "State",
                  icon: SizedBox(
                    height: 3.6.h,
                    child: Image.asset("assets/images/quotationtype.png"),
                  ),
                ),

                SizedBox(height: 16), // Replace with `h1`

                // Date fields
                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: NewCaseTextField(
                          validator: Validators.noneEmptyValidator,
                          labelstyle: header11.copyWith(color: Colors.black54),
                          mediaquery: MediaQuery.of(context).size,
                          controller: TextEditingController(),
                          keyboard: TextInputType.name,
                          label: "Quotation Date",
                          icon: SizedBox(
                            height: 3.h,
                            child: Image.asset("assets/images/dateicon.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: NewCaseTextField(
                          validator: Validators.noneEmptyValidator,
                          labelstyle: header11.copyWith(color: Colors.black54),
                          mediaquery: MediaQuery.of(context).size,
                          controller: TextEditingController(),
                          keyboard: TextInputType.name,
                          label: "Expiry Date",
                          icon: SizedBox(
                            height: 3.h,
                            child: Image.asset("assets/images/dateicon.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16), // Replace with `h1`

                // CardDetails widget (to show the list of quotation details)
                CardDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardDetails extends GetView<QuotationController> {
  const CardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        itemCount: controller.quotationlist.value.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap:
            true, // Set to true if the ListView is inside a scrollable widget// Replace with the length of the list you're displaying
        itemBuilder: (context, index) {
          var details = controller.quotationlist.value[index];
          return selectquotationdetails(context, details);
        },
        separatorBuilder: (context, index) =>
            Divider(), // Replace Divider() with any widget you want to use as a separator
      ),
    );
  }

  selectquotationdetails(BuildContext context, Quotationlist details) {
    // HtmlEditorController htmlEditorController = HtmlEditorController();
    var mediaquer = MediaQuery.of(context).size;
    return Column(
      children: [
        Obx(
          () => InkWell(
            radius: 9,
            onTap: () {
              details.istrue.value = !details.istrue.value;
              // controller.boxdetails.value = !controller.boxdetails.value;
              print(details.istrue.value);
              controller.title.text = details.title.toString();
              controller.subtitle.text = details.sub_title.toString();
              controller.description.text = details.description.toString();
              controller.products.value = details.products.toString();
              controller.warranty.text = details.warranty.toString();
              controller.methodapplication.text =
                  details.method.toString();
              controller.notes.text = details.notes.toString();
              print(details.products.toString());

              // controller.title.text = details.title.toString();
              // controller.title.text = details.title.toString();
              // controller.title.text = details.title.toString();
            },
            child: Container(
              height: 7.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 70.w,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        details.title.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: Medium,
                            color: Colors.white),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      details.istrue.value
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: bColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(details.istrue.value ? 0 : 10),
                      bottomRight:
                          Radius.circular(details.istrue.value ? 0 : 10),
                      topLeft: const Radius.circular(10),
                      topRight: const Radius.circular(10))),
            ),
          ),
        ),
        Obx(
          () => details.istrue.value
              ? Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 236, 236, 233),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              minLines: 2,
                              maxLines: 10,
                              controller: controller.title,
                              decoration: InputDecoration(
                                label: Text(
                                  'Title',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              minLines: 2,
                              maxLines: 10,
                              controller: controller.subtitle,
                              decoration: InputDecoration(
                                label: Text(
                                  'Sub Title',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              minLines: 2,
                              maxLines: 10,
                              controller: controller.description,
                              decoration: InputDecoration(
                                label: Text(
                                  'Description',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 8),
                                child: Text(
                                  "Products",
                                  style: header11.copyWith(
                                    fontSize: 9.sp,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Html(
                                data: details.products,
                                style: {
                                  "p": Style(
                                    fontSize: FontSize.medium,
                                    color: Colors.black87,
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                        //         HtmlEditor(
                        // controller: htmlEditorController,
                        // htmlEditorOptions: HtmlEditorOptions(
                        //   hint: 'Your text here...',
                        //   shouldEnsureVisible: true,
                        //   //initialText: "<p>text content initial, if any</p>",
                        // ),
                        // htmlToolbarOptions: HtmlToolbarOptions(
                        //   toolbarPosition: ToolbarPosition.aboveEditor, //by default
                        //   toolbarType: ToolbarType.nativeScrollable, //by default
                        //   onButtonPressed:
                        //       (ButtonType type, bool? status, Function? updateStatus) {
                        //     // print(
                        //     //     "button '${describeEnum(type)}' pressed, the current selected status is $status");
                        //     return true;
                        //   },
                        //   onDropdownChanged: (DropdownType type, dynamic changed,
                        //       Function(dynamic)? updateSelectedItem) {
                        //     // print(
                        //     //     "dropdown '${describeEnum(type)}' changed to $changed");
                        //     return true;
                        //   },
                        //   mediaLinkInsertInterceptor:
                        //       (String url, InsertFileType type) {
                        //     print(url);
                        //     return true;
                        //   },
                        //   // mediaUploadInterceptor:
                        //   //     (PlatformFile file, InsertFileType type) async {
                        //   //   print(file.name); //filename
                        //   //   print(file.size); //size in bytes
                        //   //   print(file.extension); //file extension (eg jpeg or mp4)
                        //   //   return true;
                        //   // },
                        // ),),
                        // HtmlEditor(
                        //   controller: htmlEditorController,
                        //   htmlEditorOptions: HtmlEditorOptions(
                        //     hint: 'Your text here...',
                        //     shouldEnsureVisible: true,
                        //   ),
                        //   htmlToolbarOptions: HtmlToolbarOptions(
                        //     toolbarPosition: ToolbarPosition.aboveEditor,
                        //     toolbarType: ToolbarType.nativeScrollable,
                        //     onButtonPressed: (ButtonType type, bool? status,
                        //         Function? updateStatus) {
                        //       return true;
                        //     },
                        //     onDropdownChanged: (DropdownType type,
                        //         dynamic changed,
                        //         Function(dynamic)? updateSelectedItem) {
                        //       return true;
                        //     },
                        //     mediaLinkInsertInterceptor:
                        //         (String url, InsertFileType type) {
                        //       print(url);
                        //       return true;
                        //     },
                        //   ),
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.white),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 5, vertical: 2),
                        //     child: TextFormField(
                        //       controller: controller.products,
                        //       decoration: InputDecoration(
                        //         label: Text(
                        //           'Products',
                        //           style: header11.copyWith(
                        //             color: Colors.black54,
                        //           ),
                        //         ),
                        //         // hintText: 'Enter text',
                        //         border:
                        //             InputBorder.none, // Removes the underline
                        //         enabledBorder: InputBorder
                        //             .none, // No underline when enabled
                        //         focusedBorder: InputBorder
                        //             .none, // No underline when focused
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              controller: controller.warranty,
                              decoration: InputDecoration(
                                label: Text(
                                  'Warranty',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5, top: 8),
                                child: Text(
                                  'Method of Application',
                                  style: header11.copyWith(
                                    fontSize: 9.sp,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              Html(
                                data: details.method,
                                style: {
                                  "p": Style(
                                    fontSize: FontSize.medium,
                                    color: Colors.black87,
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(10),
                        //       color: Colors.white),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 5, vertical: 2),
                        //     child: TextFormField(
                        //       controller: controller.methodapplication,
                        //       decoration: InputDecoration(
                        //         label: Text(
                        //           'Method of Application',
                        //           style: header11.copyWith(
                        //             color: Colors.black54,
                        //           ),
                        //         ),
                        //         // hintText: 'Enter text',
                        //         border:
                        //             InputBorder.none, // Removes the underline
                        //         enabledBorder: InputBorder
                        //             .none, // No underline when enabled
                        //         focusedBorder: InputBorder
                        //             .none, // No underline when focused
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        h2,
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextFormField(
                              minLines: 2,
                              maxLines: 10,
                              controller: controller.notes,
                              decoration: InputDecoration(
                                label: Text(
                                  'Notes',
                                  style: header11.copyWith(
                                    color: Colors.black54,
                                  ),
                                ),
                                // hintText: 'Enter text',
                                border:
                                    InputBorder.none, // Removes the underline
                                enabledBorder: InputBorder
                                    .none, // No underline when enabled
                                focusedBorder: InputBorder
                                    .none, // No underline when focused
                              ),
                            ),
                          ),
                        ),
                        h2,
                        Container(
                          height: 8.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              w1,
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Amount/Sqft",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: regular),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                      // width: 30.w,
                                      child: Center(
                                          child: SizedBox(
                                        width: 21.w,
                                        child: Center(
                                          child: Text(
                                            details.unit_price.toString(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Medium),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )),
                                    )
                                  ]),
                              const VerticalDivider(
                                thickness: 1,
                                color: Colors.black38,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Approx.sqft",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: regular),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                      // width: 30.w,
                                      child: Center(
                                          child: SizedBox(
                                        width: 21.w,
                                        child: Center(
                                          child: Text(
                                            "54",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Medium),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )),
                                    )
                                  ]),
                              const VerticalDivider(
                                thickness: 1,
                                color: Colors.black38,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Total Amount",
                                      style: TextStyle(
                                          fontSize: 12, fontFamily: Medium),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                      // width: 30.w,
                                      child: Center(
                                          child: SizedBox(
                                        width: 21.w,
                                        child: Center(
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                                fontSize: 12, fontFamily: Bold),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      )),
                                    )
                                  ]),
                              // const VerticalDivider(
                              //   thickness: 1,
                              //   color: Colors.black38,
                              //   indent: 10,
                              //   endIndent: 10,
                              // ),
                              w1,
                              Container(
                                width: 8.w,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.horizontal(
                                      right: Radius.circular(10)),
                                  color: bColor,
                                ),
                                height: mediaquer.height,
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        h2,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: SubmitButtons(
                              color: const Color.fromARGB(255, 19, 103, 23),
                              isLoading: false.obs,
                              onTap: () {},
                              text: "Update"),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox(),
        )
      ],
    );
  }
}
