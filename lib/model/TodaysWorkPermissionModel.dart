class TodaysWorkPermissionModel {
  String? areaName;
  int? dpRaIds;
  String? userName;
  String? workerInfo;
  int? sceneId;
  int? dpWorkerNo;
  String? checker;
  String? constructionName;
  int? writerUserId;
  String? fileData;
  String? commentData;
  String? riskAssementData;
  String? dpEndTime;
  String? equip;
  String? dpDate;
  String? companyName;
  String? dpEtc;
  int? dpId;
  String? todayWorkerList;
  String? approvalLine;
  String? dpStartTime;
  String? todayWork;
  String? sceneName;
  String? dpTime;

  TodaysWorkPermissionModel(
      {this.areaName,
        this.dpRaIds,
        this.userName,
        this.workerInfo,
        this.sceneId,
        this.dpWorkerNo,
        this.checker,
        this.constructionName,
        this.writerUserId,
        this.fileData,
        this.commentData,
        this.riskAssementData,
        this.dpEndTime,
        this.equip,
        this.dpDate,
        this.companyName,
        this.dpEtc,
        this.dpId,
        this.todayWorkerList,
        this.approvalLine,
        this.dpStartTime,
        this.todayWork,
        this.sceneName,
        this.dpTime});

  TodaysWorkPermissionModel.fromJson(Map<String, dynamic> json) {
    areaName = json['area_name'];
    dpRaIds = json['dp_ra_ids'];
    userName = json['user_name'];
    workerInfo = json['worker_info'];
    sceneId = json['scene_id'];
    dpWorkerNo = json['dp_worker_no'];
    checker = json['checker'];
    constructionName = json['construction_name'];
    writerUserId = json['writer_user_id'];
    fileData = json['file_data'];
    commentData = json['comment_data'];
    riskAssementData = json['risk_assement_data'];
    dpEndTime = json['dp_end_time'];
    equip = json['equip'];
    dpDate = json['dp_date'];
    companyName = json['company_name'];
    dpEtc = json['dp_etc'];
    dpId = json['dp_id'];
    todayWorkerList = json['today_worker_list'];
    approvalLine = json['approval_line'];
    dpStartTime = json['dp_start_time'];
    todayWork = json['today_work'];
    sceneName = json['scene_name'];
    dpTime = json['dp_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['area_name'] = this.areaName;
    data['dp_ra_ids'] = this.dpRaIds;
    data['user_name'] = this.userName;
    data['worker_info'] = this.workerInfo;
    data['scene_id'] = this.sceneId;
    data['dp_worker_no'] = this.dpWorkerNo;
    data['checker'] = this.checker;
    data['construction_name'] = this.constructionName;
    data['writer_user_id'] = this.writerUserId;
    data['file_data'] = this.fileData;
    data['comment_data'] = this.commentData;
    data['risk_assement_data'] = this.riskAssementData;
    data['dp_end_time'] = this.dpEndTime;
    data['equip'] = this.equip;
    data['dp_date'] = this.dpDate;
    data['company_name'] = this.companyName;
    data['dp_etc'] = this.dpEtc;
    data['dp_id'] = this.dpId;
    data['today_worker_list'] = this.todayWorkerList;
    data['approval_line'] = this.approvalLine;
    data['dp_start_time'] = this.dpStartTime;
    data['today_work'] = this.todayWork;
    data['scene_name'] = this.sceneName;
    data['dp_time'] = this.dpTime;
    return data;
  }
}