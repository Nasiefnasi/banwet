// class ExpenseHomeModel {
//   bool? status;
//   List<ExpenseData>? data;
//   String? message;
//   ExpenseHomeModel({this.status, this.data, this.message});

//   ExpenseHomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'] ?? false;
//     message = json['message'] ?? "";
//     if (json['data'] != null) {
//       data = <ExpenseData>[];
//       json['data'].forEach((v) {
//         data!.add(ExpenseData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['status'] = status;
//     if (this.data != null || this.data!.isNotEmpty) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
class ExpenseHomeModel {
  bool? status;
  List<ExpenseData>? data;
  String? message;

  ExpenseHomeModel({this.status, this.data, this.message});

  ExpenseHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;

    message = json['message'] ?? "";

    if (json['data'] != null) {
      data = <ExpenseData>[];
      json['data'].forEach((v) {
        data!.add(ExpenseData.fromJson(v));
      });
    } else {
      data = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['status'] = status;

    if (this.data != null && this.data!.isNotEmpty) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }

    data['message'] = message;

    return data;
  }
}

class ExpenseData {
  String? billId;
  String? billDate;
  String? billDate2;
  String? expenseType;
  String? expenseHeadName;
  String? billNo;
  String? consignee;
  String? grossAmount;
  String? taxPercent;
  String? taxPercentage;
  String? taxAmount;
  String? payableAmount;
  String? totalPaid;
  String? balanceAmount;
  String? paymentStatus;
  String? remarks;
  String? workName;
  String? createdBy;
  String? createdDate;
  String? expenseHeadId;
  String? workId;
  String? paymentStatusFlag;
  String? billAttachment;
  String? entryApprovalStatus;

  ExpenseData(
      {this.billId,
      this.billDate,
      this.billDate2,
      this.expenseType,
      this.expenseHeadName,
      this.billNo,
      this.consignee,
      this.grossAmount,
      this.taxPercent,
      this.taxPercentage,
      this.taxAmount,
      this.payableAmount,
      this.totalPaid,
      this.balanceAmount,
      this.paymentStatus,
      this.remarks,
      this.workName,
      this.createdBy,
      this.createdDate,
      this.expenseHeadId,
      this.workId,
      this.paymentStatusFlag,
      this.billAttachment,
      this.entryApprovalStatus});

  ExpenseData.fromJson(Map<String, dynamic> json) {
    billId = json['bill_id'];
    billDate = json['bill_date'];
    billDate2 = json['bill_date_2'];
    expenseType = json['expense_type'];
    expenseHeadName = json['expense_head_name'];
    billNo = json['bill_no'];
    consignee = json['consignee'];
    grossAmount = json['gross_amount'];
    taxPercent = json['tax_percent'];
    taxPercentage = json['tax_percentage'].toString();
    taxAmount = json['tax_amount'].toString();
    payableAmount = json['payable_amount'].toString();
    totalPaid = json['total_paid'].toString();
    balanceAmount = json['balance_amount'].toString();
    paymentStatus = json['payment_status'].toString();
    remarks = json['remarks'];
    workName = json['work_name'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    expenseHeadId = json['expense_head_id'];
    workId = json['work_id'];
    paymentStatusFlag = json['payment_status_flag'];
    billAttachment = json['bill_attachment'];
    entryApprovalStatus = json['entry_approval_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bill_id'] = billId;
    data['bill_date'] = billDate;
    data['bill_date_2'] = billDate2;
    data['expense_type'] = expenseType;
    data['expense_head_name'] = expenseHeadName;
    data['bill_no'] = billNo;
    data['consignee'] = consignee;
    data['gross_amount'] = grossAmount;
    data['tax_percent'] = taxPercent;
    data['tax_percentage'] = taxPercentage;
    data['tax_amount'] = taxAmount;
    data['payable_amount'] = payableAmount;
    data['total_paid'] = totalPaid;
    data['balance_amount'] = balanceAmount;
    data['payment_status'] = paymentStatus;
    data['remarks'] = remarks;
    data['work_name'] = workName;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['expense_head_id'] = expenseHeadId;
    data['work_id'] = workId;
    data['payment_status_flag'] = paymentStatusFlag;
    data['bill_attachment'] = billAttachment;
    data['entry_approval_status'] = entryApprovalStatus;
    return data;
  }
}
