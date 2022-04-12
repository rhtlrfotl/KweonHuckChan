class IncongruityModel {
  String? actionComment;
  String? incongruityAfterFileData;
  int? incongruityId;
  String? userName;
  int? sceneId;
  String? actionDate;
  String? incongruityState;
  String? incongruityTarget;
  int? actionUserId;
  String? incongruityBeforeFileData;
  String? regDate;
  String? incongruityName;
  int? userId;
  String? incongruityText;
  String? incongruityCheckerUserData;
  String? incongruityDate;

  IncongruityModel(
      {this.actionComment,
        this.incongruityAfterFileData,
        this.incongruityId,
        this.userName,
        this.sceneId,
        this.actionDate,
        this.incongruityState,
        this.incongruityTarget,
        this.actionUserId,
        this.incongruityBeforeFileData,
        this.regDate,
        this.incongruityName,
        this.userId,
        this.incongruityText,
        this.incongruityCheckerUserData,
        this.incongruityDate});

  IncongruityModel.fromJson(Map<String, dynamic> json) {
    actionComment = json['action_comment'];
    incongruityAfterFileData = json['incongruity_after_file_data'];
    incongruityId = json['incongruity_id'];
    userName = json['user_name'];
    sceneId = json['scene_id'];
    actionDate = json['action_date'];
    incongruityState = json['incongruity_state'];
    incongruityTarget = json['incongruity_target'];
    actionUserId = json['action_user_id'];
    incongruityBeforeFileData = json['incongruity_before_file_data'];
    regDate = json['reg_date'];
    incongruityName = json['incongruity_name'];
    userId = json['user_id'];
    incongruityText = json['incongruity_text'];
    incongruityCheckerUserData = json['incongruity_checker_user_data'];
    incongruityDate = json['incongruity_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action_comment'] = this.actionComment;
    data['incongruity_after_file_data'] = this.incongruityAfterFileData;
    data['incongruity_id'] = this.incongruityId;
    data['user_name'] = this.userName;
    data['scene_id'] = this.sceneId;
    data['action_date'] = this.actionDate;
    data['incongruity_state'] = this.incongruityState;
    data['incongruity_target'] = this.incongruityTarget;
    data['action_user_id'] = this.actionUserId;
    data['incongruity_before_file_data'] = this.incongruityBeforeFileData;
    data['reg_date'] = this.regDate;
    data['incongruity_name'] = this.incongruityName;
    data['user_id'] = this.userId;
    data['incongruity_text'] = this.incongruityText;
    data['incongruity_checker_user_data'] = this.incongruityCheckerUserData;
    data['incongruity_date'] = this.incongruityDate;
    return data;
  }
}