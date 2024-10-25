class ProjectIconss {
  bool? status;
  List<Data>? data;

  ProjectIconss({this.status, this.data});

  ProjectIconss.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slno'] = slno;
    data['icon_title'] = iconTitle;
    data['icon_name'] = iconName;
    data['sub_icons'] = subIcons;
    return data;
  }
}
