import 'dart:developer';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:banwet/app/data/model/user/user_details_model.dart';
import 'package:banwet/app/data/service/getuserdetails/get.userdetails.dart';

import '../../../data/service/dutysingoff/duttysignoff.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/home_controller.dart';
import '../../splash_login&panching/splash/views/sunpages/singoff_screen.dart';

class SettingsController extends GetxController {
  var storage = GetStorage();
  HomeController homeController = Get.find<HomeController>();

  var isLoading = false.obs;

  // < ---   logout funvtion ------>
  logOut() async {
    storage.remove('isUserLogin');
    storage.remove('late');
    Get.offAllNamed(Routes.STAFF_LOGIN);
  }

  @override
  void onInit() {
    super.onInit();
    getUserDetails();
    HomeController().onInit();
    determinePosition();
    // getUserDetails();
  }

  String? address;
  //double? landmark;

  //<------ Gettting location from server ------------------->
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    //loo=placemarks.va
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  // < --------------  duty signoff functin ------------- >
  singOffDuty(
      {required String? address,
      required String? landmark,
      required String? latitude,
      required String? longitude}) async {
    isLoading.value = true;
    update();
    var result = await DutySingOffService().dutySingoff(
        address ?? "", landmark ?? "", latitude ?? "", longitude ?? "");

    if (result.status) {
      Get.offAll(() => const SignOff());
      isLoading.value = false;
      update();
    } else {
      isLoading.value = false;
      update();
    }
  }

  UserDetailsModel? userDetailsModel;
  getUserDetails() async {
    var result = await GetUserDetailsService().getUserDetails();
    log(result.toString());
    userDetailsModel = result;
    update();

    log("----------------");
  }

  DateTime newregistercasedate = DateTime.now();
  List<DateTime> selectedDates = [];

  // void newcasedate(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       double dialogWidth = MediaQuery.of(context).size.width * 0.85;
  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         title: const Text('Select Dates'),
  //         content: SizedBox(
  //           // height: 300,
  //           width: dialogWidth,
  //           child: SfDateRangePicker(
  //             backgroundColor: Colors.white,
  //             selectionShape: DateRangePickerSelectionShape.rectangle,
  //             onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
  //               if (args.value is List<DateTime>) {
  //                 selectedDates = args.value;
  //               }
  //             },
  //             selectionMode: DateRangePickerSelectionMode.multiple,
  //             initialSelectedDates: selectedDates,
  //             selectionColor: Color.fromARGB(
  //                 255, 3, 96, 130), // Set the selection color to red
  //             selectionTextStyle: TextStyle(
  //               color: Colors.white, // Text color inside the circle
  //               // fontWeight: FontWeight.bold,
  //               // fontFamily: Bold,

