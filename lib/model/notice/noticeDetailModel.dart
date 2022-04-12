class NoticeDetailModel {
  String? noticeTitle;
  int? hits;
  String? regDate;
  int? userId;
  String? noticeReceiverData;
  String? userName;
  String? companyName;
  int? sceneId;
  String? noticeText;
  int? noticeId;
  String? fileData;
  String? receiverType;

  NoticeDetailModel(
      {this.noticeTitle,
        this.hits,
        this.regDate,
        this.userId,
        this.noticeReceiverData,
        this.userName,
        this.companyName,
        this.sceneId,
        this.noticeText,
        this.noticeId,
        this.fileData,
        this.receiverType});

  NoticeDetailModel.fromJson(Map<String, dynamic> json) {
    noticeTitle = json['notice_title'];
    hits = json['hits'];
    regDate = json['reg_date'];
    userId = json['user_id'];
    noticeReceiverData = json['notice_receiver_data'];
    userName = json['user_name'];
    companyName = json['company_name'];
    sceneId = json['scene_id'];
    noticeText = json['notice_text'];
    noticeId = json['notice_id'];
    fileData = json['file_data'];
    receiverType = json['receiver_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notice_title'] = this.noticeTitle;
    data['hits'] = this.hits;
    data['reg_date'] = this.regDate;
    data['user_id'] = this.userId;
    data['notice_receiver_data'] = this.noticeReceiverData;
    data['user_name'] = this.userName;
    data['company_name'] = this.companyName;
    data['scene_id'] = this.sceneId;
    data['notice_text'] = this.noticeText;
    data['notice_id'] = this.noticeId;
    data['file_data'] = this.fileData;
    data['receiver_type'] = this.receiverType;
    return data;
  }
}