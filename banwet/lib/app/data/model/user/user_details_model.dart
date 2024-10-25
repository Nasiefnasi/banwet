class UserDetailsModel {
  bool? status;
  int? userId;
  String? name;
  String? email;
  String? phone;
  String? branchId;
  String? photo;
  int? accStatus;
  String? userType;
  String? address;
  String? dob;
  String? joinedDate;
  String? dutyStartTime;
  String? dutyEndTime;
  String? employeeCode;
  String? roleTitle;
  String? message;
  int? projectAccess;
  String? projectAccessWithoutDutySign;
  int? attendanceMarked;
  int? attendanceStatus;
  int? signedInStatus;
  int? signedOffStatus;
  String? signedInRemarks;
  String? signedOffRemarks;
  String? projectwiseSign;
  int? projectwiseSignInStatus;
  int? projectwiseSignInProjectId;

  UserDetailsModel(
      {this.status,
      this.userId,
      this.name,
      this.email,
      this.phone,
      this.branchId,
      this.photo,
      this.accStatus,
      this.userType,
      this.address,
      this.dob,
      this.joinedDate,
      this.dutyStartTime,
      this.dutyEndTime,
      this.employeeCode,
      this.roleTitle,
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

  UserDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json["status"] is bool) {
      status = json["status"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["email"] is String) {
      email = json["email"];
    }
    if (json["phone"] is String) {
      phone = json["phone"];
    }
    if (json["branch_id"] is String) {
      branchId = json["branch_id"];
    }
    if (json["photo"] is String) {
      photo = json["photo"];
    }
    if (json["acc_status"] is int) {
      accStatus = json["acc_status"];
    }
    if (json["user_type"] is String) {
      userType = json["user_type"];
    }
    if (json["address"] is String) {
      address = json["address"];
    }
    if (json["dob"] is String) {
      dob = json["dob"];
    }
    if (json["joined_date"] is String) {
      joinedDate = json["joined_date"];
    }
    if (json["duty_start_time"] is String) {
      dutyStartTime = json["duty_start_time"];
    }
    if (json["duty_end_time"] is String) {
      dutyEndTime = json["duty_end_time"];
    }
    if (json["employee_code"] is String) {
      employeeCode = json["employee_code"];
    }
    if (json["role_title"] is String) {
      roleTitle = json["role_title"];
    }
    if (json["message"] is String) {
      message = json["message"];
    }
    if (json["project_access"] is int) {
      projectAccess = json["project_access"];
    }
    if (json["project_access_without_duty_sign"] is String) {
      projectAccessWithoutDutySign = json["project_access_without_duty_sign"];
    }
    if (json["attendance_marked"] is int) {
      attendanceMarked = json["attendance_marked"];
    }
    if (json["attendance_status"] is int) {
      attendanceStatus = json["attendance_status"];
    }
    if (json["signed_in_status"] is int) {
      signedInStatus = json["signed_in_status"];
    }
    if (json["signed_off_status"] is int) {
      signedOffStatus = json["signed_off_status"];
    }
    if (json["signed_in_remarks"] is String) {
      signedInRemarks = json["signed_in_remarks"];
    }
    if (json["signed_off_remarks"] is String) {
      signedOffRemarks = json["signed_off_remarks"];
    }
    if (json["projectwise_sign"] is String) {
      projectwiseSign = json["projectwise_sign"];
    }
    if (json["projectwise_sign_in_status"] is int) {
      projectwiseSignInStatus = json["projectwise_sign_in_status"];
    }
    if (json["projectwise_sign_in_project_id"] is int) {
      projectwiseSignInProjectId = json["projectwise_sign_in_project_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["user_id"] = userId;
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["branch_id"] = branchId;
    data["photo"] = photo;
    data["acc_status"] = accStatus;
    data["user_type"] = userType;
    data["address"] = address;
    data["dob"] = dob;
    data["joined_date"] = joinedDate;
    data["duty_start_time"] = dutyStartTime;
    data["duty_end_time"] = dutyEndTime;
    data["employee_code"] = employeeCode;
    data["role_title"] = roleTitle;
    data["message"] = message;
    data["project_access"] = projectAccess;
    data["project_access_without_duty_sign"] = projectAccessWithoutDutySign;
    data["attendance_marked"] = attendanceMarked;
    data["attendance_status"] = attendanceStatus;
    data["signed_in_status"] = signedInStatus;
    data["signed_off_status"] = signedOffStatus;
    data["signed_in_remarks"] = signedInRemarks;
    data["signed_off_remarks"] = signedOffRemarks;
    data["projectwise_sign"] = projectwiseSign;
    data["projectwise_sign_in_status"] = projectwiseSignInStatus;
    data["projectwise_sign_in_project_id"] = projectwiseSignInProjectId;
    return data;
  }
}
