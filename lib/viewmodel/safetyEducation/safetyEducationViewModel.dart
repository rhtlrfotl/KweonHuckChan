import 'package:beitflutter/model/educationModel.dart';
import 'package:get/get.dart';

class SafetyEducationViewModel extends GetxController {
  List<Board> board = List<Board>.empty(growable: true);

  Future<void> fetchEducationListAPI(
      sceneId, startDate, endDate, serachText) async {
    update();
  }
}

class Board {
  var className;
  var name;
  var regDate;
  var educatorName;
  var educatorArea;
  var educationId;
  var educationTitle;
  var educationDate;

  Board(SafetyEducationModel model) {
    className = model.educationClassName;
    name = model.userName;
    regDate = model.regDate;
    educatorName = model.educatorName;
    educatorArea = model.educatorArea;
    educationId = model.educationId;
    educationTitle = model.educationTitle;
    educationDate = model.educationDate;
  }
}
