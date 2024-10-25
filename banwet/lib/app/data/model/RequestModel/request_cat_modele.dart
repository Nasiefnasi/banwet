class RequestCatModel {
  bool? status;
  List<RequestCatModelData>? data;

  RequestCatModel({this.status, this.data});

  RequestCatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <RequestCatModelData>[];
      json['data'].forEach((v) {
        data!.add(RequestCatModelData.fromJson(v));
      });
    }
  }
}

class RequestCatModelData {
  String? categoryId;
  String? categoryName;
  List<Materials>? materials;

  RequestCatModelData({this.categoryId, this.categoryName, this.materials});

  RequestCatModelData.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    if (json['materials'] != null) {
      materials = <Materials>[];
      json['materials'].forEach((v) {
        materials!.add(Materials.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    if (materials != null) {
      data['materials'] = materials!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Materials {
  String? materialId;
  String? materialName;
  String? unitId;
  String? unitName;
  String? categoryId;
  String? categoryName;
  String? materialUnitPrice;

  Materials(
      {this.materialId,
      this.materialName,
      this.unitId,
      this.unitName,
      this.categoryId,
      this.categoryName,
      this.materialUnitPrice});

  Materials.fromJson(Map<String, dynamic> json) {
    materialId = json['material_id'];
    materialName = json['material_name'];
    unitId = json['unit_id'];
    unitName = json['unit_name'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    materialUnitPrice = json['material_unit_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['material_id'] = materialId;
    data['material_name'] = materialName;
    data['unit_id'] = unitId;
    data['unit_name'] = unitName;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['material_unit_price'] = materialUnitPrice;
    return data;
  }
}
