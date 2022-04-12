import 'package:beitflutter/model/companyModel.dart';
import 'package:beitflutter/model/notice/noticeModel.dart';
import 'package:get/get.dart';

import '../../model/sceneModel.dart';

class NoticeViewModel extends GetxController {
  List<NoticeBoardViewModel> noticeViewModel =
      List<NoticeBoardViewModel>.empty(growable: true);
  List<NoticeSceneViewModel> sceneList =
      List<NoticeSceneViewModel>.empty(growable: true);
  List<NoticeCompanyViewModel> companyList =
      List<NoticeCompanyViewModel>.empty(growable: true);
  var sceneDropDown = DropItem.init();
  var companyDropDown = DropItem.init();

  Future<void> fetchNotice(sceneId, companyIds, searchText) async {
    update();
  }
}

class NoticeBoardViewModel {
  var no;
  var company;
  var desc;
  var title;
  var writeAt;
  var hit;
  var noticeId;

  NoticeBoardViewModel(key, NoticeModel model) {
    no = key;
    title = model.noticeTitle;
    company = model.companyName;
    writeAt = model.regDate;
    hit = model.hits;
    noticeId = model.noticeId;
    desc = model.noticeText;
  }
}

class NoticeSceneViewModel {
  var sceneId;
  var sceneName;

  NoticeSceneViewModel(SceneModel noticeSceneModel) {
    sceneId = noticeSceneModel.sceneId;
    sceneName = noticeSceneModel.sceneName;
  }

  @override
  bool operator ==(Object other) {
    return other is NoticeSceneViewModel &&
        this.sceneId == other.sceneId &&
        this.sceneName == other.sceneName;
  }

  @override
  int get hashCode {
    return super.hashCode;
  }
}

class NoticeCompanyViewModel {
  var companyId;
  var companyName;

  NoticeCompanyViewModel(CompanyModel noticeCompanyModel) {
    companyId = noticeCompanyModel.companyId;
    companyName = noticeCompanyModel.companyName;
  }
}

class DropItem {
  var selectedValue;
  var selectedId;
  var valueList = [];

  DropItem.init() {}

  DropItem(value, list) {
    selectedValue = value;
    valueList = list;
  }

  @override
  bool operator ==(Object other) {
    return other is DropItem && this.selectedValue == other.selectedValue;
  }

  @override
  int get hashCode {
    return selectedValue.hashCode;
  }
}
