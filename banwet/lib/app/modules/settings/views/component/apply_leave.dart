import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:banwet/app/modules/daily_note/views/add_dailynote.dart';
import 'package:banwet/app/modules/settings/controllers/settings_controller.dart';
import 'package:banwet/app/modules/settings/views/component/controler/applyleavecontroler.dart';
import 'package:banwet/app/style/const.dart';

// class ApplyLeaveUI extends  GetView<Applyleavecontroler> {
//   const ApplyLeaveUI({super.key});

//   @override
//   Widget build(BuildContext context) {
//     SettingsController controller = Get.put(SettingsController());
//     // TextEditingController text = TextEditingController();
//     var mediaquery = MediaQuery.of(context).size;
//     Applyleavecontroler controllers2 = Applyleavecontroler();

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.chevron_left),
//         ),
//         title: Text(
//           "Leave Application",
//           style: TextStyle(fontFamily: Medium, fontSize: 22),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: InkWell(
//                 onTap: () {
//                   controller.newcasedate(context);
//                 },
//                 child: Card(
//                   elevation: 0,
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           const SizedBox(width: 4),
//                           SizedBox(
//                               width: 24,
//                               child: Image.asset(
//                                 "assets/images/uil_calender.png",
//                               )),
//                           //  Icon(
//                           //   Icons.note,
//                           //   color: Colors.black12,
//                           // ),
//                           // const SizedBox(width: 10),
//                           w5,
//                           GetBuilder<SettingsController>(
//                             builder: (controller) {
//                               return Text(
//                                 maxLines: 1,
//                                 controller.selectedDates.isNotEmpty
//                                     ? _formatSelectedDates(
//                                         controller.selectedDates)
//                                     : "Select dates",
//                                 style: const TextStyle(
//                                   fontFamily: 'regular',
//                                   color: Colors.black38,
//                                   fontWeight: FontWeight.w400,
//                                   fontSize: 16,
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       const Divider(
//                         color: Colors.black26,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

// //             Center(
// //   child: LeaveResonfiled(
// //     bordercolor: Colors.black26,
// //     icons: Padding(
// //       padding: const EdgeInsets.only(bottom: 20, right: 18, left: 1),
// //       child: Image.asset(
// //         "assets/images/resonicon.png",
// //         fit: BoxFit.fill,
// //       ),
// //     ),
// //     mediaquery: MediaQuery.of(context).size,
// //     controller: TextEditingController(),
// //     obscureText: false,
// //     hinttexts: "Reason",
// //     maxLine: 10,
// //     minline: 6,
// //   ),
// // ),
//             Center(
//               child: LeaveResonfiled(
//                 bordercolor: Colors.black26,
//                 icons: Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: Container(
//                     width: 30,
//                     child: Image.asset(
//                       "assets/images/resonicon.png",
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 mediaquery: MediaQuery.of(context).size,
//                 controller: controllers2.tst,
//                 obscureText: false,
//                 hinttexts: "Reason",
//                 maxLine: 4,
//                 minline: 1,
//               ),
//             ),
//             TextField(
//               controller: controllers2.tst1,
//               decoration: InputDecoration(
//                 // contentPadding: contentPadding,
//                 border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black87),
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.black87, width: 1.0),
//                 ),
//                 errorBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     style: BorderStyle.solid,
//                     color: Colors.red,
//                     width: 1,
//                   ),
//                 ),
//                 focusedErrorBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     style: BorderStyle.solid,
//                     color: const Color.fromARGB(255, 211, 211, 211),
//                     width: 1,
//                   ),
//                 ),
//                 fillColor: Colors.white,
//                 filled: true,
//                 // suffixIcon: sufixicon,
//                 prefixIcon: Container(
//                   width: 30,
//                   alignment: Alignment.topRight,
//                   padding: const EdgeInsets.only(
//                     bottom: 80,
//                     right: 18,
//                     left: 1,
//                     top: 10
//                   ),
//                   child:  Image.asset(
//                       "assets/images/resonicon.png",
//                       fit: BoxFit.fill,
//                     ),
//                 ),
//                 hintText: "Reason",
//                 hintStyle: TextStyle(
//                   fontFamily: regular,
//                   color: Colors.black38,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 16,
//                 ),
//                 errorStyle: const TextStyle(
//                   fontSize: 12,
//                   height: 0.01,
//                   color: Color.fromARGB(255, 219, 199, 198),
//                 ),
//               ),
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 25),
//             //   child: NewCaseTextField(mediaquery: mediaquery, controller: text, keyboard: TextInputType.emailAddress, label: "Reson",  prefix :       Container(
//             //           // width: 15,
//             //           child: Image.asset(scale: 1
//             //             "assets/images/resonicon.png",
//             //             // fit: BoxFit.fill,
//             //           ),
//             //         ),
//             //       ),
//             // ),

