class WorkerManagementDetailModel {
  List<UserFile>? userFile;
  UserData? userData;
  List<UserCompany>? userCompany;

  WorkerManagementDetailModel(
      {this.userFile, this.userData, this.userCompany});

  WorkerManagementDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['user_file'] != null) {
      userFile = <UserFile>[];
      json['user_file'].forEach((v) {
        userFile!.add(new UserFile.fromJson(v));
      });
    }
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    if (json['user_company'] != null) {
      userCompany = <UserCompany>[];
      json['user_company'].forEach((v) {
        userCompany!.add(new UserCompany.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userFile != null) {
      data['user_file'] = this.userFile!.map((v) => v.toJson()).toList();
    }
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    if (this.userCompany != null) {
      data['user_company'] = this.userCompany!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserFile {
  int? seqNo;
  int? orderNo;
  String? fileUrl;
  String? fileUrlFull;
  String? contentType;
  int? userId;
  String? fileName;
  String? fileType;
  String? viewType;
  String? fileSize;

  UserFile(
      {this.seqNo,
        this.orderNo,
        this.fileUrl,
        this.fileUrlFull,
        this.contentType,
        this.userId,
        this.fileName,
        this.fileType,
        this.viewType,
        this.fileSize});

  UserFile.fromJson(Map<String, dynamic> json) {
    seqNo = json['seq_no'];
    orderNo = json['order_no'];
    fileUrl = json['file_url'];
    fileUrlFull = json['file_url_full'];
    contentType = json['content_type'];
    userId = json['user_id'];
    fileName = json['file_name'];
    fileType = json['file_type'];
    viewType = json['view_type'];
    fileSize = json['file_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seq_no'] = this.seqNo;
    data['order_no'] = this.orderNo;
    data['file_url'] = this.fileUrl;
    data['file_url_full'] = this.fileUrlFull;
    data['content_type'] = this.contentType;
    data['user_id'] = this.userId;
    data['file_name'] = this.fileName;
    data['file_type'] = this.fileType;
    data['view_type'] = this.viewType;
    data['file_size'] = this.fileSize;
    return data;
  }
}

class UserData {
  int? userId;
  String? userName;
  String? userPhone;
  String? authId;
  String? userBirthday;
  int? userAge;
  String? userAddress;
  String? userAddressDetail;
  String? userCareer;
  int? ctgoNationId;
  String? userForeignerNo;
  Null? userSafeDate;
  int? userLicenseState;
  String? userLicenseNo;
  int? badPush;
  Null? badNote;
  String? userSosName;
  String? userSosPhone;
  String? userSosRelation;
  String? regDate;
  String? editDate;
  String? editUserName;
  String? ctgoNationName;

  UserData(
      {this.userId,
        this.userName,
        this.userPhone,
        this.authId,
        this.userBirthday,
        this.userAge,
        this.userAddress,
        this.userAddressDetail,
        this.userCareer,
        this.ctgoNationId,
        this.userForeignerNo,
        this.userSafeDate,
        this.userLicenseState,
        this.userLicenseNo,
        this.badPush,
        this.badNote,
        this.userSosName,
        this.userSosPhone,
        this.userSosRelation,
        this.regDate,
        this.editDate,
        this.editUserName,
        this.ctgoNationName});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    authId = json['auth_id'];
    userBirthday = json['user_birthday'];
    userAge = json['user_age'];
    userAddress = json['user_address'];
    userAddressDetail = json['user_address_detail'];
    userCareer = json['user_career'];
    ctgoNationId = json['ctgo_nation_id'];
    userForeignerNo = json['user_foreigner_no'];
    userSafeDate = json['user_safe_date'];
    userLicenseState = json['user_license_state'];
    userLicenseNo = json['user_license_no'];
    badPush = json['bad_push'];
    badNote = json['bad_note'];
    userSosName = json['user_sos_name'];
    userSosPhone = json['user_sos_phone'];
    userSosRelation = json['user_sos_relation'];
    regDate = json['reg_date'];
    editDate = json['edit_date'];
    editUserName = json['edit_user_name'];
    ctgoNationName = json['ctgo_nation_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['auth_id'] = this.authId;
    data['user_birthday'] = this.userBirthday;
    data['user_age'] = this.userAge;
    data['user_address'] = this.userAddress;
    data['user_address_detail'] = this.userAddressDetail;
    data['user_career'] = this.userCareer;
    data['ctgo_nation_id'] = this.ctgoNationId;
    data['user_foreigner_no'] = this.userForeignerNo;
    data['user_safe_date'] = this.userSafeDate;
    data['user_license_state'] = this.userLicenseState;
    data['user_license_no'] = this.userLicenseNo;
    data['bad_push'] = this.badPush;
    data['bad_note'] = this.badNote;
    data['user_sos_name'] = this.userSosName;
    data['user_sos_phone'] = this.userSosPhone;
    data['user_sos_relation'] = this.userSosRelation;
    data['reg_date'] = this.regDate;
    data['edit_date'] = this.editDate;
    data['edit_user_name'] = this.editUserName;
    data['ctgo_nation_name'] = this.ctgoNationName;
    return data;
  }
}

class UserCompany {
  int? ctgoConstructionId;
  int? companyId;
  Null? workDate;
  String? ctgoOccupationName;
  int? mainState;
  int? sceneId;
  String? ctgoConstructionName;
  String? regDate;
  int? ctgoOccupationId;
  int? workCount;
  String? companyName;
  Null? companyPosition;
  String? sceneName;

  UserCompany(
      {this.ctgoConstructionId,
        this.companyId,
        this.workDate,
        this.ctgoOccupationName,
        this.mainState,
        this.sceneId,
        this.ctgoConstructionName,
        this.regDate,
        this.ctgoOccupationId,
        this.workCount,
        this.companyName,
        this.companyPosition,
        this.sceneName});

  UserCompany.fromJson(Map<String, dynamic> json) {
    ctgoConstructionId = json['ctgo_construction_id'];
    companyId = json['company_id'];
    workDate = json['work_date'];
    ctgoOccupationName = json['ctgo_occupation_name'];
    mainState = json['main_state'];
    sceneId = json['scene_id'];
    ctgoConstructionName = json['ctgo_construction_name'];
    regDate = json['reg_date'];
    ctgoOccupationId = json['ctgo_occupation_id'];
    workCount = json['work_count'];
    companyName = json['company_name'];
    companyPosition = json['company_position'];
    sceneName = json['scene_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['company_id'] = this.companyId;
    data['work_date'] = this.workDate;
    data['ctgo_occupation_name'] = this.ctgoOccupationName;
    data['main_state'] = this.mainState;
    data['scene_id'] = this.sceneId;
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['reg_date'] = this.regDate;
    data['ctgo_occupation_id'] = this.ctgoOccupationId;
    data['work_count'] = this.workCount;
    data['company_name'] = this.companyName;
    data['company_position'] = this.companyPosition;
    data['scene_name'] = this.sceneName;
    return data;
  }
}