import 'package:beitflutter/model/companyModel.dart';
import 'package:beitflutter/model/constructionModel.dart';
import 'package:beitflutter/model/riskAssessmentModel.dart';
import 'package:get/get.dart';

import '../../model/sceneModel.dart';

class RiskAssessmentViewModel extends GetxController {
  List<Board> board = List<Board>.empty(growable: true);
  List<DropDownList> sceneList = List<DropDownList>.empty(growable: true);
  List<DropDownList> companyList = List<DropDownList>.empty(growable: true);
  List<DropDownList> typeList = List<DropDownList>.empty(growable: true);
  List<DropDownList> statusList = List<DropDownList>.empty(growable: true);
  var sceneDropDown = DropItem.init();
  var companyDropDown = DropItem.init();
  var typeDropDown = DropItem.init();
  var statusDropDown = DropItem.init();

  Future<void> fetchBoard(state, companyId, constructionType, startDate,
      endDate, searchText) async {
    if (companyId == 0) {
      companyId = "전체";
    }
  }
}

class Board {
  var companyName;
  var cntApprovalState;
  var raStartDate;
  var raEndDate;
  var regDate;
  var approvalId;
  var raId;
  var sceneName;
  var author;

  Board(RiskAssessmentModel model) {
    companyName = model.companyName;
    cntApprovalState = model.cntApprovalState;
    raStartDate = model.raStartDate;
    raEndDate = model.raEndDate;
    regDate = model.regDate;
    approvalId = model.approvalId;
    raId = model.raId;
    sceneName = model.sceneName;
    author = model.userName;
  }
}

class DropDownList {
  var id;
  var name;

  DropDownList.scene(SceneModel noticeSceneModel) {
    id = noticeSceneModel.sceneId;
    name = noticeSceneModel.sceneName;
  }

  DropDownList.company(CompanyModel noticeCompanyModel) {
    id = noticeCompanyModel.companyId;
    name = noticeCompanyModel.companyName;
  }
  DropDownList.type(ConstructionModel constructionModel) {
    id = constructionModel.ctgoConstructionId;
    name = constructionModel.ctgoConstructionName;
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
