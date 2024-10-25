class LedgerModel {
  bool? status;
  Data? data;

  LedgerModel({this.status, this.data});

  LedgerModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is bool) {
      status = json["status"];
    }
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }
}

class Data {
  String? selectedAccount;
  String? selectedAccountPrefix;
  String? selectedAccountType;
  String? selectedAccountId;
  List<Transactions>? transactions;
  SelectedAccountData? selectedAccountData;
  String? totalCredit;
  String? totalDebit;
  String? totalBalance;

  Data(
      {this.selectedAccount,
      this.selectedAccountPrefix,
      this.selectedAccountType,
      this.selectedAccountId,
      this.transactions,
      this.selectedAccountData,
      this.totalCredit,
      this.totalDebit,
      this.totalBalance});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["selected_account"] is String) {
      selectedAccount = json["selected_account"];
    }
    if (json["selected_account_prefix"] is String) {
      selectedAccountPrefix = json["selected_account_prefix"];
    }
    if (json["selected_account_type"] is String) {
      selectedAccountType = json["selected_account_type"];
    }
    if (json["selected_account_id"] is String) {
      selectedAccountId = json["selected_account_id"];
    }
    if (json["transactions"] is List) {
      transactions = json["transactions"] == null
          ? null
          : (json["transactions"] as List)
              .map((e) => Transactions.fromJson(e))
              .toList();
    }
    if (json["selected_account_data"] is Map) {
      selectedAccountData = json["selected_account_data"] == null
          ? null
          : SelectedAccountData.fromJson(json["selected_account_data"]);
    }
    if (json["total_credit"] is String) {
      totalCredit = json["total_credit"];
    }
    if (json["total_debit"] is String) {
      totalDebit = json["total_debit"];
    }
    if (json["total_balance"] is String) {
      totalBalance = json["total_balance"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["selected_account"] = selectedAccount;
    data["selected_account_prefix"] = selectedAccountPrefix;
    data["selected_account_type"] = selectedAccountType;
    data["selected_account_id"] = selectedAccountId;
    if (transactions != null) {
      data["transactions"] = transactions?.map((e) => e.toJson()).toList();
    }
    if (selectedAccountData != null) {
      data["selected_account_data"] = selectedAccountData?.toJson();
    }
    data["total_credit"] = totalCredit;
    data["total_debit"] = totalDebit;
    data["total_balance"] = totalBalance;
    return data;
  }
}

class SelectedAccountData {
  String? accHeadId;
  String? accHeadBranchId;
  String? accHeadName;
  String? accountType;
  String? opBalance;
  String? opBalanceDate;
  String? accUserId;
  String? accEmployeeId;
  String? accSupplierId;
  String? headEditable;
  String? deleteStatus;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  String? acType;
  String? acTypeName;
  String? acTypeCode;
  String? acTypeParentId;
  int? currentOpBalance;

  SelectedAccountData(
      {this.accHeadId,
      this.accHeadBranchId,
      this.accHeadName,
      this.accountType,
      this.opBalance,
      this.opBalanceDate,
      this.accUserId,
      this.accEmployeeId,
      this.accSupplierId,
      this.headEditable,
      this.deleteStatus,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.acType,
      this.acTypeName,
      this.acTypeCode,
      this.acTypeParentId,
      this.currentOpBalance});

  SelectedAccountData.fromJson(Map<String, dynamic> json) {
    if (json["acc_head_id"] is String) {
      accHeadId = json["acc_head_id"];
    }
    if (json["acc_head_branch_id"] is String) {
      accHeadBranchId = json["acc_head_branch_id"];
    }
    if (json["acc_head_name"] is String) {
      accHeadName = json["acc_head_name"];
    }
    if (json["account_type"] is String) {
      accountType = json["account_type"];
    }
    if (json["op_balance"] is String) {
      opBalance = json["op_balance"];
    }
    if (json["op_balance_date"] is String) {
      opBalanceDate = json["op_balance_date"];
    }
    if (json["acc_user_id"] is String) {
      accUserId = json["acc_user_id"];
    }
    if (json["acc_employee_id"] is String) {
      accEmployeeId = json["acc_employee_id"];
    }
    if (json["acc_supplier_id"] is String) {
      accSupplierId = json["acc_supplier_id"];
    }
    if (json["head_editable"] is String) {
      headEditable = json["head_editable"];
    }
    if (json["delete_status"] is String) {
      deleteStatus = json["delete_status"];
    }
    if (json["created_date"] is String) {
      createdDate = json["created_date"];
    }
    if (json["created_by"] is String) {
      createdBy = json["created_by"];
    }
    if (json["updated_date"] is String) {
      updatedDate = json["updated_date"];
    }
    if (json["updated_by"] is String) {
      updatedBy = json["updated_by"];
    }
    if (json["ac_type"] is String) {
      acType = json["ac_type"];
    }
    if (json["ac_type_name"] is String) {
      acTypeName = json["ac_type_name"];
    }
    if (json["ac_type_code"] is String) {
      acTypeCode = json["ac_type_code"];
    }
    if (json["ac_type_parent_id"] is String) {
      acTypeParentId = json["ac_type_parent_id"];
    }
    if (json["current_op_balance"] is int) {
      currentOpBalance = json["current_op_balance"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["acc_head_id"] = accHeadId;
    data["acc_head_branch_id"] = accHeadBranchId;
    data["acc_head_name"] = accHeadName;
    data["account_type"] = accountType;
    data["op_balance"] = opBalance;
    data["op_balance_date"] = opBalanceDate;
    data["acc_user_id"] = accUserId;
    data["acc_employee_id"] = accEmployeeId;
    data["acc_supplier_id"] = accSupplierId;
    data["head_editable"] = headEditable;
    data["delete_status"] = deleteStatus;
    data["created_date"] = createdDate;
    data["created_by"] = createdBy;
    data["updated_date"] = updatedDate;
    data["updated_by"] = updatedBy;
    data["ac_type"] = acType;
    data["ac_type_name"] = acTypeName;
    data["ac_type_code"] = acTypeCode;
    data["ac_type_parent_id"] = acTypeParentId;
    data["current_op_balance"] = currentOpBalance;
    return data;
  }
}

class Transactions {
  String? date;
  String? account;
  String? description;
  String? debit;
  String? credit;
  String? type;

  Transactions(
      {this.date,
      this.account,
      this.description,
      this.debit,
      this.credit,
      this.type});

  Transactions.fromJson(Map<String, dynamic> json) {
    if (json["date"] is String) {
      date = json["date"];
    }
    if (json["account"] is String) {
      account = json["account"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["debit"] is String) {
      debit = json["debit"];
    }
    if (json["credit"] is String) {
      credit = json["credit"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["date"] = date;
    data["account"] = account;
    data["description"] = description;
    data["debit"] = debit;
    data["credit"] = credit;
    data["type"] = type;
    return data;
  }
}
