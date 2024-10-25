import 'package:get/get.dart';

class WageListModel {
  bool? status;

  List<AccountHeads>? accountHeads;

  List<PaymentModes>? paymentModes;
  List<Projects>? projects;
  List<Labours>? labours;
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

  WageListModel(
      {this.status,
      this.accountHeads,
      this.paymentModes,
      this.projects,
      this.labours,
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

  WageListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['account_heads'] != null) {
      accountHeads = <AccountHeads>[];
      json['account_heads'].forEach((v) {
        accountHeads!.add(AccountHeads.fromJson(v));
      });
    }

    if (json['payment_modes'] != null) {
      paymentModes = <PaymentModes>[];
      json['payment_modes'].forEach((v) {
        paymentModes!.add(PaymentModes.fromJson(v));
      });
    }
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(Projects.fromJson(v));
      });
    }
    if (json['labours'] != null) {
      labours = <Labours>[];
      json['labours'].forEach((v) {
        labours!.add(Labours.fromJson(v));
      });
    }
    if (json['work_types'] != null) {
      workTypes = <WorkTypes>[];
      json['work_types'].forEach((v) {
        workTypes!.add(WorkTypes.fromJson(v));
      });
    }
    if (json['measure_units'] != null) {
      measureUnits = <MeasureUnits>[];
      json['measure_units'].forEach((v) {
        measureUnits!.add(MeasureUnits.fromJson(v));
      });
    }
    if (json['tool_categories'] != null) {
      toolCategories = <ToolCategories>[];
      json['tool_categories'].forEach((v) {
        toolCategories!.add(ToolCategories.fromJson(v));
      });
    }
    if (json['tax_percentages_new'] != null) {
      taxPercentagesNew = <TaxPercentagesNew>[];
      json['tax_percentages_new'].forEach((v) {
        taxPercentagesNew!.add(TaxPercentagesNew.fromJson(v));
      });
    }
    // taxPercentages = json['tax_percentages'].cast<String>();
    if (json['ta_vehicle_type'] != null) {
      taVehicleType = <TaVehicleType>[];
      json['ta_vehicle_type'].forEach((v) {
        taVehicleType!.add(TaVehicleType.fromJson(v));
      });
    }
    if (json['contractors'] != null) {
      contractors = <Contractors>[];
      json['contractors'].forEach((v) {
        contractors!.add(Contractors.fromJson(v));
      });
    }

    if (json['supervisors'] != null) {
      supervisors = <Supervisors>[];
      json['supervisors'].forEach((v) {
        supervisors!.add(Supervisors.fromJson(v));
      });
    }
    if (json['bank_accounts'] != null) {
      bankAccounts = <BankAccounts>[];
      json['bank_accounts'].forEach((v) {
        bankAccounts!.add(BankAccounts.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(Services.fromJson(v));
      });
    }
    if (json['tax_state_codes'] != null) {
      taxStateCodes = <TaxStateCodes>[];
      json['tax_state_codes'].forEach((v) {
        taxStateCodes!.add(TaxStateCodes.fromJson(v));
      });
    }
    if (json['customers'] != null) {
      customers = <Customers>[];
      json['customers'].forEach((v) {
        customers!.add(Customers.fromJson(v));
      });
    }
    if (json['sale_price_categories'] != null) {
      salePriceCategories = <SalePriceCategories>[];
      json['sale_price_categories'].forEach((v) {
        salePriceCategories!.add(SalePriceCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (accountHeads != null) {
      data['account_heads'] = accountHeads!.map((v) => v.toJson()).toList();
    }

    if (paymentModes != null) {
      data['payment_modes'] = paymentModes!.map((v) => v.toJson()).toList();
    }
    if (projects != null) {
      data['projects'] = projects!.map((v) => v.toJson()).toList();
    }
    if (labours != null) {
      data['labours'] = labours!.map((v) => v.toJson()).toList();
    }
    if (workTypes != null) {
      data['work_types'] = workTypes!.map((v) => v.toJson()).toList();
    }
    if (measureUnits != null) {
      data['measure_units'] = measureUnits!.map((v) => v.toJson()).toList();
    }
    if (toolCategories != null) {
      data['tool_categories'] = toolCategories!.map((v) => v.toJson()).toList();
    }
    if (taxPercentagesNew != null) {
      data['tax_percentages_new'] =
          taxPercentagesNew!.map((v) => v.toJson()).toList();
    }
    data['tax_percentages'] = taxPercentages;
    if (taVehicleType != null) {
      data['ta_vehicle_type'] = taVehicleType!.map((v) => v.toJson()).toList();
    }
    if (contractors != null) {
      data['contractors'] = contractors!.map((v) => v.toJson()).toList();
    }

    if (supervisors != null) {
      data['supervisors'] = supervisors!.map((v) => v.toJson()).toList();
    }
    if (bankAccounts != null) {
      data['bank_accounts'] = bankAccounts!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (taxStateCodes != null) {
      data['tax_state_codes'] = taxStateCodes!.map((v) => v.toJson()).toList();
    }
    if (customers != null) {
      data['customers'] = customers!.map((v) => v.toJson()).toList();
    }
    if (salePriceCategories != null) {
      data['sale_price_categories'] =
          salePriceCategories!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['head_id'] = headId;
    data['head_name'] = headName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['work_id'] = workId;
    data['work_name'] = workName;
    return data;
  }
}

class Labours {
  late var isSelected = false.obs;
  late var isdays = false.obs;

  late var wagetotalamount = 0.0.obs;
  late var wageamount = 0.0.obs;
  late var wagedaymultipamount = 0.0.obs;
  String? labourId;
  String? labourName;
  String? labourGroup;
  String? workType;
  String? fixedWageStatus;
  dynamic dailyWage;
  dynamic ta_per_day;
  dynamic overtimeRate;
  String? labourType;
  String? groupPosition;
  dynamic currentBalancePersonal;
  int? currentBalanceGroup;
  String? photo;
  dynamic totalamonut;

  Labours(
      {required this.isSelected,
      required this.isdays,
      required this.wagetotalamount,
      required this.wageamount,
      required this.wagedaymultipamount,
      this.ta_per_day,
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
      this.totalamonut});

  Labours.fromJson(Map<String, dynamic> json) {
    ta_per_day = json['ta_per_day'] ?? 0;
    labourId = json['labour_id'];
    labourName = json['labour_name'];
    labourGroup = json['labour_group'];
    workType = json['work_type'];
    fixedWageStatus = json['fixed_wage_status'];
    dailyWage = json['daily_wage'];
    overtimeRate = json['overtime_rate'];
    labourType = json['labour_type'];
    groupPosition = json['group_position'];
    currentBalancePersonal = json['current_balance_personal'];
    currentBalanceGroup = json['current_balance_group'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['labour_id'] = labourId;
    data['ta_per_day'] = ta_per_day ?? 0;
    data['labour_name'] = labourName;
    data['labour_group'] = labourGroup;
    data['work_type'] = workType;
    data['fixed_wage_status'] = fixedWageStatus;
    data['daily_wage'] = dailyWage;
    data['overtime_rate'] = overtimeRate;
    data['labour_type'] = labourType;
    data['group_position'] = groupPosition;
    data['current_balance_personal'] = currentBalancePersonal;
    data['current_balance_group'] = currentBalanceGroup;
    data['photo'] = photo;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type_id'] = typeId;
    data['type_name'] = typeName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['unit_id'] = unitId;
    data['unit_name'] = unitName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cat_id'] = catId;
    data['cat_name'] = catName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tax_id'] = taxId;
    data['tax_percentage'] = taxPercentage;
    data['tax1_percent'] = tax1Percent;
    data['tax2_percent'] = tax2Percent;
    data['tax3_percent'] = tax3Percent;
    data['delete_status'] = deleteStatus;
    data['tax_name'] = taxName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vehicle_id'] = vehicleId;
    data['type'] = type;
    data['fixed_rate'] = fixedRate;
    data['rate'] = rate;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contractor_id'] = contractorId;
    data['contractor_name'] = contractorName;
    data['phone'] = phone;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_alias'] = userAlias;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['account_id'] = accountId;
    data['branch_id'] = branchId;
    data['company_name'] = companyName;
    data['bank_name'] = bankName;
    data['bank_account_no'] = bankAccountNo;
    data['bank_ifsc'] = bankIfsc;
    data['bank_branch'] = bankBranch;
    data['delete_status'] = deleteStatus;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['service_id'] = serviceId;
    data['service_name'] = serviceName;
    data['active_status'] = activeStatus;
    data['delete_status'] = deleteStatus;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['state_id'] = stateId;
    data['state_code'] = stateCode;
    data['state_name'] = stateName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    data['branch_id'] = branchId;
    data['sale_price_category'] = salePriceCategory;
    data['customer_name'] = customerName;
    data['customer_location'] = customerLocation;
    data['customer_phone'] = customerPhone;
    data['customer_email'] = customerEmail;
    data['customer_tax_no'] = customerTaxNo;
    data['customer_tax_state'] = customerTaxState;
    data['created_date'] = createdDate;
    data['created_by'] = createdBy;
    data['updated_date'] = updatedDate;
    data['updated_by'] = updatedBy;
    data['delete_status'] = deleteStatus;
    data['state_id'] = stateId;
    data['state_code'] = stateCode;
    data['state_name'] = stateName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['name'] = name;
    return data;
  }
}
