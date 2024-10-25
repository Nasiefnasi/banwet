class UserHomeModel {
  bool? status;
  int? userId;
  String? name;
  String? email;
  String? phone;
  String? roletitle;
  String? branchId;
  String? photo;
  int? accStatus;
  String? userType;
  String? message;
  int? projectAccess;
  String? projectAccessWithoutDutySign;
  int? attendanceMarked;
  String? attendanceStatus;
  int? signedInStatus;
  int? signedOffStatus;
  String? signedInRemarks;
  String? signedOffRemarks;
  String? projectwiseSign;
  int? projectwiseSignInStatus;
  int? projectwiseSignInProjectId;

  UserHomeModel(
      {this.status,
      this.userId,
      this.name,
      this.email,
      this.phone,
      this.branchId,
      this.photo,
      this.accStatus,
      this.roletitle,
      this.userType,
      this.message,
      this.projectAccess,
      this.projectAccessWithoutDutySign,
      this.attendanceMarked,
      this.attendanceStatus,
      this.signedInStatus,
      this.signedOffStatus,
      this.signedInRemarks,
      this.signedOffRemarks,
      this.projectwiseSign,
      this.projectwiseSignInStatus,
      this.projectwiseSignInProjectId});

  UserHomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    roletitle = json['role_title'];
    phone = json['phone'];
    branchId = json['branch_id'];
    photo = json['photo'];
    accStatus = json['acc_status'];
    userType = json['user_type'];
    message = json['message'];
    projectAccess = json['project_access'];
    projectAccessWithoutDutySign = json['project_access_without_duty_sign'];
    attendanceMarked = json['attendance_marked'];
    attendanceStatus = json['attendance_status'].toString();
    signedInStatus = json['signed_in_status'];
    signedOffStatus = json['signed_off_status'];
    signedInRemarks = json['signed_in_remarks'];
    signedOffRemarks = json['signed_off_remarks'];
    projectwiseSign = json['projectwise_sign'];
    projectwiseSignInStatus = json['projectwise_sign_in_status'];
    projectwiseSignInProjectId = json['projectwise_sign_in_project_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['role_title'] = this.roletitle;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['branch_id'] = this.branchId;
    data['photo'] = this.photo;
    data['acc_status'] = this.accStatus;
    data['user_type'] = this.userType;
    data['message'] = this.message;
    data['project_access'] = this.projectAccess;
    data['project_access_without_duty_sign'] =
        this.projectAccessWithoutDutySign;
    data['attendance_marked'] = this.attendanceMarked;
    data['attendance_status'] = this.attendanceStatus;
    data['signed_in_status'] = this.signedInStatus;
    data['signed_off_status'] = this.signedOffStatus;
    data['signed_in_remarks'] = this.signedInRemarks;
    data['signed_off_remarks'] = this.signedOffRemarks;
    data['projectwise_sign'] = this.projectwiseSign;
    data['projectwise_sign_in_status'] = this.projectwiseSignInStatus;
    data['projectwise_sign_in_project_id'] = this.projectwiseSignInProjectId;
    return data;
  }
}
