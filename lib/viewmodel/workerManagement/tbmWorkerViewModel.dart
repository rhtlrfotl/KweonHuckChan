import 'package:beitflutter/model/tbmWorkerModel.dart';
import 'package:get/get.dart';

class TBMWorkerViewModel extends GetxController {
  List<Board> board = List<Board>.empty(growable: true);

  Future<void> fetchBoard(
      companyIds, constructionId, occupationId, searchText) async {
    update();
  }
}

class Board {
  var userName;
  var title;
  var isTBM;

  Board(TBMWorkerModel model) {
    userName = model.userName;
    title =
        "${model.companyName}\n${model.ctgoConstructionName}\n${model.ctgoOccupationName}";
    if (model.state == 1) {
      isTBM = "Y";
    } else {
      isTBM = "N";
    }
  }
}
