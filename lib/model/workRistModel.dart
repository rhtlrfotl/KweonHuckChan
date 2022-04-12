class WorkRiskModel {
  String? raStartDate;
  int? ctgoConstructionId;
  String? raEndDate;
  String? writerDutyName;
  String? writerCompanyName;
  String? checkerData;
  String? ctgoOccupationName;
  String? ctgoConstructionName;
  int? sceneId;
  String? riskAssessment;
  String? commentData;
  String? regDate;
  String? currentApprovalState;
  int? ctgoOccupationId;
  String? evaluationDetail;
  int? writerId;
  String? sceneName;
  String? writerName;
  int? raId;
  String? lineData;

  WorkRiskModel(
      {this.raStartDate,
        this.ctgoConstructionId,
        this.raEndDate,
        this.writerDutyName,
        this.writerCompanyName,
        this.checkerData,
        this.ctgoOccupationName,
        this.ctgoConstructionName,
        this.sceneId,
        this.riskAssessment,
        this.commentData,
        this.regDate,
        this.currentApprovalState,
        this.ctgoOccupationId,
        this.evaluationDetail,
        this.writerId,
        this.sceneName,
        this.writerName,
        this.raId,
        this.lineData});

  WorkRiskModel.fromJson(Map<String, dynamic> json) {
    raStartDate = json['ra_start_date'];
    ctgoConstructionId = json['ctgo_construction_id'];
    raEndDate = json['ra_end_date'];
    writerDutyName = json['writer_duty_name'];
    writerCompanyName = json['writer_company_name'];
    checkerData = json['checker_data'];
    ctgoOccupationName = json['ctgo_occupation_name'];
    ctgoConstructionName = json['ctgo_construction_name'];
    sceneId = json['scene_id'];
    riskAssessment = json['risk_assessment'];
    commentData = json['comment_data'];
    regDate = json['reg_date'];
    currentApprovalState = json['current_approval_state'];
    ctgoOccupationId = json['ctgo_occupation_id'];
    evaluationDetail = json['evaluation_detail'];
    writerId = json['writer_id'];
    sceneName = json['scene_name'];
    writerName = json['writer_name'];
    raId = json['ra_id'];
    lineData = json['line_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ra_start_date'] = this.raStartDate;
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['ra_end_date'] = this.raEndDate;
    data['writer_duty_name'] = this.writerDutyName;
    data['writer_company_name'] = this.writerCompanyName;
    data['checker_data'] = this.checkerData;
    data['ctgo_occupation_name'] = this.ctgoOccupationName;
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['scene_id'] = this.sceneId;
    data['risk_assessment'] = this.riskAssessment;
    data['comment_data'] = this.commentData;
    data['reg_date'] = this.regDate;
    data['current_approval_state'] = this.currentApprovalState;
    data['ctgo_occupation_id'] = this.ctgoOccupationId;
    data['evaluation_detail'] = this.evaluationDetail;
    data['writer_id'] = this.writerId;
    data['scene_name'] = this.sceneName;
    data['writer_name'] = this.writerName;
    data['ra_id'] = this.raId;
    data['line_data'] = this.lineData;
    return data;
  }
}