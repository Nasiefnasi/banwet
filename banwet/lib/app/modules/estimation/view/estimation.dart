import 'package:banwet/app/common_widegt/common2date.dart';
import 'package:banwet/app/modules/estimation/view/addestimation.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesEstimation extends StatelessWidget {
  const SalesEstimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: ProjectNameTitile(
                screenTitile: "Estimation",
                onTap: () {
                  Get.to(const Addestimation());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Common2Date(
                ontap: () {},
                statDate: TextEditingController(),
                endDate: TextEditingController(),
                onPressed: () {},
              ),
            ),
          ],
        )),
      ),
    );
  }
}
