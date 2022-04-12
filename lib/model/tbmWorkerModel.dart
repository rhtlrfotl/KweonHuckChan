class TBMWorkerModel {
  String? ctgoConstructionName;
  int? state;
  int? userId;
  String? userName;
  String? ctgoOccupationName;
  String? companyName;

  TBMWorkerModel(
      {this.ctgoConstructionName,
        this.state,
        this.userId,
        this.userName,
        this.ctgoOccupationName,
        this.companyName});

  TBMWorkerModel.fromJson(Map<String, dynamic> json) {
    ctgoConstructionName = json['ctgo_construction_name'];
    state = json['state'];
    userId = json['user_id'];
    userName = json['user_name'];
    ctgoOccupationName = json['ctgo_occupation_name'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ctgo_construction_name'] = this.ctgoConstructionName;
    data['state'] = this.state;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['ctgo_occupation_name'] = this.ctgoOccupationName;
    data['company_name'] = this.companyName;
    return data;
  }
}