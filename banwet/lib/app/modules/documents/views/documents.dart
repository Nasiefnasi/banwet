import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sizer/sizer.dart';
import 'package:banwet/app/common_widegt/loading.dart';
import 'package:banwet/app/modules/documents/controller/document_controller.dart';
// import 'package:banwet/app/modules/documents/controller/Document_controller.dart';

import 'package:banwet/app/modules/project_modules/meterial_purchas/materialpurchase_home.dart';
import 'package:banwet/app/style/const.dart';

class DocumentsPage extends GetView<DocumentControllers> {
  const DocumentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // void urllauncher(String uri, bool inapp) async {
    //   final Uri url = Uri.parse("https://www.freepik.com/");
    //   print(url);
    //   try {
    //     if (await canLaunchUrl(url)) {
    //       // if (inapp) {
    //       await launchUrl(
    //         url,
    //         mode: LaunchMode.inAppBrowserView,
    //       );
    //       // } else {
    //       //   await launchUrl(url, mode: LaunchMode.i);
    //       // }
    //     }
    //   } catch (e) {
    //     print(e);
    //   }
    // }

    void urllauncher(String uri, bool inapp) async {
      final Uri url = Uri.parse("https://www.google.com");
      print(url);
      try {
        if (await canLaunchUrl(url)) {
          // if (inapp) {
          await launchUrl(
            url,
            mode: LaunchMode.inAppBrowserView, // Correct LaunchMode
          );
          // } else {
          //   await launchUrl(
          //     url,
          //     mode: LaunchMode.inAppBrowserView, // For external browser
          //   );
          // }
        } else {
          print('Could not launch $url');
        }
      } catch (e) {
        print('Error: $e');
      }
    }

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            h1,
            ProjectNameTitile(
              size: 80.w,
              addbutton: const SizedBox(),
              projectName: controller.arugumentData["workname"],
              screenTitile: "Project Documents",
              onTap: () {},
            ),
            h1,
            Expanded(
                child: GetBuilder<DocumentControllers>(
              builder: (controller) => Obx(
                () => controller.documentloading.value == true
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [loadingthreebounce],
                      ))
                    : controller.projectDocument == null ||
                            controller.projectDocument!.data.length == 0
                        ? Center(
                            child: Lottie.asset(
                                repeat: false,
                                "assets/images/qrbRtDHknE.json",
                                height: 250),
                          )
                        : ListView.builder(
                            itemCount: controller.projectDocument!.data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 1.5.h,
                                    vertical: 1.5.h,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bColor,
                                  ),
                                  height: 50,
                                  child: Row(
                                    // crossAxisAlignment,
                                    children: [
                                      Text(
                                        // "hello ----------",
                                        controller
                                            .projectDocument!.data[index].title,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: Medium,
                                            color: Colors.white),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        radius: 20,
                                        onTap: () async {
                                          print(
                                              "this is working"); // controller.slaunchUrl();

                                          var url = Uri.parse(controller
                                              .projectDocument!.data[index].file
                                              .toString());
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(
                                              url,
                                            );
                                          } else {
                                            throw 'Could not launch $url';
                                          }

                                          // _launchURLBrowser() async {
                                          //   var url = Uri.parse(
                                          //       "https://www.geeksforgeeks.org/");
                                          //   if (await canLaunchUrl(url)) {
                                          //     await launchUrl(url);
                                          //   } else {
                                          //     throw 'Could not launch $url';
                                          //   }
                                          // }
                                        },
                                        //  urllauncher(
                                        //     controller.projectDocument!
                                        //         .data[index].file,
                                        //     false),
                                        child: SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: Image.asset(
                                            "assets/images/documenticons.png",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
              init: DocumentControllers(),
            ))
          ],
        ),
      )),
    );
  }
}
