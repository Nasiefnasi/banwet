// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';

import '../../api/apibasehelper.dart';
import '../../model/WageModel/wage_slip_model.dart';
import '../dailynote/get_dailynote.dart';

class WageSlipService {
  var storage = GetStorage();
  Future<WageSlipModel> getWageSlip(String workid) async {
    log(storage.read("uid"));

    final response = await ApiBaseHelper.get(
        "${storage.read("domain")}labours/select_labour_wages?user_id=${storage.read('uid')}&work_id=${workid.toString()}",
        isHeaderRequired: true);

    log(response.toString());
    return WageSlipModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addWageSlip(
      String workid, String workdate, String remarks, List quickWage) async {
    print(storage.read('uid').toString());
    print(workdate.toString());
    print(remarks.toString());
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}labours/create_labour_wage_quick",
        {
          'user_id': storage.read('uid').toString(),
          'work_date': workdate.toString(),
          'work_id': workid.toString(),
          'remarks': remarks.toString(),
          'labours': jsonEncode(quickWage)
        },
        isHeaderRequired: true);

    log(response.toString());
    return StatusModel.fromJson(json.decode(response));
  }

  Future<StatusModel> addIndivitualWageSlip({
    required String workid,
    required String ta_per_day,
    required String workdate,
    required String basicWage,
    required String overTime,
    required String overRate,
    required String overTimeWage,
    required String extraWage,
    required String noLabours,
    required String remarks,
    required String totalWage,
    required String paidAmt,
    required String paidMode,
    required String debitAccount,
    required String paidDate,
    required String labourId,
    required String tr_remarks,
    required String workday,
  }) async {
    final response = await ApiBaseHelper.post(
        "${storage.read("domain")}labours/create_labour_wage",
        {
          'user_id': storage.read('uid').toString(),
          'labour_id': labourId.toString(),
          'work_date': workdate.toString(),
          'work_id': workid.toString(),
          'wage_per_day': basicWage.toString(),
          'overtime_duration': overTime.toString(),
          "overtime_rate": overRate.toString(),
          'overtime_wage': overTimeWage.toString(),
          'extra_wage': extraWage.toString(),
          'no_of_days': workday.toString(),
          'no_of_labours': noLabours.toString(),
          'remarks': remarks.toString(),
          'total_wage': totalWage,
          'paid_amount': paidAmt,
          'paid_date': paidDate,
          'debit_acc': debitAccount,
          'payment_mode': paidMode,
          'tr_remarks': tr_remarks,
          'ta_per_day': ta_per_day
        },
        isHeaderRequired: true);
    log(response.toString());

    var result = jsonDecode(response);
    if (result["status"]) {
      return StatusModel.fromJson(json.decode(response));
    } else {
      Fluttertoast.showToast(msg: result["message"] ?? "");

      return StatusModel(status: false, message: "");
    }
  }
}
// To parse this JSON data, do
//
//     final groupWageLabour = groupWageLabourFromJson(jsonString);

GroupWageLabour groupWageLabourFromJson(String str) =>
    GroupWageLabour.fromJson(json.decode(str));

String groupWageLabourToJson(GroupWageLabour data) =>
    json.encode(data.toJson());

class GroupWageLabour {
  final dynamic openingBalanceGroup;
  final dynamic totalWorkDaysGroup;
  final dynamic totalWageEarnedGroup;
  final dynamic totalToPayGroup;
  final dynamic totalPaidGroup;
  final List<Labour> labours;

  GroupWageLabour({
    this.openingBalanceGroup,
    this.totalWorkDaysGroup,
    this.totalWageEarnedGroup,
    this.totalToPayGroup,
    this.totalPaidGroup,
    required this.labours,
  });

