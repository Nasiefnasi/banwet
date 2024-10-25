class ExpenseHeadModel {
  bool? status;
  List<AccountHeads>? accountHeads;
  List<ExpenseHeads>? expenseHeads;
  List<PaymentModes>? paymentModes;
  List<SalePriceCategories>? salePriceCategories;
  List<TaxPercentagesNew>? taxPercentagesNew;
  List<String>? taxPercentages;

  ExpenseHeadModel(
      {this.status,
        this.accountHeads,
        this.expenseHeads,
        this.paymentModes,
        this.salePriceCategories,
        this.taxPercentagesNew,
        this.taxPercentages});

  ExpenseHeadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['account_heads'] != null) {
      accountHeads = <AccountHeads>[];
      json['account_heads'].forEach((v) {
        accountHeads!.add(new AccountHeads.fromJson(v));
      });
    }
    if (json['expense_heads'] != null) {
      expenseHeads = <ExpenseHeads>[];
      json['expense_heads'].forEach((v) {
        expenseHeads!.add(new ExpenseHeads.fromJson(v));
      });
    }
    if (json['payment_modes'] != null) {
      paymentModes = <PaymentModes>[];
      json['payment_modes'].forEach((v) {
        paymentModes!.add(new PaymentModes.fromJson(v));
      });
    }
    if (json['sale_price_categories'] != null) {
      salePriceCategories = <SalePriceCategories>[];
      json['sale_price_categories'].forEach((v) {
        salePriceCategories!.add(new SalePriceCategories.fromJson(v));
      });
    }
    if (json['tax_percentages_new'] != null) {
      taxPercentagesNew = <TaxPercentagesNew>[];
      json['tax_percentages_new'].forEach((v) {
        taxPercentagesNew!.add(new TaxPercentagesNew.fromJson(v));
      });
    }
    taxPercentages = json['tax_percentages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.accountHeads != null) {
      data['account_heads'] =
          this.accountHeads!.map((v) => v.toJson()).toList();
    }
    if (this.expenseHeads != null) {
      data['expense_heads'] =
          this.expenseHeads!.map((v) => v.toJson()).toList();
    }
    if (this.paymentModes != null) {
      data['payment_modes'] =
          this.paymentModes!.map((v) => v.toJson()).toList();
    }
    if (this.salePriceCategories != null) {
      data['sale_price_categories'] =
          this.salePriceCategories!.map((v) => v.toJson()).toList();
    }
    if (this.taxPercentagesNew != null) {
      data['tax_percentages_new'] =
          this.taxPercentagesNew!.map((v) => v.toJson()).toList();
    }
    data['tax_percentages'] = this.taxPercentages;
    return data;
  }
}

class AccountHeads {
  String? headId;
  String? headName;

  AccountHeads({this.headId, this.headName});

  AccountHeads.fromJson(Map<String, dynamic> json) {
    headId = json['head_id'];
    headName = json['head_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['head_id'] = this.headId;
    data['head_name'] = this.headName;
    return data;
  }
}

class PaymentModes {
  String? id;
  String? name;

  PaymentModes({this.id, this.name});

  PaymentModes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class SalePriceCategories {
  int? value;
  String? name;

  SalePriceCategories({this.value, this.name});

  SalePriceCategories.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['name'] = this.name;
    return data;
  }
}

class TaxPercentagesNew {
  String? taxId;
  String? taxPercentage;
  String? tax1Percent;
  String? tax2Percent;
  String? tax3Percent;
  String? deleteStatus;
  String? taxName;

  TaxPercentagesNew(
      {this.taxId,
        this.taxPercentage,
        this.tax1Percent,
        this.tax2Percent,
        this.tax3Percent,
        this.deleteStatus,
        this.taxName});

  TaxPercentagesNew.fromJson(Map<String, dynamic> json) {
    taxId = json['tax_id'];
    taxPercentage = json['tax_percentage'];
    tax1Percent = json['tax1_percent'];
    tax2Percent = json['tax2_percent'];
    tax3Percent = json['tax3_percent'];
    deleteStatus = json['delete_status'];
    taxName = json['tax_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tax_id'] = this.taxId;
    data['tax_percentage'] = this.taxPercentage;
    data['tax1_percent'] = this.tax1Percent;
    data['tax2_percent'] = this.tax2Percent;
    data['tax3_percent'] = this.tax3Percent;
    data['delete_status'] = this.deleteStatus;
    data['tax_name'] = this.taxName;
    return data;
  }
}
class ExpenseHeads {
  String? headId;
  String? headName;

  ExpenseHeads({this.headId, this.headName});

  ExpenseHeads.fromJson(Map<String, dynamic> json) {
    headId = json['head_id'];
    headName = json['head_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['head_id'] = this.headId;
    data['head_name'] = this.headName;
    return data;
  }
}