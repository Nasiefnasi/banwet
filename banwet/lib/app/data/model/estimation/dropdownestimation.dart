import 'dart:convert';
EstimationDropDownList estimationDropDownListFromJson(String str) => EstimationDropDownList.fromJson(json.decode(str));
String estimationDropDownListToJson(EstimationDropDownList data) => json.encode(data.toJson());
class EstimationDropDownList {
    final bool status;
    // final List<Head> accountHeads;
    // final List<Head> expenseHeads;
    // final List<PaymentMode> paymentModes;
    // final List<Project> projects;
    // final List<Labour> labours;
    // final List<Type> workTypes;
    // final List<MeasureUnit> measureUnits;
    // final List<ToolCategory> toolCategories;
    // final List<TaxPercentagesNew> taxPercentagesNew;
    // final List<String> taxPercentages;
    // final List<TaVehicleType> taVehicleType;
    // final List<Contractor> contractors;
    // final List<Type> vehicleDocumentTypes;
    // final List<Supervisor> supervisors;
    // final List<BankAccount> bankAccounts;
    // final List<Service> services;
    // final List<TaxStateCode> taxStateCodes;
    // final List<Map<String, String?>> customers;
    final List<Customer> customers;
    // final List<SalePriceCategory> salePriceCategories;

    EstimationDropDownList({
        required this.status,
        // required this.accountHeads,
        // required this.expenseHeads,
        // required this.paymentModes,
        // required this.projects,
        // required this.labours,
        // required this.workTypes,
        // required this.measureUnits,
        // required this.toolCategories,
        // required this.taxPercentagesNew,
        // required this.taxPercentages,
        // required this.taVehicleType,
        // required this.contractors,
        // required this.vehicleDocumentTypes,
        // required this.supervisors,
        // required this.bankAccounts,
        // required this.services,
        // required this.taxStateCodes,
        required this.customers,
        // required this.salePriceCategories,
    });

    factory EstimationDropDownList.fromJson(Map<String, dynamic> json) => EstimationDropDownList(
        status: json["status"],
        // accountHeads: List<Head>.from(json["account_heads"].map((x) => Head.fromJson(x))),
        // expenseHeads: List<Head>.from(json["expense_heads"].map((x) => Head.fromJson(x))),
        // paymentModes: List<PaymentMode>.from(json["payment_modes"].map((x) => PaymentMode.fromJson(x))),
        // projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
        // labours: List<Labour>.from(json["labours"].map((x) => Labour.fromJson(x))),
        // workTypes: List<Type>.from(json["work_types"].map((x) => Type.fromJson(x))),
        // measureUnits: List<MeasureUnit>.from(json["measure_units"].map((x) => MeasureUnit.fromJson(x))),
        // toolCategories: List<ToolCategory>.from(json["tool_categories"].map((x) => ToolCategory.fromJson(x))),
        // taxPercentagesNew: List<TaxPercentagesNew>.from(json["tax_percentages_new"].map((x) => TaxPercentagesNew.fromJson(x))),
        // taxPercentages: List<String>.from(json["tax_percentages"].map((x) => x)),
        // taVehicleType: List<TaVehicleType>.from(json["ta_vehicle_type"].map((x) => TaVehicleType.fromJson(x))),
        // contractors: List<Contractor>.from(json["contractors"].map((x) => Contractor.fromJson(x))),
        // vehicleDocumentTypes: List<Type>.from(json["vehicle_document_types"].map((x) => Type.fromJson(x))),
        // supervisors: List<Supervisor>.from(json["supervisors"].map((x) => Supervisor.fromJson(x))),
        // bankAccounts: List<BankAccount>.from(json["bank_accounts"].map((x) => BankAccount.fromJson(x))),
        // services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        // taxStateCodes: List<TaxStateCode>.from(json["tax_state_codes"].map((x) => TaxStateCode.fromJson(x))),
        customers: List<Customer>.from(json["customers"].map((x) =>Customer.fromJson(x))),
        // salePriceCategories: List<SalePriceCategory>.from(json["sale_price_categories"].map((x) => SalePriceCategory.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        // "account_heads": List<dynamic>.from(accountHeads.map((x) => x.toJson())),
        // "expense_heads": List<dynamic>.from(expenseHeads.map((x) => x.toJson())),
        // "payment_modes": List<dynamic>.from(paymentModes.map((x) => x.toJson())),
        // "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        // "labours": List<dynamic>.from(labours.map((x) => x.toJson())),
        // "work_types": List<dynamic>.from(workTypes.map((x) => x.toJson())),
        // "measure_units": List<dynamic>.from(measureUnits.map((x) => x.toJson())),
        // "tool_categories": List<dynamic>.from(toolCategories.map((x) => x.toJson())),
        // "tax_percentages_new": List<dynamic>.from(taxPercentagesNew.map((x) => x.toJson())),
        // "tax_percentages": List<dynamic>.from(taxPercentages.map((x) => x)),
        // "ta_vehicle_type": List<dynamic>.from(taVehicleType.map((x) => x.toJson())),
        // "contractors": List<dynamic>.from(contractors.map((x) => x.toJson())),
        // "vehicle_document_types": List<dynamic>.from(vehicleDocumentTypes.map((x) => x.toJson())),
        // "supervisors": List<dynamic>.from(supervisors.map((x) => x.toJson())),
        // "bank_accounts": List<dynamic>.from(bankAccounts.map((x) => x.toJson())),
        // "services": List<dynamic>.from(services.map((x) => x.toJson())),
        // "tax_state_codes": List<dynamic>.from(taxStateCodes.map((x) => x.toJson())),
        "customers": List<dynamic>.from(customers.map((x) => x.toJson())),
        // List<dynamic>.from(customers.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
        // "sale_price_categories": List<dynamic>.from(salePriceCategories.map((x) => x.toJson())),
    };
}

