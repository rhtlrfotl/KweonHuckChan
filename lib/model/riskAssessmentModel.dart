class RiskAssessmentModel {
  int? ctgoConstructionId;
  String? raStartDate;
  String? raEndDate;
  int? companyId;
  String? userName;
  String? ctgoConstructionName;
  int? sceneId;
  int? approvalId;
  String? regDate;
  int? userId;
  String? companyName;
  String? evaluationDetail;
  String? cntApprovalState;
  String? sceneName;
  int? raId;

  RiskAssessmentModel(
      {this.ctgoConstructionId,
        this.raStartDate,
        this.raEndDate,
        this.companyId,
        this.userName,
        this.ctgoConstructionName,
        this.sceneId,
        this.approvalId,
        this.regDate,
        this.userId,
        this.companyName,
        this.evaluationDetail,
        this.cntApprovalState,
        this.sceneName,
        this.raId});

  RiskAssessmentModel.fromJson(Map<String, dynamic> json) {
    ctgoConstructionId = json['ctgo_construction_id'];
    raStartDate = json['ra_start_date'];
    raEndDate = json['ra_end_date'];
    companyId = json['company_id'];
    userName = json['user_name'];
    ctgoConstructionName = json['ctgo_construction_name'];
    sceneId = json['scene_id'];
    approvalId = json['approval_id'];
    regDate = json['reg_date'];
    userId = json['user_id'];
    companyName = json['company_name'];
    evaluationDetail = json['evaluation_detail'];
    cntApprovalState = json['cnt_approval_state'];
    sceneName = json['scene_name'];
    raId = json['ra_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['ra_start_date'] = this.raStartDate;
    data['ra_end_date'] = this.raEndDate;
    data['company_id'] = this.companyId;
    data['user_name'] = this.userName;
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['scene_id'] = this.sceneId;
    data['approval_id'] = this.approvalId;
    data['reg_date'] = this.regDate;
    data['user_id'] = this.userId;
    data['company_name'] = this.companyName;
    data['evaluation_detail'] = this.evaluationDetail;
    data['cnt_approval_state'] = this.cntApprovalState;
    data['scene_name'] = this.sceneName;
    data['ra_id'] = this.raId;
    return data;
  }
}