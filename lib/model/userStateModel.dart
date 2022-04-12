class UserStateModel {
  String? workState;
  int? userId;
  String? areaMain;
  int? sceneId;
  String? areaSub;
  String? outDatetime;
  String? inDatetime;

  UserStateModel(
      {this.workState,
        this.userId,
        this.areaMain,
        this.sceneId,
        this.areaSub,
        this.outDatetime,
        this.inDatetime});

  UserStateModel.fromJson(Map<String, dynamic> json) {
    workState = json['work_state'];
    userId = json['user_id'];
    areaMain = json['area_main'];
    sceneId = json['scene_id'];
    areaSub = json['area_sub'];
    outDatetime = json['out_datetime'];
    inDatetime = json['in_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['work_state'] = this.workState;
    data['user_id'] = this.userId;
    data['area_main'] = this.areaMain;
    data['scene_id'] = this.sceneId;
    data['area_sub'] = this.areaSub;
    data['out_datetime'] = this.outDatetime;
    data['in_datetime'] = this.inDatetime;
    return data;
  }
}