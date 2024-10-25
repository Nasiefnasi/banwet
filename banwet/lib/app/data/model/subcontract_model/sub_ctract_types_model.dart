class SubContractTypesModel {
  bool? status;
  List<AccountHeads>? accountHeads;

  List<PaymentModes>? paymentModes;
  List<Projects>? projects;

  List<WorkTypes>? workTypes;
  List<MeasureUnits>? measureUnits;
  List<ToolCategories>? toolCategories;
  List<TaxPercentagesNew>? taxPercentagesNew;
  List<String>? taxPercentages;
  List<TaVehicleType>? taVehicleType;
  List<Contractors>? contractors;

  List<Supervisors>? supervisors;
  List<BankAccounts>? bankAccounts;
  List<Services>? services;
  List<TaxStateCodes>? taxStateCodes;
  List<Customers>? customers;
  List<SalePriceCategories>? salePriceCategories;

  SubContractTypesModel(
      {this.status,
      this.accountHeads,
      this.paymentModes,
      this.projects,
      this.workTypes,
      this.measureUnits,
      this.toolCategories,
      this.taxPercentagesNew,
      this.taxPercentages,
      this.taVehicleType,
      this.contractors,
      this.supervisors,
      this.bankAccounts,
      this.services,
      this.taxStateCodes,
      this.customers,
      this.salePriceCategories});

  SubContractTypesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['account_heads'] != null) {
      accountHeads = <AccountHeads>[];
      json['account_heads'].forEach((v) {
        accountHeads!.add(new AccountHeads.fromJson(v));
      });
    }

    if (json['payment_modes'] != null) {
      paymentModes = <PaymentModes>[];
      json['payment_modes'].forEach((v) {
        paymentModes!.add(new PaymentModes.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }

    if (json['work_types'] != null) {
      workTypes = <WorkTypes>[];
      json['work_types'].forEach((v) {
        workTypes!.add(new WorkTypes.fromJson(v));
      });
    }
    if (json['measure_units'] != null) {
      measureUnits = <MeasureUnits>[];
      json['measure_units'].forEach((v) {
        measureUnits!.add(new MeasureUnits.fromJson(v));
      });
    }
    if (json['tool_categories'] != null) {
      toolCategories = <ToolCategories>[];
      json['tool_categories'].forEach((v) {
        toolCategories!.add(new ToolCategories.fromJson(v));
      });
    }
    if (json['tax_percentages_new'] != null) {
      taxPercentagesNew = <TaxPercentagesNew>[];
      json['tax_percentages_new'].forEach((v) {
        taxPercentagesNew!.add(new TaxPercentagesNew.fromJson(v));
      });
    }
    taxPercentages = json['tax_percentages'].cast<String>();
    if (json['ta_vehicle_type'] != null) {
      taVehicleType = <TaVehicleType>[];
      json['ta_vehicle_type'].forEach((v) {
        taVehicleType!.add(new TaVehicleType.fromJson(v));
      });
    }
    if (json['contractors'] != null) {
      contractors = <Contractors>[];
      json['contractors'].forEach((v) {
        contractors!.add(new Contractors.fromJson(v));
      });
    }

    if (json['supervisors'] != null) {
      supervisors = <Supervisors>[];
      json['supervisors'].forEach((v) {
        supervisors!.add(new Supervisors.fromJson(v));
      });
    }
    if (json['bank_accounts'] != null) {
      bankAccounts = <BankAccounts>[];
      json['bank_accounts'].forEach((v) {
        bankAccounts!.add(new BankAccounts.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    if (json['tax_state_codes'] != null) {
      taxStateCodes = <TaxStateCodes>[];
      json['tax_state_codes'].forEach((v) {
        taxStateCodes!.add(new TaxStateCodes.fromJson(v));
      });
    }
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(new Customers.fromJson(v));
      });
    }
    if (json['sale_price_categories'] != null) {
      salePriceCategories = <SalePriceCategories>[];
      json['sale_price_categories'].forEach((v) {
        salePriceCategories!.add(new SalePriceCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.accountHeads != null) {
      data['account_heads'] =
          this.accountHeads!.map((v) => v.toJson()).toList();
    }

    if (this.paymentModes != null) {
      data['payment_modes'] =
          this.paymentModes!.map((v) => v.toJson()).toList();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }

    if (this.workTypes != null) {
      data['work_types'] = this.workTypes!.map((v) => v.toJson()).toList();
    }
    if (this.measureUnits != null) {
      data['measure_units'] =
          this.measureUnits!.map((v) => v.toJson()).toList();
    }
    if (this.toolCategories != null) {
      data['tool_categories'] =
          this.toolCategories!.map((v) => v.toJson()).toList();
    }
    if (this.taxPercentagesNew != null) {
      data['tax_percentages_new'] =
          this.taxPercentagesNew!.map((v) => v.toJson()).toList();
    }
    data['tax_percentages'] = this.taxPercentages;
    if (this.taVehicleType != null) {
      data['ta_vehicle_type'] =
          this.taVehicleType!.map((v) => v.toJson()).toList();
    }
    if (this.contractors != null) {
      data['contractors'] = this.contractors!.map((v) => v.toJson()).toList();
    }

    if (this.supervisors != null) {
      data['supervisors'] = this.supervisors!.map((v) => v.toJson()).toList();
    }
    if (this.bankAccounts != null) {
      data['bank_accounts'] =
          this.bankAccounts!.map((v) => v.toJson()).toList();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.taxStateCodes != null) {
      data['tax_state_codes'] =
          this.taxStateCodes!.map((v) => v.toJson()).toList();
    }
    if (this.customers != null) {
      data['customers'] = this.customers!.map((v) => v.toJson()).toList();
    }
    if (this.salePriceCategories != null) {
      data['sale_price_categories'] =
          this.salePriceCategories!.map((v) => v.toJson()).toList();
    }
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

class Projects {
  String? workId;
  String? workName;

  Projects({this.workId, this.workName});

  Projects.fromJson(Map<String, dynamic> json) {
    workId = json['work_id'];
    workName = json['work_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['work_id'] = this.workId;
    data['work_name'] = this.workName;
    return data;
  }
}

class WorkTypes {
  String? typeId;
  String? typeName;

  WorkTypes({this.typeId, this.typeName});

  WorkTypes.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    typeName = json['type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.typeId;
    data['type_name'] = this.typeName;
    return data;
  }
}

class MeasureUnits {
  String? unitId;
  String? unitName;

  MeasureUnits({this.unitId, this.unitName});

  MeasureUnits.fromJson(Map<String, dynamic> json) {
    unitId = json['unit_id'];
    unitName = json['unit_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unit_id'] = this.unitId;
    data['unit_name'] = this.unitName;
    return data;
  }
}

class ToolCategories {
  String? catId;
  String? catName;

  ToolCategories({this.catId, this.catName});

  ToolCategories.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cat_id'] = this.catId;
    data['cat_name'] = this.catName;
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

class TaVehicleType {
  String? vehicleId;
  String? type;
  String? fixedRate;
  String? rate;

  TaVehicleType({this.vehicleId, this.type, this.fixedRate, this.rate});

  TaVehicleType.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicle_id'];
    type = json['type'];
    fixedRate = json['fixed_rate'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicle_id'] = this.vehicleId;
    data['type'] = this.type;
    data['fixed_rate'] = this.fixedRate;
    data['rate'] = this.rate;
    return data;
  }
}

class Contractors {
  String? contractorId;
  String? contractorName;
  String? phone;

  Contractors({this.contractorId, this.contractorName, this.phone});

  Contractors.fromJson(Map<String, dynamic> json) {
    contractorId = json['contractor_id'];
    contractorName = json['contractor_name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contractor_id'] = this.contractorId;
    data['contractor_name'] = this.contractorName;
    data['phone'] = this.phone;
    return data;
  }
}

class Supervisors {
  String? userId;
  String? userAlias;

  Supervisors({this.userId, this.userAlias});

  Supervisors.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userAlias = json['user_alias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_alias'] = this.userAlias;
    return data;
  }
}

class BankAccounts {
  String? accountId;
  String? branchId;
  String? companyName;
  String? bankName;
  String? bankAccountNo;
  String? bankIfsc;
  String? bankBranch;
  String? deleteStatus;

  BankAccounts(
      {this.accountId,
      this.branchId,
      this.companyName,
      this.bankName,
      this.bankAccountNo,
      this.bankIfsc,
      this.bankBranch,
      this.deleteStatus});

  BankAccounts.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    branchId = json['branch_id'];
    companyName = json['company_name'];
    bankName = json['bank_name'];
    bankAccountNo = json['bank_account_no'];
    bankIfsc = json['bank_ifsc'];
    bankBranch = json['bank_branch'];
    deleteStatus = json['delete_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['branch_id'] = this.branchId;
    data['company_name'] = this.companyName;
    data['bank_name'] = this.bankName;
    data['bank_account_no'] = this.bankAccountNo;
    data['bank_ifsc'] = this.bankIfsc;
    data['bank_branch'] = this.bankBranch;
    data['delete_status'] = this.deleteStatus;
    return data;
  }
}

class Services {
  String? serviceId;
  String? serviceName;
  String? activeStatus;
  String? deleteStatus;

  Services(
      {this.serviceId, this.serviceName, this.activeStatus, this.deleteStatus});

  Services.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    serviceName = json['service_name'];
    activeStatus = json['active_status'];
    deleteStatus = json['delete_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['service_name'] = this.serviceName;
    data['active_status'] = this.activeStatus;
    data['delete_status'] = this.deleteStatus;
    return data;
  }
}

class TaxStateCodes {
  String? stateId;
  String? stateCode;
  String? stateName;

  TaxStateCodes({this.stateId, this.stateCode, this.stateName});

  TaxStateCodes.fromJson(Map<String, dynamic> json) {
    stateId = json['state_id'];
    stateCode = json['state_code'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state_id'] = this.stateId;
    data['state_code'] = this.stateCode;
    data['state_name'] = this.stateName;
    return data;
  }
}

class Customers {
  String? customerId;
  String? branchId;
  String? salePriceCategory;
  String? customerName;
  String? customerLocation;
  String? customerPhone;
  String? customerEmail;
  String? customerTaxNo;
  String? customerTaxState;
  String? createdDate;
  String? createdBy;
  String? updatedDate;
  String? updatedBy;
  String? deleteStatus;
  String? stateId;
  String? stateCode;
  String? stateName;

  Customers(
      {this.customerId,
      this.branchId,
      this.salePriceCategory,
      this.customerName,
      this.customerLocation,
      this.customerPhone,
      this.customerEmail,
      this.customerTaxNo,
      this.customerTaxState,
      this.createdDate,
      this.createdBy,
      this.updatedDate,
      this.updatedBy,
      this.deleteStatus,
      this.stateId,
      this.stateCode,
      this.stateName});

  Customers.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    branchId = json['branch_id'];
    salePriceCategory = json['sale_price_category'];
    customerName = json['customer_name'];
    customerLocation = json['customer_location'];
    customerPhone = json['customer_phone'];
    customerEmail = json['customer_email'];
    customerTaxNo = json['customer_tax_no'];
    customerTaxState = json['customer_tax_state'];
    createdDate = json['created_date'];
    createdBy = json['created_by'];
    updatedDate = json['updated_date'];
    updatedBy = json['updated_by'];
    deleteStatus = json['delete_status'];
    stateId = json['state_id'];
    stateCode = json['state_code'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['branch_id'] = this.branchId;
    data['sale_price_category'] = this.salePriceCategory;
    data['customer_name'] = this.customerName;
    data['customer_location'] = this.customerLocation;
    data['customer_phone'] = this.customerPhone;
    data['customer_email'] = this.customerEmail;
    data['customer_tax_no'] = this.customerTaxNo;
    data['customer_tax_state'] = this.customerTaxState;
    data['created_date'] = this.createdDate;
    data['created_by'] = this.createdBy;
    data['updated_date'] = this.updatedDate;
    data['updated_by'] = this.updatedBy;
    data['delete_status'] = this.deleteStatus;
    data['state_id'] = this.stateId;
    data['state_code'] = this.stateCode;
    data['state_name'] = this.stateName;
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
