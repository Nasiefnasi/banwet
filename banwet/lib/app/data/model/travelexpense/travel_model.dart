class TavelExpenseModel {
  bool? status;
  List<TravelData>? data;

  TavelExpenseModel({this.status, this.data});

  TavelExpenseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TravelData>[];
      json['data'].forEach((v) {
        data!.add(TravelData.fromJson(v));
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

class TravelData {
  String? taId;
  String? userName;
  String? vehicleType;
  String? from;
  String? to;
  String? distance;
  String? fixedrate;

  String? taAmount;
  String? taRemarks;
  String? imageStart;
  String? imageEnd;
  String? createdBy;
  String? createdDate;
  int? editable;
  String? entryApprovalStatus;

  TravelData(
      {this.taId,
      this.userName,
      this.vehicleType,
      this.from,
      this.to,
      this.distance,
      this.taAmount,
      this.taRemarks,
      this.imageStart,
      this.imageEnd,
      this.createdBy,
      this.createdDate,
      this.editable,
      this.fixedrate,
      this.entryApprovalStatus});

  TravelData.fromJson(Map<String, dynamic> json) {
    taId = json['ta_id'];
    userName = json['user_name'];
    vehicleType = json['vehicle_type'];
    from = json['from'];
    to = json['to'];
    distance = json['distance'];
    taAmount = json['ta_amount'];
    taRemarks = json['ta_remarks'];
    imageStart = json['image_start'];
    fixedrate = json['fixed_rate'];
    imageEnd = json['image_end'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    editable = json['editable'];
    entryApprovalStatus = json['entry_approval_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ta_id'] = taId;
    data['user_name'] = userName;
    data['vehicle_type'] = vehicleType;
    data['from'] = from;
    data['to'] = to;
    data['distance'] = distance;
    data['ta_amount'] = taAmount;
    data['ta_remarks'] = taRemarks;
    data['image_start'] = imageStart;
    data['image_end'] = imageEnd;
    data['created_by'] = createdBy;
    data['created_date'] = createdDate;
    data['editable'] = editable;
    data['entry_approval_status'] = entryApprovalStatus;
    return data;
  }
}