// class Head {
//     final String headId;
//     final String headName;

//     Head({
//         required this.headId,
//         required this.headName,
//     });

//     factory Head.fromJson(Map<String, dynamic> json) => Head(
//         headId: json["head_id"],
//         headName: json["head_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "head_id": headId,
//         "head_name": headName,
//     };
// }

// class BankAccount {
//     final String accountId;
//     final String branchId;
//     final String companyName;
//     final String bankName;
//     final String bankAccountNo;
//     final String bankIfsc;
//     final String bankBranch;
//     final String bankSwiftCode;
//     final String deleteStatus;

//     BankAccount({
//         required this.accountId,
//         required this.branchId,
//         required this.companyName,
//         required this.bankName,
//         required this.bankAccountNo,
//         required this.bankIfsc,
//         required this.bankBranch,
//         required this.bankSwiftCode,
//         required this.deleteStatus,
//     });

//     factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
//         accountId: json["account_id"],
//         branchId: json["branch_id"],
//         companyName: json["company_name"],
//         bankName: json["bank_name"],
//         bankAccountNo: json["bank_account_no"],
//         bankIfsc: json["bank_ifsc"],
//         bankBranch: json["bank_branch"],
//         bankSwiftCode: json["bank_swift_code"],
//         deleteStatus: json["delete_status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "account_id": accountId,
//         "branch_id": branchId,
//         "company_name": companyName,
//         "bank_name": bankName,
//         "bank_account_no": bankAccountNo,
//         "bank_ifsc": bankIfsc,
//         "bank_branch": bankBranch,
//         "bank_swift_code": bankSwiftCode,
//         "delete_status": deleteStatus,
//     };
// }

// class Contractor {
//     final String contractorId;
//     final String contractorName;
//     final String phone;

//     Contractor({
//         required this.contractorId,
//         required this.contractorName,
//         required this.phone,
//     });

//     factory Contractor.fromJson(Map<String, dynamic> json) => Contractor(
//         contractorId: json["contractor_id"],
//         contractorName: json["contractor_name"],
//         phone: json["phone"],
//     );

//     Map<String, dynamic> toJson() => {
//         "contractor_id": contractorId,
//         "contractor_name": contractorName,
//         "phone": phone,
//     };
// }

// class Labour {
//     final String labourId;
//     final String labourName;
//     final String? workType;
//     final String fixedWageStatus;
//     final int dailyWage;
//     final double overtimeRate;
//     final String labourType;
//     final dynamic taPerDay;
//     final String groupPosition;
//     final double currentBalancePersonal;
//     final int currentBalanceGroup;
//     final String photo;

//     Labour({
//         required this.labourId,
//         required this.labourName,
//         required this.workType,
//         required this.fixedWageStatus,
//         required this.dailyWage,
//         required this.overtimeRate,
//         required this.labourType,
//         required this.taPerDay,
//         required this.groupPosition,
//         required this.currentBalancePersonal,
//         required this.currentBalanceGroup,
//         required this.photo,
//     });

