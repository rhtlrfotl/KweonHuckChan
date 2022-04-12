class SafetyEducationModel {
  String? educationEndTime;
  String? educatorName;
  String? educationMethod;
  String? userName;
  int? educationId;
  int? sceneId;
  String? educationTitle;
  String? educationClassName;
  int? educationClassId;
  String? educationStartTime;
  int? educationAttendantCount;
  String? educationDate;
  String? regDate;
  String? educatorArea;
  int? userId;
  String? sceneName;

  SafetyEducationModel(
      {this.educationEndTime,
        this.educatorName,
        this.educationMethod,
        this.userName,
        this.educationId,
        this.sceneId,
        this.educationTitle,
        this.educationClassName,
        this.educationClassId,
        this.educationStartTime,
        this.educationAttendantCount,
        this.educationDate,
        this.regDate,
        this.educatorArea,
        this.userId,
        this.sceneName});

  SafetyEducationModel.fromJson(Map<String, dynamic> json) {
    educationEndTime = json['education_end_time'];
    educatorName = json['educator_name'];
    educationMethod = json['education_method'];
    userName = json['user_name'];
    educationId = json['education_id'];
    sceneId = json['scene_id'];
    educationTitle = json['education_title'];
    educationClassName = json['education_class_name'];
    educationClassId = json['education_class_id'];
    educationStartTime = json['education_start_time'];
    educationAttendantCount = json['education_attendant_count'];
    educationDate = json['education_date'];
    regDate = json['reg_date'];
    educatorArea = json['educator_area'];
    userId = json['user_id'];
    sceneName = json['scene_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['education_end_time'] = this.educationEndTime;
    data['educator_name'] = this.educatorName;
    data['education_method'] = this.educationMethod;
    data['user_name'] = this.userName;
    data['education_id'] = this.educationId;
    data['scene_id'] = this.sceneId;
    data['education_title'] = this.educationTitle;
    data['education_class_name'] = this.educationClassName;
    data['education_class_id'] = this.educationClassId;
    data['education_start_time'] = this.educationStartTime;
    data['education_attendant_count'] = this.educationAttendantCount;
    data['education_date'] = this.educationDate;
    data['reg_date'] = this.regDate;
    data['educator_area'] = this.educatorArea;
    data['user_id'] = this.userId;
    data['scene_name'] = this.sceneName;
    return data;
  }
}