class SubCommonModel {
  String? contractId;
  String? subWorkName;
  List<String>? workTypeNames;
  String? contractor;
  String? description;
  String? contractType;
  String? opBalance;
  String? totalBudget;
  int? noOfBills;
  String? billAmount;
  String? billPaidAmount;
  String? advancePaidAmount;
  String? billBalanceAmount;
  String? workTypeId;
  String? workId;
  List<SubBillsData>? bills;
  List<SubPaymentsData>? payments;
  String? contractApprovalStatus;
  bool? status;
  SubCommonModel(
      {this.contractId,
      this.subWorkName,
      this.workTypeNames,
      this.contractor,
      this.description,
      this.contractType,
      this.opBalance,
      this.totalBudget,
      this.noOfBills,
      this.billAmount,
      this.billPaidAmount,
      this.advancePaidAmount,
      this.billBalanceAmount,
      this.workTypeId,
      this.workId,
      this.bills,
      this.payments,
      this.contractApprovalStatus,
      this.status});

  SubCommonModel.fromJson(Map<String, dynamic> json) {
    contractId = json['contract_id'];
    subWorkName = json['sub_work_name'];
    if (json['work_type_names'] != null) {
      workTypeNames = List<String>.from(json['work_type_names']);
    } else {
      workTypeNames = [];
    }
    // workTypeNames = json['work_type_names'].cast<String>();
    contractor = json['contractor'];
    description = json['description'];
    contractType = json['contract_type'];
    opBalance = json['op_balance'];
    totalBudget = json['total_budget'];
    noOfBills = json['no_of_bills'];
    billAmount = json['bill_amount'];
    billPaidAmount = json['bill_paid_amount'];
    advancePaidAmount = json['advance_paid_amount'];
    billBalanceAmount = json['bill_balance_amount'];
    workTypeId = json['work_type_id'];
    workId = json['work_id'];
    if (json['bills'] != null) {
      bills = <SubBillsData>[];
      json['bills'].forEach((v) {
        bills!.add(SubBillsData.fromJson(v));
      });
    }
    if (json['payments'] != null) {
      payments = <SubPaymentsData>[];
      json['payments'].forEach((v) {
        payments!.add(SubPaymentsData.fromJson(v));
      });
    }
    contractApprovalStatus = json['contract_approval_status'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contract_id'] = contractId;
    data['sub_work_name'] = subWorkName;
    data['work_type_names'] = workTypeNames;
    data['contractor'] = contractor;
    data['description'] = description;
    data['contract_type'] = contractType;
    data['op_balance'] = opBalance;
    data['total_budget'] = totalBudget;
    data['no_of_bills'] = noOfBills;
    data['bill_amount'] = billAmount;
    data['bill_paid_amount'] = billPaidAmount;
    data['advance_paid_amount'] = advancePaidAmount;
    data['bill_balance_amount'] = billBalanceAmount;
    data['work_type_id'] = workTypeId;
    data['work_id'] = workId;
    if (bills != null) {
      data['bills'] = bills!.map((v) => v.toJson()).toList();
    }
    if (payments != null) {
      data['payments'] = payments!.map((v) => v.toJson()).toList();
    }
    data['contract_approval_status'] = contractApprovalStatus;
    data['status'] = status;
    return data;
  }
}

class SubBillsData {
  String? billId;
  String? branchId;
  String? billType;
  String? billNo;
  String? billDate;
  String? billCreditAc;
  String? billSupplierId;
  String? workId;
  String? subcontractId;
  String? purchaseId;
  String? vehicleId;
  String? billConsigneeName;
  String? billDescription;
  String? billGrossAmount;
  String? billDiscountAmount;
  String? billTaxPercent;
  String? billTaxAmount;
  String? billTdsAmount;
  String? billRetentionPercent;
  String? billRetentionAmount;
  String? otherDeductions;
  String? billAmount;
  String? billPayableAmount;
  String? billTotalPaid;
  String? billBalanceAmount;
  String? billPaymentStatus;
  String? billRemarks;
  String? billAttachment;
  String? billExpenseType;
  String? billItems;
  String? subcontractLaboursNo;
  String? projectStageId;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  String? entryApprovalStatus;
  String? deleteStatus;

  SubBillsData(
      {this.billId,
      this.branchId,
      this.billType,
      this.billNo,
      this.billDate,
      this.billCreditAc,
      this.billSupplierId,
      this.workId,
      this.subcontractId,
      this.purchaseId,
      this.vehicleId,
      this.billConsigneeName,
      this.billDescription,
      this.billGrossAmount,
      this.billDiscountAmount,
      this.billTaxPercent,
      this.billTaxAmount,
      this.billTdsAmount,
      this.billRetentionPercent,
      this.billRetentionAmount,
      this.otherDeductions,
      this.billAmount,
      this.billPayableAmount,
      this.billTotalPaid,
      this.billBalanceAmount,
      this.billPaymentStatus,
      this.billRemarks,
      this.billAttachment,
      this.billExpenseType,
      this.billItems,
      this.subcontractLaboursNo,
      this.projectStageId,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.entryApprovalStatus,
      this.deleteStatus});

