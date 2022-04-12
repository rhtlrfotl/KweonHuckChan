class SceneModel {
  int? sceneId;
  String? sceneName;

  SceneModel({this.sceneId, this.sceneName});

  SceneModel.fromJson(Map<String, dynamic> json) {
    sceneId = json['scene_id'];
    sceneName = json['scene_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scene_id'] = this.sceneId;
    data['scene_name'] = this.sceneName;
    return data;
  }
}