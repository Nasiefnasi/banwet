class BillPostModel {
  String? userId;
  String? workId;
  String? type;
  String? supplier;
  String? vehicleNumber;
  String? invoiceNumber;
  String? totalBilledAmount;
  List<BillOrder>? billOrder;

  BillPostModel(
      {this.userId,
      this.workId,
      this.type,
      this.supplier,
      this.vehicleNumber,
      this.invoiceNumber,
      this.totalBilledAmount,
      this.billOrder});

  BillPostModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    workId = json['work_id'];
    type = json['type'];
    supplier = json['supplier'];
    vehicleNumber = json['vehicle_number'];
    invoiceNumber = json['invoice_number'];
    totalBilledAmount = json['total_billed_amount'];
    if (json['order'] != null) {
      billOrder = <BillOrder>[];
      json['order'].forEach((v) {
        billOrder!.add(BillOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['work_id'] = workId;
    data['type'] = type;
    data['supplier'] = supplier;
    data['vehicle_number'] = vehicleNumber;
    data['invoice_number'] = invoiceNumber;
    data['total_billed_amount'] = totalBilledAmount;
    if (billOrder != null) {
      data['order'] = billOrder!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillOrder {
  String? materialId;
  String? quantity;
  String? description;
  String? unitPrice;
  String? taxPercentage;

  BillOrder(
      {this.materialId,
      this.quantity,
      this.description,
      this.unitPrice,
      this.taxPercentage});

  BillOrder.fromJson(Map<String, dynamic> json) {
    materialId = json['material_id'];
    quantity = json['quantity'];
    description = json['description'];
    unitPrice = json['unit_price'];
    taxPercentage = json['tax_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['material_id'] = materialId;
    data['quantity'] = quantity;
    data['description'] = description;
    data['unit_price'] = unitPrice;
    data['tax_percent'] = taxPercentage;
    return data;
  }
}
