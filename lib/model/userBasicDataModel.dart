class UserBasicDataModel {
  List<UserFile>? userFile;
  // UserPermission? userPermission;
  UserData? userData;
  UserMainCompany? userMainCompany;

  UserBasicDataModel(
      {this.userFile,
        // this.userPermission,
        this.userData,
        this.userMainCompany});

  UserBasicDataModel.fromJson(Map<String, dynamic> json) {
    if (json['user_file'] != null) {
      userFile = <UserFile>[];
      json['user_file'].forEach((v) {
        userFile!.add(new UserFile.fromJson(v));
      });
    }
    // userPermission = json['user_permission'] != null
    //     ? new UserPermission.fromJson(json['user_permission'])
    //     : null;
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    userMainCompany = json['user_main_company'] != null
        ? new UserMainCompany.fromJson(json['user_main_company'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userFile != null) {
      data['user_file'] = this.userFile!.map((v) => v.toJson()).toList();
    }
    // if (this.userPermission != null) {
    //   data['user_permission'] = this.userPermission!.toJson();
    // }
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    if (this.userMainCompany != null) {
      data['user_main_company'] = this.userMainCompany!.toJson();
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

class UserPermission {
  int? sceneId;
  int? permissionLevel;
  int? ctgoDutyId;
  int? userId;
  String? sceneName;
  String? ctgoDutyName;

  UserPermission(
      {this.sceneId,
        this.permissionLevel,
        this.ctgoDutyId,
        this.userId,
        this.sceneName,
        this.ctgoDutyName});

  UserPermission.fromJson(Map<String, dynamic> json) {
    sceneId = json['scene_id'];
    permissionLevel = json['permission_level'];
    ctgoDutyId = json['ctgo_duty_id'];
    userId = json['user_id'];
    sceneName = json['scene_name'];
    ctgoDutyName = json['ctgo_duty_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scene_id'] = this.sceneId;
    data['permission_level'] = this.permissionLevel;
    data['ctgo_duty_id'] = this.ctgoDutyId;
    data['user_id'] = this.userId;
    data['scene_name'] = this.sceneName;
    data['ctgo_duty_name'] = this.ctgoDutyName;
    return data;
  }
}

class UserData {
  int? userId;
  String? userType;
  int? authType;
  String? authId;
  String? userName;
  String? userPhone;
  String? userEmail;
  String? userBirthday;
  String? userAddress;
  String? userAddressDetail;
  int? ctgoNationId;
  String? userForeignerNo;
  String? userSosName;
  String? userSosPhone;
  String? userSosRelation;
  String? userCareer;
  int? userLicenseState;
  String? userSafeDate;
  int? badNote;
  int? badPush;
  int? biconRssi;
  String? ctgoNationName;
  int? workPermission;

  UserData(
      {this.userId,
        this.userType,
        this.authType,
        this.authId,
        this.userName,
        this.userPhone,
        this.userEmail,
        this.userBirthday,
        this.userAddress,
        this.userAddressDetail,
        this.ctgoNationId,
        this.userForeignerNo,
        this.userSosName,
        this.userSosPhone,
        this.userSosRelation,
        this.userCareer,
        this.userLicenseState,
        this.userSafeDate,
        this.badNote,
        this.badPush,
        this.biconRssi,
        this.ctgoNationName,
        this.workPermission});

  UserData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userType = json['user_type'];
    authType = json['auth_type'];
    authId = json['auth_id'];
    userName = json['user_name'];
    userPhone = json['user_phone'];
    userEmail = json['user_email'];
    userBirthday = json['user_birthday'];
    userAddress = json['user_address'];
    userAddressDetail = json['user_address_detail'];
    ctgoNationId = json['ctgo_nation_id'];
    userForeignerNo = json['user_foreigner_no'];
    userSosName = json['user_sos_name'];
    userSosPhone = json['user_sos_phone'];
    userSosRelation = json['user_sos_relation'];
    userCareer = json['user_career'];
    userLicenseState = json['user_license_state'];
    userSafeDate = json['user_safe_date'];
    badNote = json['bad_note'];
    badPush = json['bad_push'];
    biconRssi = json['bicon_rssi'];
    ctgoNationName = json['ctgo_nation_name'];
    workPermission = json['work_permission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['auth_type'] = this.authType;
    data['auth_id'] = this.authId;
    data['user_name'] = this.userName;
    data['user_phone'] = this.userPhone;
    data['user_email'] = this.userEmail;
    data['user_birthday'] = this.userBirthday;
    data['user_address'] = this.userAddress;
    data['user_address_detail'] = this.userAddressDetail;
    data['ctgo_nation_id'] = this.ctgoNationId;
    data['user_foreigner_no'] = this.userForeignerNo;
    data['user_sos_name'] = this.userSosName;
    data['user_sos_phone'] = this.userSosPhone;
    data['user_sos_relation'] = this.userSosRelation;
    data['user_career'] = this.userCareer;
    data['user_license_state'] = this.userLicenseState;
    data['user_safe_date'] = this.userSafeDate;
    data['bad_note'] = this.badNote;
    data['bad_push'] = this.badPush;
    data['bicon_rssi'] = this.biconRssi;
    data['ctgo_nation_name'] = this.ctgoNationName;
    data['work_permission'] = this.workPermission;
    return data;
  }
}

class UserMainCompany {
  int? userId;
  int? sceneId;
  String? sceneName;
  int? companyId;
  int? ctgoConstructionId;
  int? ctgoOccupationId;
  String? companyPosition;
  String? userType;
  String? companyName;
  String? companyType;
  String? ctgoConstructionName;
  String? ctgoOccupationName;

  UserMainCompany(
      {this.userId,
        this.sceneId,
        this.sceneName,
        this.companyId,
        this.ctgoConstructionId,
        this.ctgoOccupationId,
        this.companyPosition,
        this.userType,
        this.companyName,
        this.companyType,
        this.ctgoConstructionName,
        this.ctgoOccupationName});

  UserMainCompany.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    sceneId = json['scene_id'];
    sceneName = json['scene_name'];
    companyId = json['company_id'];
    ctgoConstructionId = json['ctgo_construction_id'];
    ctgoOccupationId = json['ctgo_occupation_id'];
    companyPosition = json['company_position'];
    userType = json['user_type'];
    companyName = json['company_name'];
    companyType = json['company_type'];
    ctgoConstructionName = json['ctgo_construction_name'];
    ctgoOccupationName = json['ctgo_occupation_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['scene_id'] = this.sceneId;
    data['scene_name'] = this.sceneName;
    data['company_id'] = this.companyId;
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['ctgo_occupation_id'] = this.ctgoOccupationId;
    data['company_position'] = this.companyPosition;
    data['user_type'] = this.userType;
    data['company_name'] = this.companyName;
    data['company_type'] = this.companyType;
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['ctgo_occupation_name'] = this.ctgoOccupationName;
    return data;
  }
}