class SampleModel {
  String? userId;
  String? type;
  String? workId;

  List<Item>? item;

  SampleModel({this.userId, this.type, this.workId, this.item});

  SampleModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    type = json['type'];
    workId = json['work_id'];
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item!.add(Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['type'] = type;
    data['work_id'] = workId;
    if (item != null) {
      data['item'] = item!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String? materialId;
  String? quantity;
  String? description;

  Item({this.materialId, this.quantity, this.description});

  Item.fromJson(Map<String, dynamic> json) {
    materialId = json['material_id'];
    quantity = json['quantity'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['material_id'] = materialId;
    data['quantity'] = quantity;
    data['description'] = description;
    return data;
  }
}

class MetName2 {
  String? name;
  String? qunit;
  String? qtext;
  String? totalAmt;
  String? taxPer;

  MetName2(
      {required this.name,
      required this.qunit,
      required this.qtext,
      required this.totalAmt,
      required this.taxPer});

  get tot => null;
}

class MetName {
  String? name;
  String? qtext;
  String? qunit;

  MetName({
    required this.name,
    required this.qtext,
    required this.qunit,
  });
}
