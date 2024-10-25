import 'package:banwet/app/common_widegt/common_icontextform_feild.dart';
import 'package:banwet/app/index.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AddMaterialsPage extends StatelessWidget {
  const AddMaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SubmitButtons(
          isLoading: false.obs,
          onTap: () {},
          text: "Submit",
          radius: 5.0,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: ProjectNameTitile(
                  addbutton: const SizedBox(),
                  screenTitile: "Add Materials",
                  onTap: () {
                    // Get.to(AddSalesQuotatio m());
                  },
                ),
              ),
              h2,
              Row(
                children: [
                  Expanded(
                    child: NewCaseTextField(
                        validator: Validators.noneEmptyValidator,
                        labelstyle: header11.copyWith(
                            color: Colors.black54, fontSize: 12),
                        mediaquery: MediaQuery.of(context).size,
                        controller: TextEditingController(),
                        keyboard: TextInputType.name,
                        label: "Net Total Amount",
                        icon: SizedBox(
                            height: 2.h,
                            child:
                                Image.asset("assets/images/phoneicona.png"))),
                  ),
                  w2,
                  Expanded(
                    child: NewCaseTextField(
                      validator: Validators.noneEmptyValidator,
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      mediaquery: MediaQuery.of(context).size,
                      controller: TextEditingController(),
                      keyboard: TextInputType.name,
                      label: "GST Amount",
                      icon: SizedBox(
                          height: 2.h,
                          child: Image.asset("assets/images/phoneicona.png")),
                    ),
                  ),
                ],
              ),
              h1,
              Row(
                children: [
                  Expanded(
                    child: NewCaseTextField(
                        validator: Validators.noneEmptyValidator,
                        labelstyle: header11.copyWith(
                            color: Colors.black54, fontSize: 12),
                        mediaquery: MediaQuery.of(context).size,
                        controller: TextEditingController(),
                        keyboard: TextInputType.name,
                        label: "Net Total Amount",
                        icon: SizedBox(
                            height: 2.h,
                            child:
                                Image.asset("assets/images/phoneicona.png"))),
                  ),
                  w2,
                  Expanded(
                    child: NewCaseTextField(
                      validator: Validators.noneEmptyValidator,
                      labelstyle: header11.copyWith(
                        color: Colors.black54,
                      ),
                      mediaquery: MediaQuery.of(context).size,
                      controller: TextEditingController(),
                      keyboard: TextInputType.name,
                      label: "GST Amount",
                      icon: SizedBox(
                          height: 2.h,
                          child: Image.asset("assets/images/phoneicona.png")),
                    ),
                  ),
                ],
              ),
              h4,
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Net Total",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontFamily: Medium),
                ),
                height: 9.5.h,
                width: 55.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.amber,
                ),
              ),
              h3,
              const Divider(
                endIndent: 2,
                indent: 2,
                thickness: 1,
                color: Colors.black26,
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => descriptionside(
                            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia",
                            () {},
                          ),
                        ),
                        h2,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Container(
                            decoration: BoxDecoration(
                                color: bColor,
                                borderRadius: BorderRadius.circular(5)),
                            height: 7.5.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                w05,
                                Text(
                                  "Add Terms and Conditions",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: regular,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        h1,
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container descriptionside(
    text,
    Function()? onTap,
  ) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.black38,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                text,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 3.h,
                  child: Image.asset("assets/images/editicons.png"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
