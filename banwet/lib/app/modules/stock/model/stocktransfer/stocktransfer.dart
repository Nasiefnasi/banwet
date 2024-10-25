import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';

import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/modules/stock/controllers/stockcontrollers.dart';
import 'package:banwet/app/style/const.dart';

class StockTransfer extends StatelessWidget {
  StockTransfer({super.key});

  final StockControllers controller = Get.put(StockControllers());

  @override
  Widget build(BuildContext context) {
    // Separate controllers for different fields

    TextEditingController dateController = TextEditingController();

    List<String> documentType = ["A", "B", "C", "D"];
    RxInt balanceGroup = 0.obs;
    RxString date = "".obs;
    RxInt count = 0.obs;
    final RxBool isError = false.obs;
    dynamic teamLeaderId = "";

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.key,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  h1,
                  ProjectNameTitile(
                    addbutton: const SizedBox(),
                    projectName: controller.argumentData["workname"],
                    screenTitile: "Stock Transfer",
                    onTap: () {
                      // Handle tap event
                    },
                  ),
                  GetBuilder<StockControllers>(
                    builder: (controller) {
                      return controller.stocktransferModel == null
                          ? Center(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height * .5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [loadingthreebounce],
                                ),
                              ),
                            )
                          : Column(
                              children: [
                                h2,
                                Obx(() {
                                  return Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: isError.value
                                              ? Colors.red
                                              : Colors.black26,
                                          width: 1.0),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SearchField(
                                        suggestionItemDecoration:
                                            BoxDecoration(color: bColor2),
                                        validator:
                                            Validators.noneEmptyValidator,
                                        controller: controller.groupwageselect,
                                        suggestionStyle: header10.copyWith(
                                            color: Colors.black87,
                                            fontFamily: light),
                                        searchInputDecoration: InputDecoration(
                                          border: InputBorder.none,
                                          labelText: 'Select Stock Location',
                                          labelStyle: header11.copyWith(
                                            color: Colors.black54,
                                          ),
                                          suffixIcon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.grey,
                                          ),
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                        ),
                                        suggestions:
                                            controller.stocktransferModel!.data
                                                .map(
                                                  (e) => SearchFieldListItem(
                                                    e.locationName.toString(),
                                                    child: Text(
                                                      "  ${e.locationName}",
                                                      style: header10,
                                                    ),
                                                    item:
                                                        e, // Use the whole object here
                                                  ),
                                                )
                                                .toList(),
                                        onSuggestionTap: (value) async {
                                          final selectedLabor = value.item;
                                          print(
                                              "hhhhhhhhhhhhheeeeeeeeeeeeeeeeeellllllllllllllllloooooooooooooooo   ${selectedLabor!.locationId.toString()}");
                                          controller.locationId.value =
                                              selectedLabor.locationId
                                                  .toString();
                                          // Handle selection logic here
                                        },
                                      ),
                                    ),
                                  );
                                }),
                                h2,
                                Obx(() {
                                  return Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isError.value
                                            ? Colors.red
                                            : Colors.black26,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          count.value++;
                                        },
                                        child: Center(
                                          child: DateTimePickers(
                                            onChanged: (p0) {
                                              date.value = p0.toString();
                                            },
                                            labelStyle: header4.copyWith(
                                                color: Colors.black38),
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: Medium,
                                            ),
                                            validator:
                                                Validators.noneEmptyValidator,
                                            controller:
                                                controller.Stocktransferdate,
                                            enabledBorder: InputBorder.none,
                                            label: "Transfer Date",
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                                h5,
                                SubmitButtons(
                                    radius: 5.5,
                                    isLoading: controller.isLoading,
                                    onTap: () async {
                                      // FocusScope.of(context).unfocus();
                                      if (controller.key.currentState!
                                              .validate() &&
                                          controller.groupwageselect.text
                                              .isNotEmpty) {
                                        isError.value = false;
                                        controller.stocktranferIdpost(
                                            controller.locationId.value,
                                            context);
                                      } else {
                                        isError.value = true;
                                      }
                                    },
                                    text: "Submit")
                              ],
                            );
                    },
                    init: StockControllers(),
                  ),

                  // Implement the submit button or additional UI here
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