//             // Container(
//             //   width: mediaquery.width * .85,
//             //   height: 60,

//             //   child: ElevatedButton(
//             //       onPressed: () {},
//             //       child: Text(
//             //         "Apply",
//             //         style: TextStyle(fontFamily: Medium, fontSize: 18),
//             //       )),
//             // )

//             const Spacer(),

//             SizedBox(
//               width: mediaquery.width * 0.85,
//               height: 60,
//               child: ElevatedButton(
//                 onPressed: () {
//                   controllers2.applyleavefunction(
//                       controller.userDetailsModel!.userId,
//                       _formatSelectedDates(controller.selectedDates),
//                       controllers2.LeaveResonfiled.text);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 0, 106, 151),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   // Button color
//                 ),
//                 child: const Text(
//                   "Apply",
//                   style: TextStyle(
//                       fontFamily: 'Medium', fontSize: 18, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatSelectedDates(List<DateTime> dates) {
//     List<String> formattedDates = [];
//     for (int i = 0; i < dates.length; i += 2) {
//       if (i + 1 < dates.length) {
//         formattedDates.add(
//             "${dates[i].day}-${dates[i].month}-${dates[i].year} , ${dates[i + 1].day}-${dates[i + 1].month}-${dates[i + 1].year}");
//       } else {
//         formattedDates
//             .add("${dates[i].day}-${dates[i].month}-${dates[i].year}");
//       }
//     }
//     return formattedDates.join("\n");
//   }
// }

class ApplyLeaveUI extends StatefulWidget {
  const ApplyLeaveUI({super.key});

  @override
  _ApplyLeaveUIState createState() => _ApplyLeaveUIState();
}

class _ApplyLeaveUIState extends State<ApplyLeaveUI> {
  late TextEditingController _leaveReasonController;
  late Applyleavecontroler _applyLeaveControler;

  @override
  void initState() {
    super.initState();
    _leaveReasonController = TextEditingController();
    _applyLeaveControler = Applyleavecontroler();
  }

