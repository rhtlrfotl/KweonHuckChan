class WorkPermissionDetailModel {
  int? ctgoConstructionId;
  String? areaName;
  int? dpRaIds;
  int? myTurn;
  String? userName;
  String? workerInfo;
  String? checker;
  String? fileData;
  int? deleteCheck;
  String? currentApprovalState;
  String? dpEtc;
  int? dpId;
  String? todayWorkerList;
  String? dpStartTime;
  String? todayWork;
  String? dpTime;
  String? sceneName;
  int? sceneId;
  int? dpWorkerNo;
  String? rejectReason;
  String? constructionName;
  int? writerUserId;
  String? commentData;
  String? riskAssementData;
  String? regDate;
  String? dpEndTime;
  String? equip;
  String? dpDate;
  String? companyName;
  int? ctgoAreaId;
  String? approvalLine;
  int? returnState;

  WorkPermissionDetailModel(
      {this.ctgoConstructionId,
        this.areaName,
        this.dpRaIds,
        this.myTurn,
        this.userName,
        this.workerInfo,
        this.checker,
        this.fileData,
        this.deleteCheck,
        this.currentApprovalState,
        this.dpEtc,
        this.dpId,
        this.todayWorkerList,
        this.dpStartTime,
        this.todayWork,
        this.dpTime,
        this.sceneName,
        this.sceneId,
        this.dpWorkerNo,
        this.rejectReason,
        this.constructionName,
        this.writerUserId,
        this.commentData,
        this.riskAssementData,
        this.regDate,
        this.dpEndTime,
        this.equip,
        this.dpDate,
        this.companyName,
        this.ctgoAreaId,
        this.approvalLine,
        this.returnState});

  WorkPermissionDetailModel.fromJson(Map<String, dynamic> json) {
    ctgoConstructionId = json['ctgo_construction_id'];
    areaName = json['area_name'];
    dpRaIds = json['dp_ra_ids'];
    myTurn = json['my_turn'];
    userName = json['user_name'];
    workerInfo = json['worker_info'];
    checker = json['checker'];
    fileData = json['file_data'];
    deleteCheck = json['deleteCheck'];
    currentApprovalState = json['current_approval_state'];
    dpEtc = json['dp_etc'];
    dpId = json['dp_id'];
    todayWorkerList = json['today_worker_list'];
    dpStartTime = json['dp_start_time'];
    todayWork = json['today_work'];
    dpTime = json['dp_time'];
    sceneName = json['scene_name'];
    sceneId = json['scene_id'];
    dpWorkerNo = json['dp_worker_no'];
    rejectReason = json['reject_reason'];
    constructionName = json['construction_name'];
    writerUserId = json['writer_user_id'];
    commentData = json['comment_data'];
    riskAssementData = json['risk_assement_data'];
    regDate = json['reg_date'];
    dpEndTime = json['dp_end_time'];
    equip = json['equip'];
    dpDate = json['dp_date'];
    companyName = json['company_name'];
    ctgoAreaId = json['ctgo_area_id'];
    approvalLine = json['approval_line'];
    returnState = json['return_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ctgo_construction_id'] = this.ctgoConstructionId;
    data['area_name'] = this.areaName;
    data['dp_ra_ids'] = this.dpRaIds;
    data['my_turn'] = this.myTurn;
    data['user_name'] = this.userName;
    data['worker_info'] = this.workerInfo;
    data['checker'] = this.checker;
    data['file_data'] = this.fileData;
    data['deleteCheck'] = this.deleteCheck;
    data['current_approval_state'] = this.currentApprovalState;
    data['dp_etc'] = this.dpEtc;
    data['dp_id'] = this.dpId;
    data['today_worker_list'] = this.todayWorkerList;
    data['dp_start_time'] = this.dpStartTime;
    data['today_work'] = this.todayWork;
    data['dp_time'] = this.dpTime;
    data['scene_name'] = this.sceneName;
    data['scene_id'] = this.sceneId;
    data['dp_worker_no'] = this.dpWorkerNo;
    data['reject_reason'] = this.rejectReason;
    data['construction_name'] = this.constructionName;
    data['writer_user_id'] = this.writerUserId;
    data['comment_data'] = this.commentData;
    data['risk_assement_data'] = this.riskAssementData;
    data['reg_date'] = this.regDate;
    data['dp_end_time'] = this.dpEndTime;
    data['equip'] = this.equip;
    data['dp_date'] = this.dpDate;
    data['company_name'] = this.companyName;
    data['ctgo_area_id'] = this.ctgoAreaId;
    data['approval_line'] = this.approvalLine;
    data['return_state'] = this.returnState;
    return data;
  }
}