import 'dart:convert';
import 'package:beitflutter/model/notice/incongruityDetailModel.dart';
import 'package:get/get.dart';

class IncongruityDetailViewModel extends GetxController {
  Detail? detail;

  Future<void> fetchIncongruityDetail(incongruityId) async {
    update();
  }
}

class Detail {
  var author;
  var title;
  var target;
  var content;
  String manager = "";
  var afterfileData;
  var beforefileData;

  Detail(IncongruityDetailModel model) {
    author = model.userName;
    title = model.incongruityName;
    target = model.incongruityTarget;
    content = model.incongruityText;
    var managerList =
        jsonDecode(model.incongruityCheckerUserData!)["checker_user_data"];
    for (var element in managerList) {
      print("name : ${element["user_name"]}");
      manager += element["user_name"] + ", ";
    }
    if (model.incongruityAfterFileData != null) {
      afterfileData = jsonDecode(model.incongruityAfterFileData!);
    }
    if (model.incongruityBeforeFileData != null) {
      beforefileData = jsonDecode(model.incongruityBeforeFileData!);
    }
  }
}