  SubBillsData.fromJson(Map<String, dynamic> json) {
    billId = json['bill_id'];
    branchId = json['branch_id'];
    billType = json['bill_type'];
    billNo = json['bill_no'];
    billDate = json['bill_date'];
    billCreditAc = json['bill_credit_ac'];
    billSupplierId = json['bill_supplier_id'];
    workId = json['work_id'];
    subcontractId = json['subcontract_id'];
    purchaseId = json['purchase_id'];
    vehicleId = json['vehicle_id'];
    billConsigneeName = json['bill_consignee_name'];
    billDescription = json['bill_description'];
    billGrossAmount = json['bill_gross_amount'];
    billDiscountAmount = json['bill_discount_amount'];
    billTaxPercent = json['bill_tax_percent'];
    billTaxAmount = json['bill_tax_amount'];
    billTdsAmount = json['bill_tds_amount'];
    billRetentionPercent = json['bill_retention_percent'];
    billRetentionAmount = json['bill_retention_amount'];
    otherDeductions = json['other_deductions'];
    billAmount = json['bill_amount'];
    billPayableAmount = json['bill_payable_amount'];
    billTotalPaid = json['bill_total_paid'];
    billBalanceAmount = json['bill_balance_amount'];
    billPaymentStatus = json['bill_payment_status'];
    billRemarks = json['bill_remarks'];
    billAttachment = json['bill_attachment'];
    billExpenseType = json['bill_expense_type'];
    billItems = json['bill_items'];
    subcontractLaboursNo = json['subcontract_labours_no'];
    projectStageId = json['project_stage_id'];
    createdDate = json['created_date'];
    createdBy = json['created_by'];
    updatedDate = json['updated_date'];
    updatedBy = json['updated_by'];
    entryApprovalStatus = json['entry_approval_status'];
    deleteStatus = json['delete_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bill_id'] = billId;
    data['branch_id'] = branchId;
    data['bill_type'] = billType;
    data['bill_no'] = billNo;
    data['bill_date'] = billDate;
    data['bill_credit_ac'] = billCreditAc;
    data['bill_supplier_id'] = billSupplierId;
    data['work_id'] = workId;
    data['subcontract_id'] = subcontractId;
    data['purchase_id'] = purchaseId;
    data['vehicle_id'] = vehicleId;
    data['bill_consignee_name'] = billConsigneeName;
    data['bill_description'] = billDescription;
    data['bill_gross_amount'] = billGrossAmount;
    data['bill_discount_amount'] = billDiscountAmount;
    data['bill_tax_percent'] = billTaxPercent;
    data['bill_tax_amount'] = billTaxAmount;
    data['bill_tds_amount'] = billTdsAmount;
    data['bill_retention_percent'] = billRetentionPercent;
    data['bill_retention_amount'] = billRetentionAmount;
    data['other_deductions'] = otherDeductions;
    data['bill_amount'] = billAmount;
    data['bill_payable_amount'] = billPayableAmount;
    data['bill_total_paid'] = billTotalPaid;
    data['bill_balance_amount'] = billBalanceAmount;
    data['bill_payment_status'] = billPaymentStatus;
    data['bill_remarks'] = billRemarks;
    data['bill_attachment'] = billAttachment;
    data['bill_expense_type'] = billExpenseType;
    data['bill_items'] = billItems;
    data['subcontract_labours_no'] = subcontractLaboursNo;
    data['project_stage_id'] = projectStageId;
    data['created_date'] = createdDate;
    data['created_by'] = createdBy;
    data['updated_date'] = updatedDate;
    data['updated_by'] = updatedBy;
    data['entry_approval_status'] = entryApprovalStatus;
    data['delete_status'] = deleteStatus;
    return data;
  }
}

class SubPaymentsData {
  String? transactionId;
  String? trBranchId;
  String? trType;
  String? referenceId;
  String? referenceType;
  String? invoiceId;
  String? trDate;
  String? trDebitAcc;
  String? trCreditAcc;
  String? trDescription;
  String? trAmount;
  String? trPaymentPart;
  String? trMode;
  String? trReferenceNo;
  String? trReferenceDate;
  String? trRemarks;
  String? trWorkId;
  String? trProjectStageId;
  String? trOtherData;
  String? trCopyFrom;
  String? trGroupId;
  String? taxInclusive;
  String? taxableAmount;
  String? taxPercent;
  String? taxAmount;
  String? trFileAttachment;
  String? temporaryTransaction;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  String? trEntryApprovalStatus;
  String? deleteStatus;
  String? entryApprovalStatus;
  String? billId;
  String? billNo;
  String? billDate;

