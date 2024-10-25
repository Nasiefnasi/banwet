class TaHeadModel {
  bool? status;
  List<TaVehicleType>? taVehicleType;

  TaHeadModel({this.status, this.taVehicleType});

  TaHeadModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['ta_vehicle_type'] != null) {
      taVehicleType = <TaVehicleType>[];
      json['ta_vehicle_type'].forEach((v) {
        taVehicleType!.add(new TaVehicleType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.taVehicleType != null) {
      data['ta_vehicle_type'] =
          this.taVehicleType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaVehicleType {
  String? vehicleId;
  String? type;
  String? fixedRate;
  String? rate;

  TaVehicleType({this.vehicleId, this.type, this.fixedRate, this.rate});

  TaVehicleType.fromJson(Map<String, dynamic> json) {
    vehicleId = json['vehicle_id'];
    type = json['type'];
    fixedRate = json['fixed_rate'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicle_id'] = this.vehicleId;
    data['type'] = this.type;
    data['fixed_rate'] = this.fixedRate;
    data['rate'] = this.rate;
    return data;
  }
}
