class CashModel {
  dynamic totalOpbalance;
  int? totalPurchaseOrderPayment;
  int? totalPurchaseBillPayment;
  int? totalPurchasePayment;
  int? totalSubcontractPayment;
  int? totalOtherExpense;
  int? totalLabourWagePayments;
  int? totalClientPaymentsReceived;
  int? totalUserPettyPaymentsReceived;
  int? totalUserPettyPaymentsReleased;
  int? totalUserPaymentsReturned;
  int? totalUserCommissionReceived;
  int? otherIncomeReceived;
  int? supplierAdvancePayments;
  int? supplierOpbalancePayments;
  int? toolPayments;
  int? loanPayments;
  int? travelAllowance;
  int? totalTransferredInAmount;
  int? totalTransferredOutAmount;
  int? salaryPayments;
  int? employeePayments;
  int? vehiclePayments;
  int? totalUserPaymentsReceived;
  int? totalExpenseAmount;
  dynamic totalBalance;
  int? userCommissionShowStatus;
  int? leaveApplicationCount;

  CashModel(
      {this.totalOpbalance,
      this.totalPurchaseOrderPayment,
      this.totalPurchaseBillPayment,
      this.totalPurchasePayment,
      this.totalSubcontractPayment,
      this.totalOtherExpense,
      this.totalLabourWagePayments,
      this.totalClientPaymentsReceived,
      this.totalUserPettyPaymentsReceived,
      this.totalUserPettyPaymentsReleased,
      this.totalUserPaymentsReturned,
      this.totalUserCommissionReceived,
      this.otherIncomeReceived,
      this.supplierAdvancePayments,
      this.supplierOpbalancePayments,
      this.toolPayments,
      this.loanPayments,
      this.travelAllowance,
      this.totalTransferredInAmount,
      this.totalTransferredOutAmount,
      this.salaryPayments,
      this.employeePayments,
      this.vehiclePayments,
      this.totalUserPaymentsReceived,
      this.totalExpenseAmount,
      this.totalBalance,
      this.userCommissionShowStatus,
      this.leaveApplicationCount});

  CashModel.fromJson(Map<String, dynamic> json) {
    totalOpbalance = json['total_opbalance'];
    totalPurchaseOrderPayment = json['total_purchase_order_payment'];
    totalPurchaseBillPayment = json['total_purchase_bill_payment'];
    totalPurchasePayment = json['total_purchase_payment'];
    totalSubcontractPayment = json['total_subcontract_payment'];
    totalOtherExpense = json['total_other_expense'];
    totalLabourWagePayments = json['total_labour_wage_payments'];
    totalClientPaymentsReceived = json['total_client_payments_received'];
    totalUserPettyPaymentsReceived = json['total_user_petty_payments_received'];
    totalUserPettyPaymentsReleased = json['total_user_petty_payments_released'];
    totalUserPaymentsReturned = json['total_user_payments_returned'];
    totalUserCommissionReceived = json['total_user_commission_received'];
    otherIncomeReceived = json['other_income_received'];
    supplierAdvancePayments = json['supplier_advance_payments'];
    supplierOpbalancePayments = json['supplier_opbalance_payments'];
    toolPayments = json['tool_payments'];
    loanPayments = json['loan_payments'];
    travelAllowance = json['travel_allowance'];
    totalTransferredInAmount = json['total_transferred_in_amount'];
    totalTransferredOutAmount = json['total_transferred_out_amount'];
    salaryPayments = json['salary_payments'];
    employeePayments = json['employee_payments'];
    vehiclePayments = json['vehicle_payments'];
    totalUserPaymentsReceived = json['total_user_payments_received'];
    totalExpenseAmount = json['total_expense_amount'];
    totalBalance = json['total_balance'];
    userCommissionShowStatus = json['user_commission_show_status'];
    leaveApplicationCount = json['leave_application_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_opbalance'] = this.totalOpbalance;
    data['total_purchase_order_payment'] = this.totalPurchaseOrderPayment;
    data['total_purchase_bill_payment'] = this.totalPurchaseBillPayment;
    data['total_purchase_payment'] = this.totalPurchasePayment;
    data['total_subcontract_payment'] = this.totalSubcontractPayment;
    data['total_other_expense'] = this.totalOtherExpense;
    data['total_labour_wage_payments'] = this.totalLabourWagePayments;
    data['total_client_payments_received'] = this.totalClientPaymentsReceived;
    data['total_user_petty_payments_received'] =
        this.totalUserPettyPaymentsReceived;
    data['total_user_petty_payments_released'] =
        this.totalUserPettyPaymentsReleased;
    data['total_user_payments_returned'] = this.totalUserPaymentsReturned;
    data['total_user_commission_received'] = this.totalUserCommissionReceived;
    data['other_income_received'] = this.otherIncomeReceived;
    data['supplier_advance_payments'] = this.supplierAdvancePayments;
    data['supplier_opbalance_payments'] = this.supplierOpbalancePayments;
    data['tool_payments'] = this.toolPayments;
    data['loan_payments'] = this.loanPayments;
    data['travel_allowance'] = this.travelAllowance;
    data['total_transferred_in_amount'] = this.totalTransferredInAmount;
    data['total_transferred_out_amount'] = this.totalTransferredOutAmount;
    data['salary_payments'] = this.salaryPayments;
    data['employee_payments'] = this.employeePayments;
    data['vehicle_payments'] = this.vehiclePayments;
    data['total_user_payments_received'] = this.totalUserPaymentsReceived;
    data['total_expense_amount'] = this.totalExpenseAmount;
    data['total_balance'] = this.totalBalance;
    data['user_commission_show_status'] = this.userCommissionShowStatus;
    data['leave_application_count'] = this.leaveApplicationCount;
    return data;
  }
}