  //               // fontSize: 16,
  //               // height: 1.0, // Adjust the height to center text vertically
  //               // textBaseline: TextBaseline.alphabetic,
  //             ),
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('CANCEL'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               update(); // To update the UI
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // void newcasedate(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       double dialogWidth = MediaQuery.of(context).size.width * 0.85;
  //       double dialogheight = MediaQuery.of(context).size.width * 0.85;

  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         title: const Text('Select Dates'),
  //         content: SizedBox(
  //           height: dialogheight,
  //           width: dialogWidth,
  //           child: SfDateRangePicker(
  //             backgroundColor: Colors.white,
  //             selectionShape: DateRangePickerSelectionShape.rectangle,
  //             onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
  //               if (args.value is List<DateTime>) {
  //                 selectedDates = args.value;
  //               }
  //             },
  //             selectionMode: DateRangePickerSelectionMode.multiple,
  //             initialSelectedDates: selectedDates,
  //             selectionColor: const Color.fromARGB(255, 3, 96, 130),
  //             selectionTextStyle: const TextStyle(
  //               color: Colors.white,
  //             ),
  //             // Centering the date range in the picker
  //             // headerHeight: 60, // Adjust as needed
  //             monthViewSettings: const DateRangePickerMonthViewSettings(
  //               showTrailingAndLeadingDates: true,
  //             ),
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('CANCEL'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               update(); // To update the UI
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // List<DateTime?> selectedDates = [];
  datepicks() {}
  // void newcasedate(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       double dialogWidth = MediaQuery.of(context).size.width * 0.9;
  //       double dialogheight = MediaQuery.of(context).size.width * 0.9;

  //       return AlertDialog(
  //         backgroundColor: Colors.white,
  //         title: const Text('Select Dates'),
  //         content: SizedBox(
  //           height: dialogheight,
  //           width: dialogWidth,
  //           child: CalendarDatePicker2(
  //             config: CalendarDatePicker2Config(
  //               calendarType: CalendarDatePicker2Type.multi,
  //               selectedDayHighlightColor:
  //                   const Color.fromARGB(255, 3, 96, 130),
  //               selectedDayTextStyle: const TextStyle(color: Colors.white),
  //             ),
  //             value: selectedDates,
  //             onValueChanged: (List<DateTime> dates) {
  //               selectedDates = dates;
  //             },
  //           ),
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('CANCEL'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('OK'),
  //             onPressed: () {
  //               update(); // To update the UI
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
//   void newcasedate(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: Colors.white,
//         title: const Text('Select Dates'),
//         content: FractionallySizedBox(
//           widthFactor: 0.9,
//           heightFactor: 0.5, // Adjust height factor as needed
//           child: CalendarDatePicker2(
//             config: CalendarDatePicker2Config(
//               calendarType: CalendarDatePicker2Type.multi,
//               selectedDayHighlightColor: const Color.fromARGB(255, 3, 96, 130),
//               selectedDayTextStyle: const TextStyle(color: Colors.white),
//             ),
//             value: selectedDates,
//             onValueChanged: (List<DateTime> dates) {
//               selectedDates = dates;
//             },
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: const Text('CANCEL'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           TextButton(
//             child: const Text('OK'),
//             onPressed: () {
//               update(); // To update the UI
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
  void newcasedate(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(0),
          child: AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Select Dates'),
            content: FractionallySizedBox(
              widthFactor: 1.15,
              heightFactor: 0.5, // Adjust height factor as needed
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth,
                        maxHeight: constraints.maxHeight,
                      ),
                      child: CalendarDatePicker2(
                        config: CalendarDatePicker2Config(
                          customModePickerIcon: const Icon(
                            Icons.abc,
                            size: 0,
                          ),
                          dayTextStylePredicate: ({required date}) {
                            const TextStyle(fontSize: 10);
                            return null;
                          },
                          dayMaxWidth: 55,
                          dayTextStyle: const TextStyle(
                              fontSize: 10), // Text style for days
                          selectedRangeDayTextStyle: const TextStyle(
                              fontSize:
                                  10), // Text style for selected range days
                          calendarType: CalendarDatePicker2Type
                              .multi, // Multiple selection mode
                          selectedDayHighlightColor: const Color.fromARGB(255,
                              3, 96, 130), // Highlight color for selected days
                          selectedDayTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 10), // Text style for selected day
                          yearTextStyle: const TextStyle(
                              fontSize: 12), // Example for year text style
                        ),
                        value: selectedDates,
                        onValueChanged: (List<DateTime> dates) {
                          selectedDates = dates;
                        },
                      )

                      //  CalendarDatePicker2(
                      //   config: CalendarDatePicker2Config(
                      //     lastMonthIcon: Icon(Icons.abc_outlined),
                      //     calendarType: CalendarDatePicker2Type.multi,
                      //     selectedDayHighlightColor:
                      //         const Color.fromARGB(255, 3, 96, 130),
                      //     selectedDayTextStyle:
                      //         const TextStyle(color: Colors.white),
                      //   ),
                      //   value: selectedDates,
                      //   onValueChanged: (List<DateTime> dates) {
                      //     selectedDates = dates;
                      //   },
                      // ),
                      );
                },
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  update(); // To update the UI
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  // void newcasedate() {
  //   Get.defaultDialog(
  //     backgroundColor: Colors.white,
  //     title: 'Select Dates',
  //     content: Column(
  //       children: [
  //         Container(constraints: BoxConstraints(maxHeight: 280,maxWidth: 450),
  //           child: CalendarDatePicker2(
  //                       config: CalendarDatePicker2Config(customModePickerIcon: Icon(Icons.abc,size: 0,),
  //                         // dayTextStylePredicate: ({required date}) {
  //                         //   TextStyle(fontSize: 10);
  //                         // },
  //                         // dayMaxWidth: 55,
  //                         // dayTextStyle: const TextStyle(
  //                         //     fontSize: 10), // Text style for days
  //                         // selectedRangeDayTextStyle: const TextStyle(
  //                         //     fontSize: 10), // Text style for selected range days
  //                         calendarType: CalendarDatePicker2Type
  //                             .multi, // Multiple selection mode
  //                         selectedDayHighlightColor: const Color.fromARGB(255, 3,
  //                             96, 130), // Highlight color for selected days
  //                         selectedDayTextStyle: const TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 10), // Text style for selected day
  //                         yearTextStyle: const TextStyle(
  //                             fontSize: 12), // Example for year text style
  //                       ),
  //                       value: selectedDates,
  //                       onValueChanged: (List<DateTime> dates) {
  //                         selectedDates = dates;
  //                       },
  //                     ),
  //         )
  //       ],
  //     ),
  //     actions: [
  //       TextButton(
  //         child: const Text('CANCEL'),
  //         onPressed: () {
  //           Get.back(); // Close the dialog
  //         },
  //       ),
  //       TextButton(
  //         child: const Text('OK'),
  //         onPressed: () {
  //           update(); // To update the UI
  //           Get.back(); // Close the dialog
  //         },
  //       ),
  //     ],
  //   );
  // }
}
