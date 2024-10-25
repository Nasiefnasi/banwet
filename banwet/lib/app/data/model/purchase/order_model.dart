class OrderModel {
  String? userId;
  String? workId;
  String? type;
  String? supplier;
  String? vehicleNumber;
  String? invoiceNumber;
  String? totalBilledAmount;
  List<Order>? order;

  OrderModel(
      {this.userId,
        this.workId,
        this.type,
        this.supplier,
        this.vehicleNumber,
        this.invoiceNumber,
        this.totalBilledAmount,
        this.order});

  OrderModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    workId = json['work_id'];
    type = json['type'];
    supplier = json['supplier'];
    vehicleNumber = json['vehicle_number'];
    invoiceNumber = json['invoice_number'];
    totalBilledAmount = json['total_billed_amount'];
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['work_id'] = this.workId;
    data['type'] = this.type;
    data['supplier'] = this.supplier;
    data['vehicle_number'] = this.vehicleNumber;
    data['invoice_number'] = this.invoiceNumber;
    data['total_billed_amount'] = this.totalBilledAmount;
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String? materialId;
  String? quantity;
  String? description;

  Order({this.materialId, this.quantity, this.description});

  Order.fromJson(Map<String, dynamic> json) {
    materialId = json['material_id'];
    quantity = json['quantity'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['material_id'] = this.materialId;
    data['quantity'] = this.quantity;
    data['description'] = this.description;
    return data;
  }
}
