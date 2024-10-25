class StockArrayIteams {

  String? stock_id;
  String? location_id;
  String? material_id;
  String? unit_id;
  String? quantity;
  StockArrayIteams(
   
      {this.location_id,
      this.material_id,
      this.quantity,
      this.stock_id,
      this.unit_id});
  StockArrayIteams.fromJson(Map<String, dynamic> json) {
    stock_id = json['stock_id'];
    location_id = json['location_id'];
    material_id = json['material_id'];
    unit_id = json['unit_id'];
    quantity = json['quantity'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stock_id'] = this.stock_id;
    data['location_id'] = this.location_id;
    data['material_id'] = this.material_id;
    data['unit_id'] = this.unit_id;
    data['quantity'] = this.quantity;

    return data;
  }
}
