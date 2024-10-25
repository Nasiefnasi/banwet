// class LabourPaymentModel {
//   bool? status;
//   List<LabourPayData>? data;

//   LabourPaymentModel({this.status, this.data});

//   LabourPaymentModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <LabourPayData>[];
//       json['data'].forEach((v) {
//         data!.add(LabourPayData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
class LabourPaymentModel {
  bool? status;
  List<LabourPayData>? data;

  LabourPaymentModel({this.status, this.data});

  LabourPaymentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <LabourPayData>[]; // Initialize the list.
      json['data'].forEach((v) {
        data!.add(LabourPayData.fromJson(v));
      });
    } else {
      data = []; // Assign an empty list if 'data' is null.
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data?.map((v) => v.toJson()).toList() ?? [];
    return data;
  }
}

class LabourPayData {
  String? transactionId;
  String? labourName;
  String? labourId;
  String? work_type;
  String? trAmount;
  String? debitAccount;
  String? trMode;
  String? trRemarks;
  String? createdBy;
  String? trDate;
  String? createdDate;
  String? debitAccId;
  String? entryApprovalStatus;

  LabourPayData(
      {this.transactionId,
      this.labourName,
      this.labourId,
      this.trAmount,
      this.work_type,
      this.debitAccount,
      this.trMode,
      this.trRemarks,
      this.createdBy,
      this.trDate,
      this.createdDate,
      this.debitAccId,
      this.entryApprovalStatus});

  LabourPayData.fromJson(Map<String, dynamic> json) {
    work_type = json['work_type'] ?? "";
    transactionId = json['transaction_id'];
    labourName = json['labour_name'];
    labourId = json['labour_id'];
    trAmount = json['tr_amount'];
    debitAccount = json['debit_account'];
    trMode = json['tr_mode'];
    trRemarks = json['tr_remarks'];
    createdBy = json['created_by'];
    trDate = json['tr_date'];
    createdDate = json['created_date'];
    debitAccId = json['debit_acc_id'];
    entryApprovalStatus = json['entry_approval_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['work_type'] = work_type ?? "";
    data['labour_name'] = labourName;
    data['labour_id'] = labourId;
    data['tr_amount'] = trAmount;
    data['debit_account'] = debitAccount;
    data['tr_mode'] = trMode;
    data['tr_remarks'] = trRemarks;
    data['created_by'] = createdBy;
    data['tr_date'] = trDate;
    data['created_date'] = createdDate;
    data['debit_acc_id'] = debitAccId;
    data['entry_approval_status'] = entryApprovalStatus;
    return data;
  }
}
