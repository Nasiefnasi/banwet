class ProjectIcon {
  bool? status;
  List<Data>? data;

  ProjectIcon({this.status, this.data});

  ProjectIcon.fromJson(Map<String, dynamic> json) {
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
  int? slno;
  String? iconTitle;
  String? iconName;
  List<String>? subIcons;

  Data({this.slno, this.iconTitle, this.iconName, this.subIcons});

  Data.fromJson(Map<String, dynamic> json) {
    slno = json['slno'];
    iconTitle = json['icon_title'];
    iconName = json['icon_name'];
    subIcons = json['sub_icons'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slno'] = this.slno;
    data['icon_title'] = this.iconTitle;
    data['icon_name'] = this.iconName;
    data['sub_icons'] = this.subIcons;
    return data;
  }
}
