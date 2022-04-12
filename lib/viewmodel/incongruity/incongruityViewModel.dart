import 'package:beitflutter/model/incongruityModel.dart';
import 'package:get/get.dart';

class IncongruityViewModel extends GetxController {
  List<Board> board = List<Board>.empty(growable: true);

  Future<void> fetchBoard(
      sceneId, incongruityState, startDate, endDate, serachText) async {
    update();
  }
}

class Board {
  var icongruityState;
  var icongruityName;
  var icongruityId;
  var regDate;
  var name;

  Board(IncongruityModel model) {
    icongruityState = model.incongruityState;
    icongruityName = model.incongruityName;
    icongruityId = model.incongruityId;
    regDate = model.regDate;
    name = model.userName;
  }
}
