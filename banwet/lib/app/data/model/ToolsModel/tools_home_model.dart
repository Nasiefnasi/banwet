class ToolsHomeModel {
  bool? status;
  List<ToolsData>? data;

  ToolsHomeModel({this.status, this.data});

  ToolsHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ToolsData>[];
      json['data'].forEach((v) {
        data!.add(ToolsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ToolsData {
  String? toolId;
  String? name;
  String? categoryName;
  String? categoryId;
  String? description;
  String? ownedQty;
  String? totalTransferredIn;
  String? totalTransferredOut;
  String? totalRentedIn;
  String? totalRentedReturned;
  int? totalQtyPresent;
  int? editable;
  int? total_at_other_sites;
  int? totalatsite;
  int? totalatoffice;
  int? totalrentedatsite;
  ToolsData(
      {this.toolId,
      this.name,
      this.total_at_other_sites,
      this.totalatsite,
      this.totalatoffice,
      this.categoryName,
      this.categoryId,
      this.description,
      this.ownedQty,
      this.totalTransferredIn,
      this.totalTransferredOut,
      this.totalRentedIn,
      this.totalRentedReturned,
      this.totalQtyPresent,
      this.editable});

  ToolsData.fromJson(Map<String, dynamic> json) {
    totalatsite = json["total_at_site"];
    total_at_other_sites = json['total_at_other_sites'];
    totalatoffice = json['total_at_office'];
    totalrentedatsite = json["total_rented_at_site"];
    toolId = json['tool_id'];
    name = json['name'];
    categoryName = json['category_name'];
    categoryId = json['category_id'];
    description = json['description'];
    ownedQty = json['owned_qty'];
    totalTransferredIn = json['total_transferred_in'];
    totalTransferredOut = json['total_transferred_out'];
    totalRentedIn = json['total_rented_in'];
    totalRentedReturned = json['total_rented_returned'];
    totalQtyPresent = json['total_qty_present'];
    editable = json['editable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total_at_site"] = totalatsite;
    data['total_at_other_sites'] = total_at_other_sites;
    data["total_at_office"] = totalatoffice;
    data["total_rented_at_site"] = totalrentedatsite;
    data['tool_id'] = toolId;
    data['name'] = name;
    data['category_name'] = categoryName;
    data['category_id'] = categoryId;
    data['description'] = description;
    data['owned_qty'] = ownedQty;
    data['total_transferred_in'] = totalTransferredIn;
    data['total_transferred_out'] = totalTransferredOut;
    data['total_rented_in'] = totalRentedIn;
    data['total_rented_returned'] = totalRentedReturned;
    data['total_qty_present'] = totalQtyPresent;
    data['editable'] = editable;
    return data;
  }
}
