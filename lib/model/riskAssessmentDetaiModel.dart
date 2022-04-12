class RiskAssessmentDetailModel {
  String? raStartDate;
  int? ctgoConstructionId;
  String? raEndDate;
  int? myTurn;
  String? writerCompanyName;
  String? checkerData;
  String? riskAssessment;
  int? deleteCheck;
  String? currentApprovalState;
  String? evaluationDetail;
  int? writerId;
  String? sceneName;
  int? raId;
  String? writerDutyName;
  int? companyId;
  String? ctgoOccupationName;
  int? sceneId;
  String? ctgoConstructionName;
  String? rejectReason;
  String? commentData;
  String? regDate;
  int? ctgoOccupationId;
  int? returnState;
  String? writerName;
  String? lineData;

  RiskAssessmentDetailModel(
      {this.raStartDate,
        this.ctgoConstructionId,
        this.raEndDate,
        this.myTurn,
        this.writerCompanyName,
        this.checkerData,
        this.riskAssessment,
        this.deleteCheck,
        this.currentApprovalState,
        this.evaluationDetail,
        this.writerId,
        this.sceneName,
        this.raId,
        this.writerDutyName,
        this.companyId,
        this.ctgoOccupationName,
        this.sceneId,
        this.ctgoConstructionName,
        this.rejectReason,
        this.commentData,
        this.regDate,
        this.ctgoOccupationId,
        this.returnState,
        this.writerName,
        this.lineData});

  RiskAssessmentDetailModel.fromJson(Map<String, dynamic> json) {
    raStartDate = json['ra_start_date'];
    ctgoConstructionId = json['ctgo_construction_id'];
    raEndDate = json['ra_end_date'];
    myTurn = json['my_turn'];
    writerCompanyName = json['writer_company_name'];
    checkerData = json['checker_data'];
    riskAssessment = json['risk_assessment'];
    deleteCheck = json['deleteCheck'];
    currentApprovalState = json['current_approval_state'];
    evaluationDetail = json['evaluation_detail'];
    writerId = json['writer_id'];
    sceneName = json['scene_name'];
    raId = json['ra_id'];
    writerDutyName = json['writer_duty_name'];
    companyId = json['company_id'];
    ctgoOccupationName = json['ctgo_occupation_name'];
    sceneId = json['scene_id'];
    ctgoConstructionName = json['ctgo_construction_name'];
    rejectReason = json['reject_reason'];
    commentData = json['comment_data'];
    regDate = json['reg_date'];
    ctgoOccupationId = json['ctgo_occupation_id'];
    returnState = json['return_state'];
    writerName = json['writer_name'];
    lineData = json['line_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ra_start_date'] = this.raStartDate;
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['ra_end_date'] = this.raEndDate;
    data['my_turn'] = this.myTurn;
    data['writer_company_name'] = this.writerCompanyName;
    data['checker_data'] = this.checkerData;
    data['risk_assessment'] = this.riskAssessment;
    data['deleteCheck'] = this.deleteCheck;
    data['current_approval_state'] = this.currentApprovalState;
    data['evaluation_detail'] = this.evaluationDetail;
    data['writer_id'] = this.writerId;
    data['scene_name'] = this.sceneName;
    data['ra_id'] = this.raId;
    data['writer_duty_name'] = this.writerDutyName;
    data['company_id'] = this.companyId;
    data['ctgo_occupation_name'] = this.ctgoOccupationName;
    data['scene_id'] = this.sceneId;
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['reject_reason'] = this.rejectReason;
    data['comment_data'] = this.commentData;
    data['reg_date'] = this.regDate;
    data['ctgo_occupation_id'] = this.ctgoOccupationId;
    data['return_state'] = this.returnState;
    data['writer_name'] = this.writerName;
    data['line_data'] = this.lineData;
    return data;
  }
}