  factory GroupWageLabour.fromJson(Map<String, dynamic> json) =>
      GroupWageLabour(
        openingBalanceGroup: json["opening_balance_group"],
        totalWorkDaysGroup: json["total_work_days_group"],
        totalWageEarnedGroup: json["total_wage_earned_group"],
        totalToPayGroup: json["total_to_pay_group"],
        totalPaidGroup: json["total_paid_group"],
        labours: json["labours"] == null
            ? []
            : List<Labour>.from(
                json["labours"]!.map((x) => Labour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "opening_balance_group": openingBalanceGroup,
        "total_work_days_group": totalWorkDaysGroup,
        "total_wage_earned_group": totalWageEarnedGroup,
        "total_to_pay_group": totalToPayGroup,
        "total_paid_group": totalPaidGroup,
        "labours": labours == null
            ? []
            : List<dynamic>.from(labours.map((x) => x.toJson())),
      };
}

class Labour {
  final String? labourId;
  final String? labourName;
  final String? labourGroup;
  final String? workType;
  final String? fixedWageStatus;
  final String? dailyWage;
  final dynamic overtimeRate;
  final String? labourType;
  final String? groupPosition;
  final dynamic currentBalancePersonal;
  final dynamic currentBalanceGroup;
  final String? photo;

  Labour({
    this.labourId,
    this.labourName,
    this.labourGroup,
    this.workType,
    this.fixedWageStatus,
    this.dailyWage,
    this.overtimeRate,
    this.labourType,
    this.groupPosition,
    this.currentBalancePersonal,
    this.currentBalanceGroup,
    this.photo,
  });

  factory Labour.fromJson(Map<String, dynamic> json) => Labour(
        labourId: json["labour_id"],
        labourName: json["labour_name"],
        labourGroup: json["labour_group"],
        workType: json["work_type"],
        fixedWageStatus: json["fixed_wage_status"],
        dailyWage: json["daily_wage"],
        overtimeRate: json["overtime_rate"],
        labourType: json["labour_type"],
        groupPosition: json["group_position"],
        currentBalancePersonal: json["current_balance_personal"],
        currentBalanceGroup: json["current_balance_group"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "labour_id": labourId,
        "labour_name": labourName,
        "labour_group": labourGroup,
        "work_type": workType,
        "fixed_wage_status": fixedWageStatus,
        "daily_wage": dailyWage,
        "overtime_rate": overtimeRate,
        "labour_type": labourType,
        "group_position": groupPosition,
        "current_balance_personal": currentBalancePersonal,
        "current_balance_group": currentBalanceGroup,
        "photo": photo,
      };
}

GroupWageLabourfilterlist groupWageLabourfilterlistFromJson(String str) =>
    GroupWageLabourfilterlist.fromJson(json.decode(str));

String groupWageLabourfilterlistToJson(GroupWageLabourfilterlist data) =>
    json.encode(data.toJson());

class GroupWageLabourfilterlist {
  var openingBalanceGroup;
  final dynamic totalWorkDaysGroup;
  var totalWageEarnedGroup;
  var totalToPayGroup;
  var totalPaidGroup;
  final List<Labourlist>? labours;

  GroupWageLabourfilterlist({
    this.openingBalanceGroup,
    this.totalWorkDaysGroup,
    this.totalWageEarnedGroup,
    this.totalToPayGroup,
    this.totalPaidGroup,
    this.labours,
  });

  factory GroupWageLabourfilterlist.fromJson(Map<String, dynamic> json) =>
      GroupWageLabourfilterlist(
        openingBalanceGroup: json["opening_balance_group"],
        totalWorkDaysGroup: json["total_work_days_group"],
        totalWageEarnedGroup: json["total_wage_earned_group"],
        totalToPayGroup: json["total_to_pay_group"],
        totalPaidGroup: json["total_paid_group"],
        labours: json["labours"] == null
            ? []
            : List<Labourlist>.from(
                json["labours"]!.map((x) => Labourlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "opening_balance_group": openingBalanceGroup,
        "total_work_days_group": totalWorkDaysGroup,
        "total_wage_earned_group": totalWageEarnedGroup,
        "total_to_pay_group": totalToPayGroup,
        "total_paid_group": totalPaidGroup,
        "labours": labours == null
            ? []
            : List<dynamic>.from(labours!.map((x) => x.toJson())),
      };
}

class Labourlist {
  late RxBool isbuttonn = false.obs;
  late RxBool isdaysbutton = false.obs;
  late var wagetotalamount = 0.0.obs;
  late var totalNB = 0.0.obs;
  late var totalOET = 0.0.obs;
  final String? ta;
  final String? extrawage;
  final String? noLabours;
  final String? labourId;
  final String? labourName;
  final String? labourGroup;
  final String? workType;
  final String? fixedWageStatus;
  late final String? dailyWage;
  final int? overtimeRate;
  final String? labourType;
  final String? groupPosition;
  final dynamic currentBalancePersonal;
  var currentBalanceGroup;
  final String? photo;

  Labourlist({
    // this.wagetotalamount,
    this.ta,
    this.noLabours,
    this.extrawage,
    this.labourId,
    this.labourName,
    this.labourGroup,
    this.workType,
    this.fixedWageStatus,
    this.dailyWage,
    this.overtimeRate,
    this.labourType,
    this.groupPosition,
    this.currentBalancePersonal,
    this.currentBalanceGroup,
    this.photo,
  });

  factory Labourlist.fromJson(Map<String, dynamic> json) => Labourlist(
        labourId: json["labour_id"],
        labourName: json["labour_name"],
        labourGroup: json["labour_group"],
        workType: json["work_type"],
        fixedWageStatus: json["fixed_wage_status"],
        dailyWage: json["daily_wage"],
        overtimeRate: json["overtime_rate"],
        labourType: json["labour_type"],
        groupPosition: json["group_position"],
        currentBalancePersonal: json["current_balance_personal"],
        currentBalanceGroup: json["current_balance_group"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "labour_id": labourId,
        "labour_name": labourName,
        "labour_group": labourGroup,
        "work_type": workType,
        "fixed_wage_status": fixedWageStatus,
        "daily_wage": dailyWage,
        "overtime_rate": overtimeRate,
        "labour_type": labourType,
        "group_position": groupPosition,
        "current_balance_personal": currentBalancePersonal,
        "current_balance_group": currentBalanceGroup,
        "photo": photo,
      };
}
