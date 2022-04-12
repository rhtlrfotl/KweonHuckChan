class NationModel {
  String? regDate;
  int? deleteState;
  int? ctgoNationId;
  int? userId;
  String? updateDate;
  String? ctgoNationName;

  NationModel(
      {this.regDate,
        this.deleteState,
        this.ctgoNationId,
        this.userId,
        this.updateDate,
        this.ctgoNationName});

  NationModel.fromJson(Map<String, dynamic> json) {
    regDate = json['reg_date'];
    deleteState = json['delete_state'];
    ctgoNationId = json['ctgo_nation_id'];
    userId = json['user_id'];
    updateDate = json['update_date'];
    ctgoNationName = json['ctgo_nation_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reg_date'] = this.regDate;
    data['delete_state'] = this.deleteState;
    data['ctgo_nation_id'] = this.ctgoNationId;
    data['user_id'] = this.userId;
    data['update_date'] = this.updateDate;
    data['ctgo_nation_name'] = this.ctgoNationName;
    return data;
  }
}