  SubPaymentsData(
      {this.transactionId,
      this.trBranchId,
      this.trType,
      this.referenceId,
      this.referenceType,
      this.invoiceId,
      this.trDate,
      this.trDebitAcc,
      this.trCreditAcc,
      this.trDescription,
      this.trAmount,
      this.trPaymentPart,
      this.trMode,
      this.trReferenceNo,
      this.trReferenceDate,
      this.trRemarks,
      this.trWorkId,
      this.trProjectStageId,
      this.trOtherData,
      this.trCopyFrom,
      this.trGroupId,
      this.taxInclusive,
      this.taxableAmount,
      this.taxPercent,
      this.taxAmount,
      this.trFileAttachment,
      this.temporaryTransaction,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.trEntryApprovalStatus,
      this.deleteStatus,
      this.entryApprovalStatus,
      this.billId,
      this.billNo,
      this.billDate});

  SubPaymentsData.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    trBranchId = json['tr_branch_id'];
    trType = json['tr_type'];
    referenceId = json['reference_id'];
    referenceType = json['reference_type'];
    invoiceId = json['invoice_id'];
    trDate = json['tr_date'];
    trDebitAcc = json['tr_debit_acc'];
    trCreditAcc = json['tr_credit_acc'];
    trDescription = json['tr_description'];
    trAmount = json['tr_amount'];
    trPaymentPart = json['tr_payment_part'];
    trMode = json['tr_mode'];
    trReferenceNo = json['tr_reference_no'];
    trReferenceDate = json['tr_reference_date'];
    trRemarks = json['tr_remarks'];
    trWorkId = json['tr_work_id'];
    trProjectStageId = json['tr_project_stage_id'];
    trOtherData = json['tr_other_data'];
    trCopyFrom = json['tr_copy_from'];
    trGroupId = json['tr_group_id'];
    taxInclusive = json['tax_inclusive'];
    taxableAmount = json['taxable_amount'];
    taxPercent = json['tax_percent'];
    taxAmount = json['tax_amount'];
    trFileAttachment = json['tr_file_attachment'];
    temporaryTransaction = json['temporary_transaction'];
    createdDate = json['created_date'];
    createdBy = json['created_by'];
    updatedDate = json['updated_date'];
    updatedBy = json['updated_by'];
    trEntryApprovalStatus = json['tr_entry_approval_status'];
    deleteStatus = json['delete_status'];
    entryApprovalStatus = json['entry_approval_status'];
    billId = json['bill_id'];
    billNo = json['bill_no'];
    billDate = json['bill_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['tr_branch_id'] = trBranchId;
    data['tr_type'] = trType;
    data['reference_id'] = referenceId;
    data['reference_type'] = referenceType;
    data['invoice_id'] = invoiceId;
    data['tr_date'] = trDate;
    data['tr_debit_acc'] = trDebitAcc;
    data['tr_credit_acc'] = trCreditAcc;
    data['tr_description'] = trDescription;
    data['tr_amount'] = trAmount;
    data['tr_payment_part'] = trPaymentPart;
    data['tr_mode'] = trMode;
    data['tr_reference_no'] = trReferenceNo;
    data['tr_reference_date'] = trReferenceDate;
    data['tr_remarks'] = trRemarks;
    data['tr_work_id'] = trWorkId;
    data['tr_project_stage_id'] = trProjectStageId;
    data['tr_other_data'] = trOtherData;
    data['tr_copy_from'] = trCopyFrom;
    data['tr_group_id'] = trGroupId;
    data['tax_inclusive'] = taxInclusive;
    data['taxable_amount'] = taxableAmount;
    data['tax_percent'] = taxPercent;
    data['tax_amount'] = taxAmount;
    data['tr_file_attachment'] = trFileAttachment;
    data['temporary_transaction'] = temporaryTransaction;
    data['created_date'] = createdDate;
    data['created_by'] = createdBy;
    data['updated_date'] = updatedDate;
    data['updated_by'] = updatedBy;
    data['tr_entry_approval_status'] = trEntryApprovalStatus;
    data['delete_status'] = deleteStatus;
    data['entry_approval_status'] = entryApprovalStatus;
    data['bill_id'] = billId;
    data['bill_no'] = billNo;
    data['bill_date'] = billDate;
    return data;
  }
}
