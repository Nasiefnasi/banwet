import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';
import 'package:banwet/app/common_widegt/datatimepicker.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/controllers/labour_wageslip_controller.dart';
import 'package:banwet/app/modules/project_modules/labour/labour_wageslip/views/component/groupwageslipListpage.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';

class GroupWage extends GetView<LabourWageslipController> {
  const GroupWage({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode foucskey = FocusNode();
    RxString selectlabour = "".obs;
    TextEditingController text = TextEditingController();
    List<String> document_type = ["A", "B", "C", "D"];
    RxDouble balance_group = 0.0.obs;
    RxString date = "".obs;
    RxInt count = 0.obs;
    final RxBool iserror = false.obs;
    TextEditingController groupwageselect = TextEditingController();
    dynamic team_leader_id = "";

    return
        //  Obx(
        //   () =>
        Scaffold(
            body: SafeArea(
                child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          h1,
          ProjectNameTitile(
            addbutton: const SizedBox(),
            projectName: controller.argumentData["workname"],
            screenTitile: "Group Wage Slips",
            onTap: () {
              // Get.to(() => AddLabourActivity());
            },
          ),
          h4,
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          iserror.value == true ? Colors.red : Colors.black26,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SearchField(
                    focusNode: foucskey,
                    suggestionItemDecoration: BoxDecoration(color: bColor2),
                    validator: Validators.noneEmptyValidator,
                    controller: groupwageselect,
                    suggestionStyle: header10.copyWith(
                        color: Colors.black87, fontFamily: light),
                    searchInputDecoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Select Labour',
                      labelStyle: header11.copyWith(
                        color: Colors.black45,
                      ),
                      suffixIcon:
                          const Icon(Icons.arrow_drop_down, color: Colors.grey),
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    suggestions: (controller.groupWageLabours?.labours ?? [])
                        .map(
                          (e) => SearchFieldListItem(
                            e.labourName.toString(),
                            child: Text(
                              "  ${e.labourName}",
                              style: header10,
                            ),
                            item: e, // Use the whole object here
                          ),
                        )
                        .toList(),
                    onSuggestionTap: (value) async {
                      selectlabour.value = "";
                      controller.groupquickWage.clear();

                      final selectedLabor = value.item;
                      if (selectedLabor != null) {
                        selectlabour.value = value.item!.labourName.toString();
                        team_leader_id = selectedLabor.labourId!.toString();
                        balance_group.value = double.parse(
                            selectedLabor.currentBalanceGroup.toString());

                        controller.groupwagelabour.value =
                            selectedLabor.labourGroup.toString() ?? "";
                        print(
                            'Selected Labor Name: ${selectedLabor.labourName.toString()}');
                        print('Selected Labor Type: ${selectedLabor.labourId}');
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          h2,
          Obx(() {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          iserror.value != false ? Colors.red : Colors.black26,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      count.value++;
                    },
                    child: Center(
                      child: DateTimePickers(
                          onChanged: (p0) {
                            date.value = p0.toString();
                          },
                          labelStyle: header11.copyWith(
                            color: Colors.black45,
                          ),
                          style: TextStyle(fontSize: 12, fontFamily: Medium),
                          // validator: Validators.noneEmptyValidator,
                          controller: controller.groupWagedate,
                          // count.value > 0 ? controller.groupWagedate : text,
                          enabledBorder: InputBorder.none,
                          label: "Work Date"),
                    ),
                  ),
                ),
              ),
            );
          }),
          h5,
          SubmitButtons(
            radius: 5.0,
            isLoading: controller.addlaboursLoading,
            text: "Get Team Members",
            onTap: () async {
              print(
                  "HHHHHHHHHHHHHHHHHHHHHHEEEEEEEEEEEEEEEEEEEEEEEEEEEELLLLLLLLLLLLLLLLLLLLLLOOOOOOOOOOOOO${controller.groupWagedate.text}");
              if (selectlabour.value.isNotEmpty) {
                count.value = 0;
                iserror.value = false;
                controller.groupquickWage.clear();
                if (selectlabour.value.isNotEmpty) {}
                print("sbgasdogdasifip");
                print(balance_group);
                controller.groupWageLabourfilterlist = null;
                controller.addLabourList(
                    "", controller.groupwagelabour.value.toString());

                // Navigate to the Groupwagesliplist page and pass refresh data
                final result = await Get.to(Groupwagesliplist(
                    team_leader_id.toString(),
                    balance_group,
                    controller.groupWagedate.text));

                // Check the result and refresh the page if needed

                if (result == 'refresh') {
                  selectlabour.value = '';
                  // Implement refresh logic here, e.g., reset state or fetch new data
                  groupwageselect.clear();

                  balance_group.value = 0;
                  count.value = 0;
                  // controller.groupWagedate.clear();
                }
              } else {
                iserror.value = true;
              }
            },
          ),
        ],
      ),
    )));

    // );
  }
}
