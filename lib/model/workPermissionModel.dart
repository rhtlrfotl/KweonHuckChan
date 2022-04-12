class WorkPermissionModel {
  String? noWorker;
  int? companyId;
  int? sceneId;
  int? writerUserId;
  String? fileData;
  int? approvalId;
  String? userChecker;
  String? currentApprovalState;
  String? writerUserName;
  String? dpDate;
  String? companyName;
  int? dpId;
  String? sceneName;
  String? dpTime;

  WorkPermissionModel(
      {this.noWorker,
        this.companyId,
        this.sceneId,
        this.writerUserId,
        this.fileData,
        this.approvalId,
        this.userChecker,
        this.currentApprovalState,
        this.writerUserName,
        this.dpDate,
        this.companyName,
        this.dpId,
        this.sceneName,
        this.dpTime});

  WorkPermissionModel.fromJson(Map<String, dynamic> json) {
    noWorker = json['no_worker'];
    companyId = json['company_id'];
    sceneId = json['scene_id'];
    writerUserId = json['writer_user_id'];
    fileData = json['file_data'];
    approvalId = json['approval_id'];
    userChecker = json['user_checker'];
    currentApprovalState = json['current_approval_state'];
    writerUserName = json['writer_user_name'];
    dpDate = json['dp_date'];
    companyName = json['company_name'];
    dpId = json['dp_id'];
    sceneName = json['scene_name'];
    dpTime = json['dp_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_worker'] = this.noWorker;
    data['company_id'] = this.companyId;
    data['scene_id'] = this.sceneId;
    data['writer_user_id'] = this.writerUserId;
    data['file_data'] = this.fileData;
    data['approval_id'] = this.approvalId;
    data['user_checker'] = this.userChecker;
    data['current_approval_state'] = this.currentApprovalState;
    data['writer_user_name'] = this.writerUserName;
    data['dp_date'] = this.dpDate;
    data['company_name'] = this.companyName;
    data['dp_id'] = this.dpId;
    data['scene_name'] = this.sceneName;
    data['dp_time'] = this.dpTime;
    return data;
  }
}