class OccupationModel {
  String? regDate;
  int? deleteState;
  int? ctgoOccupationId;
  int? userId;
  String? ctgoOccupationName;
  int? sceneId;
  String? updateDate;

  OccupationModel(
      {this.regDate,
        this.deleteState,
        this.ctgoOccupationId,
        this.userId,
        this.ctgoOccupationName,
        this.sceneId,
        this.updateDate});

  OccupationModel.fromJson(Map<String, dynamic> json) {
    regDate = json['reg_date'];
    deleteState = json['delete_state'];
    ctgoOccupationId = json['ctgo_occupation_id'];
    userId = json['user_id'];
    ctgoOccupationName = json['ctgo_occupation_name'];
    sceneId = json['scene_id'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reg_date'] = this.regDate;
    data['delete_state'] = this.deleteState;
    data['ctgo_occupation_id'] = this.ctgoOccupationId;
    data['user_id'] = this.userId;
    data['ctgo_occupation_name'] = this.ctgoOccupationName;
    data['scene_id'] = this.sceneId;
    data['update_date'] = this.updateDate;
    return data;
  }
}