  @override
  void dispose() {
    _leaveReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    Applyleavecontroler controller1 = Get.put(Applyleavecontroler());
    var mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(
          "Leave Application",
          style: TextStyle(fontFamily: Medium, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  controller.newcasedate(context);
                },
                child: Card(
                  elevation: 0,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          SizedBox(
                              width: 24,
                              child: Image.asset(
                                "assets/images/uil_calender.png",
                              )),
                          w5,
                          GetBuilder<SettingsController>(
                            builder: (controller) {
                              return Text(
                                maxLines: 4,
                                controller.selectedDates.isNotEmpty
                                    ? _formatSelectedDates(
                                        controller.selectedDates)
                                    : "Select dates",
                                style: controller.selectedDates.isEmpty
                                    ? const TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.black38,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      )
                                    : const TextStyle(
                                        fontFamily: 'regular',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Obx(
                        () => Divider(
                          color: controller1.validatecolor.value
                              ? Colors.red
                              : Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Form(
              key: _applyLeaveControler.key3,
              child: Center(
                child: LeaveResonfiled(
                  validator: (p0) {
                    if (p0 == null || p0.isEmpty) {
                      // return 'Please enter an email address';
                      return "";
                    }

                    return "";
                  },
                  bordercolor: Colors.black26,
                  icons: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 30,
                      child: Image.asset(
                        "assets/images/resonicon.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  mediaquery: MediaQuery.of(context).size,
                  controller: _applyLeaveControler.LeaveResonfiled,
                  obscureText: false,
                  hinttexts: "Reason",
                  maxLine: 4,
                  minline: 1,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SubmitButton(
                  onTap: () {
                    if (_applyLeaveControler.key3.currentState!.validate() ||
                        controller.selectedDates.isNotEmpty) {
                      _applyLeaveControler.applyleavefunction(
                          _formatSelectedDates(controller.selectedDates),
                          _leaveReasonController.text);
                      controller1.validatecolor.value = false;
                    } else {
                      controller1.validatecolor.value = true;
                    }
                  },
                  text: "Apply"),
            ),
            h2,
          ],
        ),
      ),
    );
  }

  String _formatSelectedDates(List<DateTime> dates) {
    List<String> formattedDates = [];
    for (int i = 0; i < dates.length; i += 2) {
      if (i + 1 < dates.length) {
        formattedDates
            .add("${_formatDate(dates[i])} - ${_formatDate(dates[i + 1])}");
      } else {
        formattedDates.add(_formatDate(dates[i]));
      }
    }
    return formattedDates.join("\n");
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}";
  }

  // String _formatSelectedDates(List<DateTime> dates) {
  //   List<String> formattedDates = [];
  //   for (int i = 0; i < dates.length; i += 2) {
  //     if (i + 1 < dates.length) {
  //       formattedDates.add(
  //           "${dates[i].day}-${dates[i].month}-${dates[i].year} , ${dates[i + 1].day}-${dates[i + 1].month}-${dates[i + 1].year}");
  //     } else {
  //       formattedDates
  //           .add("${dates[i].day}-${dates[i].month}-${dates[i].year}");
  //     }
  //   }
  //   return formattedDates.join("\n");
  // }
}

class LeaveResonfiled extends StatelessWidget {
  const LeaveResonfiled({
    Key? key,
    required this.mediaquery,
    this.hinttexts,
    this.icons,
    this.controller,
    this.keyboard,
    this.validator,
    this.sufixicon,
    this.inputFormatter,
    this.errorcolors,
    this.boxcolor,
    this.contentPadding,
    this.bordercolor,
    this.obscureText = false,
    this.maxLine,
    this.minline,
  }) : super(key: key);

  final Size mediaquery;
  final String? hinttexts;
  final Color? errorcolors;
  final Widget? icons;
  final TextEditingController? controller;
  final Widget? sufixicon;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;
  final List<TextInputFormatter>? inputFormatter;
  final Color? boxcolor;
  final EdgeInsetsGeometry? contentPadding;
  final Color? bordercolor;
  final bool obscureText;
  final dynamic maxLine;
  final dynamic minline;

  @override
  Widget build(BuildContext context) {
    final errorText = validator != null ? validator!(controller?.text) : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: boxcolor ?? Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          width: mediaquery.width * 0.85,
          child: TextFormField(
            enableInteractiveSelection: true,
            obscureText: obscureText,
            inputFormatters: inputFormatter,
            keyboardType: keyboard,
            controller: controller,
            validator: validator,
            minLines: minline,
            maxLines: maxLine,
            decoration: InputDecoration(
              contentPadding: contentPadding,
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: bordercolor ?? Colors.black87),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: bordercolor ?? Colors.black87, width: 1.0),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: errorcolors ?? Colors.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color:
                      errorcolors ?? const Color.fromARGB(255, 211, 211, 211),
                  width: 1,
                ),
              ),
              fillColor: boxcolor ?? Colors.white,
              filled: true,
              suffixIcon: sufixicon,
              prefixIcon: Container(
                width: 30,
                alignment: Alignment.topRight,
                padding: const EdgeInsets.only(
                  bottom: 80,
                  right: 18,
                  left: 1,
                ),
                child: icons,
              ),
              hintText: hinttexts,
              hintStyle: const TextStyle(
                fontFamily: 'regular',
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              errorStyle: const TextStyle(
                fontSize: 12,
                height: 0.01,
                color: Color.fromARGB(255, 219, 199, 198),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