//     factory Labour.fromJson(Map<String, dynamic> json) => Labour(
//         labourId: json["labour_id"],
//         labourName: json["labour_name"],
//         workType: json["work_type"],
//         fixedWageStatus: json["fixed_wage_status"],
//         dailyWage: json["daily_wage"],
//         overtimeRate: json["overtime_rate"]?.toDouble(),
//         labourType: json["labour_type"],
//         taPerDay: json["ta_per_day"],
//         groupPosition: json["group_position"],
//         currentBalancePersonal: json["current_balance_personal"]?.toDouble(),
//         currentBalanceGroup: json["current_balance_group"],
//         photo: json["photo"],
//     );

//     Map<String, dynamic> toJson() => {
//         "labour_id": labourId,
//         "labour_name": labourName,
//         "work_type": workType,
//         "fixed_wage_status": fixedWageStatus,
//         "daily_wage": dailyWage,
//         "overtime_rate": overtimeRate,
//         "labour_type": labourType,
//         "ta_per_day": taPerDay,
//         "group_position": groupPosition,
//         "current_balance_personal": currentBalancePersonal,
//         "current_balance_group": currentBalanceGroup,
//         "photo": photo,
//     };
// }

// class MeasureUnit {
//     final String unitId;
//     final String unitName;

//     MeasureUnit({
//         required this.unitId,
//         required this.unitName,
//     });

//     factory MeasureUnit.fromJson(Map<String, dynamic> json) => MeasureUnit(
//         unitId: json["unit_id"],
//         unitName: json["unit_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "unit_id": unitId,
//         "unit_name": unitName,
//     };
// }

// class PaymentMode {
//     final String id;
//     final String name;

//     PaymentMode({
//         required this.id,
//         required this.name,
//     });

//     factory PaymentMode.fromJson(Map<String, dynamic> json) => PaymentMode(
//         id: json["id"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//     };
// }

// class Project {
//     final String workId;
//     final String workName;

//     Project({
//         required this.workId,
//         required this.workName,
//     });

//     factory Project.fromJson(Map<String, dynamic> json) => Project(
//         workId: json["work_id"],
//         workName: json["work_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "work_id": workId,
//         "work_name": workName,
//     };
// }

// class SalePriceCategory {
//     final int value;
//     final String name;

//     SalePriceCategory({
//         required this.value,
//         required this.name,
//     });

//     factory SalePriceCategory.fromJson(Map<String, dynamic> json) => SalePriceCategory(
//         value: json["value"],
//         name: json["name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "value": value,
//         "name": name,
//     };
// }

// class Service {
//     final String serviceId;
//     final String serviceName;
//     final String activeStatus;
//     final String deleteStatus;

//     Service({
//         required this.serviceId,
//         required this.serviceName,
//         required this.activeStatus,
//         required this.deleteStatus,
//     });

//     factory Service.fromJson(Map<String, dynamic> json) => Service(
//         serviceId: json["service_id"],
//         serviceName: json["service_name"],
//         activeStatus: json["active_status"],
//         deleteStatus: json["delete_status"],
//     );

//     Map<String, dynamic> toJson() => {
//         "service_id": serviceId,
//         "service_name": serviceName,
//         "active_status": activeStatus,
//         "delete_status": deleteStatus,
//     };
// }

// class Supervisor {
//     final String userId;
//     final String userAlias;

//     Supervisor({
//         required this.userId,
//         required this.userAlias,
//     });

//     factory Supervisor.fromJson(Map<String, dynamic> json) => Supervisor(
//         userId: json["user_id"],
//         userAlias: json["user_alias"],
//     );

//     Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "user_alias": userAlias,
//     };
// }

// class TaVehicleType {
//     final dynamic vehicleTypeId;
//     final String type;
//     final String fixedRate;
//     final String rate;

//     TaVehicleType({
//         required this.vehicleTypeId,
//         required this.type,
//         required this.fixedRate,
//         required this.rate,
//     });

//     factory TaVehicleType.fromJson(Map<String, dynamic> json) => TaVehicleType(
//         vehicleTypeId: json["vehicle_type_id"],
//         type: json["type"],
//         fixedRate: json["fixed_rate"],
//         rate: json["rate"],
//     );

//     Map<String, dynamic> toJson() => {
//         "vehicle_type_id": vehicleTypeId,
//         "type": type,
//         "fixed_rate": fixedRate,
//         "rate": rate,
//     };
// }

// class TaxPercentagesNew {
//     final String taxId;
//     final String taxPercentage;
//     final String tax1Percent;
//     final String tax2Percent;
//     final String tax3Percent;
//     final String deleteStatus;
//     final String taxName;

//     TaxPercentagesNew({
//         required this.taxId,
//         required this.taxPercentage,
//         required this.tax1Percent,
//         required this.tax2Percent,
//         required this.tax3Percent,
//         required this.deleteStatus,
//         required this.taxName,
//     });

