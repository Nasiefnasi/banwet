import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/model/ProjectModel/project_assign.dart';
import '../../../../data/service/assigend_project/get_assigned_project.dart';

class ProjectViewController extends GetxController {
  var filteredData = <ProjectData>[].obs; // the filtered list of data
  var controller = TextEditingController();
  var searchText = "".obs;
  AssignProjectModel? assignProjectModel;
  //  get data from api (assigend peoject);
  getDetails() async {
    var result = await AssignedProject().getAssignedProject();
    assignProjectModel = result;
    if (assignProjectModel == null) {
      filteredData.clear();
    } else {
      filteredData.value = assignProjectModel!.data!.toList();
    }

    filteredData.refresh();
    update();
  }

  // filtering data from  by search
  filterData() {
    if (searchText.value.isEmpty) {
      filteredData.value = assignProjectModel!.data!.toList();
      update();
      print(1);
    } else {
      filteredData.value = assignProjectModel!.data!
          .where((data) =>
              data.workName!.toString().toLowerCase().contains(searchText))
          .toList(); // filter the data based on search text
      print(2);
      log(filteredData.length.toString());
      update();
    }
  }

  @override
  void onInit() async {
    super.onInit();
    getDetails();
  }
}
