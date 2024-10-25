import 'package:banwet/app/Style/const.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AddSalesQuotatiom extends StatelessWidget {
  const AddSalesQuotatiom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
            child: Column(
          children: [
            h1,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ProjectNameTitile(
                addbutton: const SizedBox(),
                screenTitile: "Add Quotation",
                onTap: () {},
              ),
            ),
            h1,
            NewCaseTextField(
                validator: Validators.noneEmptyValidator,
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: TextEditingController(),
                keyboard: TextInputType.name,
                label: "Quotation Type",
                icon: SizedBox(
                    height: 3.6.h,
                    child: Image.asset("assets/images/quotationtype.png"))),
            h1,
            NewCaseTextField(
                validator: Validators.noneEmptyValidator,
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: TextEditingController(),
                keyboard: TextInputType.name,
                label: "Customer Name",
                icon: SizedBox(
                    height: 3.6.h,
                    child: Image.asset("assets/images/quotationtype.png"))),
            h1,
            NewCaseTextField(
                validator: Validators.noneEmptyValidator,
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: TextEditingController(),
                keyboard: TextInputType.name,
                label: "Address",
                icon: SizedBox(
                    height: 3.6.h,
                    child: Image.asset("assets/images/addresa.png"))),
            h1,
            NewCaseTextField(
                validator: Validators.noneEmptyValidator,
                labelstyle: header11.copyWith(
                  color: Colors.black54,
                ),
                mediaquery: MediaQuery.of(context).size,
                controller: TextEditingController(),
                keyboard: TextInputType.name,
                label: "State",
                icon: SizedBox(
                    height: 3.6.h,
                    child: Image.asset("assets/images/quotationtype.png"))),
            h1,
            SizedBox(
              height: 56,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: NewCaseTextField(
                        validator: Validators.noneEmptyValidator,
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        controller: TextEditingController(),
                        keyboard: TextInputType.name,
                        label: "Quotation  Date",
                        icon: SizedBox(
                            height: 3.h,
                            child: Image.asset("assets/images/dateicon.png"))),
                  ),
                  Expanded(
                    child: NewCaseTextField(
                        validator: Validators.noneEmptyValidator,
                        labelstyle: header11.copyWith(
                          color: Colors.black54,
                        ),
                        mediaquery: MediaQuery.of(context).size,
                        controller: TextEditingController(),
                        keyboard: TextInputType.name,
                        label: "Expiry Date",
                        icon: SizedBox(
                            height: 3.h,
                            child: Image.asset("assets/images/dateicon.png"))),
                  ),
                ],
              ),
            ),
            h1,
            Container(
              height: 7.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "PU FLEX 8.STEP",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: Medium,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: bColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
            h1,
            Container(
              height: 7.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "PU FLEX + PU COAT 8.STEP",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: Medium,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: bColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(),
            //   child: Container(
            //     constraints: const BoxConstraints(maxHeight: 63),
            //     child: SearchField(
            //       searchStyle: header11.copyWith(
            //         color: Colors.black,
            //       ),

            //       suggestionItemDecoration: BoxDecoration(color: bColor2),
            //       // validator: Validators.noneEmptyValidator,
            //       // controller: controller.selectcontractor,
            //       suggestionStyle: header10.copyWith(
            //           color: Colors.black87, fontFamily: light),
            //       searchInputDecoration: InputDecoration(
            //         labelText: 'Quotation Type',
            //         labelStyle: header11.copyWith(
            //           color: Colors.black54,
            //         ),
            //         suffixIcon:
            //             const Icon(Icons.arrow_drop_down, color: Colors.grey),
            //         icon: cImage(
            //             "https://cdn-icons-png.flaticon.com/512/3135/3135791.png"),
            //         enabledBorder: const UnderlineInputBorder(
            //           borderSide: BorderSide(
            //               color:
            //                   //  iserror.value != false
            //                   //     ? Colors.red
            //                   //     :
            //                   Colors.black26,
            //               width: 1.0),
            //         ),
            //       ),
            //       // suggestions: controller1.selectedDropdowndataModel!.contractors
            //       //     .map(
            //       //       (e) => SearchFieldListItem(
            //       //         e.contractorName.toString(),
            //       //         child: Text(
            //       //           "  ${e.contractorName}",
            //       //           style: header10,
            //       //         ),
            //       //         item: e.contractorId,
            //       //       ),
            //       //     )
            //       //     .toList(),
            //       suggestions: [],
            //       onSuggestionTap: (value) {
            //         // controller.contractor.value = value.item.toString();
            //         print(value.item.toString());
            //         // type = value.item;
            //         // print(_workType.text);
            //         // print(type);
            //       },
            //     ),
            //   ),
            // ),
          ],
        )),
      ),
    );
  }
}
