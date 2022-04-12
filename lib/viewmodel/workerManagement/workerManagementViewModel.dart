import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../model/workerManagementModel.dart';

class WorkerManagementViewModel extends GetxController {
  List<Board> board = List<Board>.empty(growable: true);
  List<bool> fileExist = List<bool>.empty(growable: true);

  Future<void> fetchBoard(sceneId, companyIds, constructionId, nationId,
      occupationId, badPush, serachText) async {}
}

class Board {
  var name;
  var companyName;
  var constructionType;
  var file;
  var fileExist;
  var userId;

  Board(WorkerManagementModel model, bool fileExistBool) {
    name = model.userName;
    companyName = model.companyName;
    constructionType = model.ctgoConstructionName;
    file = model.userProfileFile;
    userId = model.userId;
    fileExist = fileExistBool;
  }
}