//     factory TaxPercentagesNew.fromJson(Map<String, dynamic> json) => TaxPercentagesNew(
//         taxId: json["tax_id"],
//         taxPercentage: json["tax_percentage"],
//         tax1Percent: json["tax1_percent"],
//         tax2Percent: json["tax2_percent"],
//         tax3Percent: json["tax3_percent"],
//         deleteStatus: json["delete_status"],
//         taxName: json["tax_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "tax_id": taxId,
//         "tax_percentage": taxPercentage,
//         "tax1_percent": tax1Percent,
//         "tax2_percent": tax2Percent,
//         "tax3_percent": tax3Percent,
//         "delete_status": deleteStatus,
//         "tax_name": taxName,
//     };
// }

// class TaxStateCode {
//     final String stateId;
//     final String stateCode;
//     final String stateName;

//     TaxStateCode({
//         required this.stateId,
//         required this.stateCode,
//         required this.stateName,
//     });

//     factory TaxStateCode.fromJson(Map<String, dynamic> json) => TaxStateCode(
//         stateId: json["state_id"],
//         stateCode: json["state_code"],
//         stateName: json["state_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "state_id": stateId,
//         "state_code": stateCode,
//         "state_name": stateName,
//     };
// }

// class ToolCategory {
//     final String catId;
//     final String catName;

//     ToolCategory({
//         required this.catId,
//         required this.catName,
//     });

//     factory ToolCategory.fromJson(Map<String, dynamic> json) => ToolCategory(
//         catId: json["cat_id"],
//         catName: json["cat_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "cat_id": catId,
//         "cat_name": catName,
//     };
// }

// class Type {
//     final String typeId;
//     final String typeName;

//     Type({
//         required this.typeId,
//         required this.typeName,
//     });

//     factory Type.fromJson(Map<String, dynamic> json) => Type(
//         typeId: json["type_id"],
//         typeName: json["type_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "type_id": typeId,
//         "type_name": typeName,
//     };
    
// }
class Customer {
  final String customer_id;
  final String branch_id;
  final String sale_price_category;
  final String customer_name;
  final String contact_person;
  final String customer_location;
  final String customer_phone;
  final String customer_email;
  final String customer_tax_no;
  final String customer_tax_state;
  final String created_date;
  final String created_by;
  final String updated_date;
  final String updated_by;
  final String delete_status;
  final String state_id;
  final String state_code;
  final String state_name;

  Customer({
    required this.customer_id,
    required this.branch_id,
    required this.sale_price_category,
    required this.customer_name,
    required this.contact_person,
    required this.customer_location,
    required this.customer_phone,
    required this.customer_email,
    required this.customer_tax_no,
    required this.customer_tax_state,
    required this.created_date,
    required this.created_by,
    required this.updated_date,
    required this.updated_by,
    required this.delete_status,
    required this.state_id,
    required this.state_code,
    required this.state_name,
  });

  // Factory constructor to create a Customer from JSON
  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      customer_id: json['customer_id'] ?? '',
      branch_id: json['branch_id'] ?? '',
      sale_price_category: json['sale_price_category'] ?? '',
      customer_name: json['customer_name'] ?? '',
      contact_person: json['contact_person'] ?? '',
      customer_location: json['customer_location'] ?? '',
      customer_phone: json['customer_phone'] ?? '',
      customer_email: json['customer_email'] ?? '',
      customer_tax_no: json['customer_tax_no'] ?? '',
      customer_tax_state: json['customer_tax_state'] ?? '',
      created_date: json['created_date'] ?? '',
      created_by: json['created_by'] ?? '',
      updated_date: json['updated_date'] ?? '',
      updated_by: json['updated_by'] ?? '',
      delete_status: json['delete_status'] ?? '',
      state_id: json['state_id'] ?? '',
      state_code: json['state_code'] ?? '',
      state_name: json['state_name'] ?? '',
    );
  }

  // Method to convert a Customer instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'customer_id': customer_id,
      'branch_id': branch_id,
      'sale_price_category': sale_price_category,
      'customer_name': customer_name,
      'contact_person': contact_person,
      'customer_location': customer_location,
      'customer_phone': customer_phone,
      'customer_email': customer_email,
      'customer_tax_no': customer_tax_no,
      'customer_tax_state': customer_tax_state,
      'created_date': created_date,
      'created_by': created_by,
      'updated_date': updated_date,
      'updated_by': updated_by,
      'delete_status': delete_status,
      'state_id': state_id,
      'state_code': state_code,
      'state_name': state_name,
    };
  }
}
