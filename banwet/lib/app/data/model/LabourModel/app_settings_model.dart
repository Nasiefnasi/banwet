class AppSettingsModel {
  bool? status;
  List<Data>? data;

  AppSettingsModel({this.status, this.data});

  AppSettingsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? settingsId;
  String? settingsCategory;
  String? settingsName;
  String? value;
  String? value2;
  String? remarks;

  Data(
      {this.settingsId,
        this.settingsCategory,
        this.settingsName,
        this.value,
        this.value2,
        this.remarks});

  Data.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsCategory = json['settings_category'];
    settingsName = json['settings_name'];
    value = json['value'];
    value2 = json['value_2'];
    remarks = json['remarks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['settings_id'] = this.settingsId;
    data['settings_category'] = this.settingsCategory;
    data['settings_name'] = this.settingsName;
    data['value'] = this.value;
    data['value_2'] = this.value2;
    data['remarks'] = this.remarks;
    return data;
  }
}
