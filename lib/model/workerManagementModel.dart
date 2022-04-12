class WorkerManagementModel {
  int? ctgoConstructionId;
  String? authId;
  int? companyId;
  String? userName;
  String? ctgoOccupationName;
  String? ctgoNationName;
  String? ctgoConstructionName;
  String? userProtection;
  String? userProfileFile;
  String? regDate;
  String? userType;
  int? ctgoOccupationId;
  int? workState;
  int? userId;
  int? badPush;
  String? companyName;
  String? userPhone;
  int? ctgoNationId;

  WorkerManagementModel(
      {this.ctgoConstructionId,
        this.authId,
        this.companyId,
        this.userName,
        this.ctgoOccupationName,
        this.ctgoNationName,
        this.ctgoConstructionName,
        this.userProtection,
        this.userProfileFile,
        this.regDate,
        this.userType,
        this.ctgoOccupationId,
        this.workState,
        this.userId,
        this.badPush,
        this.companyName,
        this.userPhone,
        this.ctgoNationId});

  WorkerManagementModel.fromJson(Map<String, dynamic> json) {
    ctgoConstructionId = json['ctgo_construction_id'];
    authId = json['auth_id'];
    companyId = json['company_id'];
    userName = json['user_name'];
    ctgoOccupationName = json['ctgo_occupation_name'];
    ctgoNationName = json['ctgo_nation_name'];
    ctgoConstructionName = json['ctgo_construction_name'];
    userProtection = json['user_protection'];
    userProfileFile = json['user_profile_file'];
    regDate = json['reg_date'];
    userType = json['user_type'];
    ctgoOccupationId = json['ctgo_occupation_id'];
    workState = json['work_state'];
    userId = json['user_id'];
    badPush = json['bad_push'];
    companyName = json['company_name'];
    userPhone = json['user_phone'];
    ctgoNationId = json['ctgo_nation_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['auth_id'] = this.authId;
    data['company_id'] = this.companyId;
    data['user_name'] = this.userName;
    data['ctgo_occupation_name'] = this.ctgoOccupationName;
    data['ctgo_nation_name'] = this.ctgoNationName;
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['user_protection'] = this.userProtection;
    data['user_profile_file'] = this.userProfileFile;
    data['reg_date'] = this.regDate;
    data['user_type'] = this.userType;
    data['ctgo_occupation_id'] = this.ctgoOccupationId;
    data['work_state'] = this.workState;
    data['user_id'] = this.userId;
    data['bad_push'] = this.badPush;
    data['company_name'] = this.companyName;
    data['user_phone'] = this.userPhone;
    data['ctgo_nation_id'] = this.ctgoNationId;
    return data;
  }
}