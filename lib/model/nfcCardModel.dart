class NfcCardModel {
  String? nfcState;
  String? nfcType;
  String? andUqId;
  String? areaMain;
  int? sceneId;
  String? areaSub;
  int? areaId;
  String? iosUqId;
  int? nfcId;

  NfcCardModel(
      {this.nfcState,
        this.nfcType,
        this.andUqId,
        this.areaMain,
        this.sceneId,
        this.areaSub,
        this.areaId,
        this.iosUqId,
        this.nfcId});

  NfcCardModel.fromJson(Map<String, dynamic> json) {
    nfcState = json['nfc_state'];
    nfcType = json['nfc_type'];
    andUqId = json['and_uq_id'];
    areaMain = json['area_main'];
    sceneId = json['scene_id'];
    areaSub = json['area_sub'];
    areaId = json['area_id'];
    iosUqId = json['ios_uq_id'];
    nfcId = json['nfc_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nfc_state'] = this.nfcState;
    data['nfc_type'] = this.nfcType;
    data['and_uq_id'] = this.andUqId;
    data['area_main'] = this.areaMain;
    data['scene_id'] = this.sceneId;
    data['area_sub'] = this.areaSub;
    data['area_id'] = this.areaId;
    data['ios_uq_id'] = this.iosUqId;
    data['nfc_id'] = this.nfcId;
    return data;
  }
}