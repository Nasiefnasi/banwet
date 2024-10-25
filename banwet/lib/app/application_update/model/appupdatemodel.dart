// import 'dart:convert';

// UpdateVertion updateVertionFromJson(String str) =>UpdateVertion.fromJson(json.decode(str));

// String updateVertionToJson(UpdateVertion data) => json.encode(data.toJson());

// class UpdateVertion {
//   final String? id;
//   final int? updationStatus;
//   final String? updationType;
//   final String? updationLink;

//   UpdateVertion({
//     this.id,
//     this.updationStatus,
//     this.updationType,
//     this.updationLink,
//   });

//   factory UpdateVertion.fromJson(Map<String, dynamic> json) => UpdateVertion(
//         id: json["id"],
//         updationStatus: json["updation_status"],
//         updationType: json["updation_type"],
//         updationLink: json["updation_link"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "updation_status": updationStatus,
//         "updation_type": updationType,
//         "updation_link": updationLink,
//       };
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:new_version_plus/new_version_plus.dart';

// import 'package:flutter/material.dart';
// import 'package:new_version_plus/new_version_plus.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   String release = "";
//   @override
//   void initState() {
//     super.initState();

//     // Instantiate NewVersion manager object (Using GCP Console app as example)
//     final newVersion = NewVersionPlus(
//       androidId: 'com.example.banwet',
//       androidHtmlReleaseNotes: true, //support country code
//     );

//     // You can let the plugin handle fetching the status and showing a dialog,
//     // or you can fetch the status and display your own dialog, or no dialog.
//     final ver = VersionStatus(
//       appStoreLink: '',
//       localVersion: '',
//       storeVersion: '',
//       releaseNotes: '',
//       originalStoreVersion: '',
//     );
//     print(ver);
//     const simpleBehavior = true;

//     // if (simpleBehavior) {
//     basicStatusCheck(newVersion);
//     // }
//     // else {
//     // advancedStatusCheck(newVersion);
//     // }
//   }

//   basicStatusCheck(NewVersionPlus newVersion) async {
//     final version = await newVersion.getVersionStatus();
//     if (version != null) {
//       release = version.releaseNotes ?? "";
//       setState(() {});
//     }
//     newVersion.showAlertIfNecessary(
//       context: context,
//       launchModeVersion: LaunchModeVersion.external,
//     );
//   }

//   advancedStatusCheck(NewVersionPlus newVersion) async {
//     final status = await newVersion.getVersionStatus();
//     if (status != null) {
//       debugPrint(status.releaseNotes);
//       debugPrint(status.appStoreLink);
//       debugPrint(status.localVersion);
//       debugPrint(status.storeVersion);
//       debugPrint(status.canUpdate.toString());
//       newVersion.showUpdateDialog(
//         context: context,
//         versionStatus: status,
//         dialogTitle: 'Custom Title',
//         dialogText: 'Custom Text',
//         launchModeVersion: LaunchModeVersion.external,
//         allowDismissal: false,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Example App"),
//       ),
//       body: SafeArea(
//         child: Center(),
//       ),
//     );
//   }
// }
