class RequestModel {
  List<Data>? data;

  RequestModel({this.data});

  RequestModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? materialId;
  String? materialName;
  String? unitId;
  String? unitName;
  String? categoryId;
  String? categoryName;
  String? unitPrice;
  String? itemCode;

  Data(
      {this.materialId,
      this.materialName,
      this.unitId,
      this.unitName,
      this.categoryId,
      this.categoryName,
      this.unitPrice,
      this.itemCode});

  Data.fromJson(Map<String, dynamic> json) {
    materialId = json['material_id'];
    materialName = json['material_name'];
    unitId = json['unit_id'];
    unitName = json['unit_name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    unitPrice = json['unit_price'];
    itemCode = json['item_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['material_id'] = this.materialId;
    data['material_name'] = this.materialName;
    data['unit_id'] = this.unitId;
    data['unit_name'] = this.unitName;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['unit_price'] = this.unitPrice;
    data['item_code'] = this.itemCode;
    return data;
  }
}
