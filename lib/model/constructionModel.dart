class ConstructionModel {
  int? ctgoConstructionId;
  String? regDate;
  int? deleteState;
  int? userId;
  String? ctgoConstructionName;
  int? sceneId;
  String? updateDate;

  ConstructionModel(
      {this.ctgoConstructionId,
        this.regDate,
        this.deleteState,
        this.userId,
        this.ctgoConstructionName,
        this.sceneId,
        this.updateDate});

  ConstructionModel.fromJson(Map<String, dynamic> json) {
    ctgoConstructionId = json['ctgo_construction_id'];
    regDate = json['reg_date'];
    deleteState = json['delete_state'];
    userId = json['user_id'];
    ctgoConstructionName = json['ctgo_construction_name'];
    sceneId = json['scene_id'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['reg_date'] = this.regDate;
    data['delete_state'] = this.deleteState;
    data['user_id'] = this.userId;
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['scene_id'] = this.sceneId;
    data['update_date'] = this.updateDate;
    return data;
  }
}