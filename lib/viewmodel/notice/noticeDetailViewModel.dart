import 'dart:convert';
import 'package:beitflutter/model/notice/noticeDetailModel.dart';
import 'package:get/get.dart';

//Future Builderfh
class NoticeDetailViewModel {
  Detail? noticeDetail;
}

class Detail {
  String? title;
  String? desc;
  String? author;
  String? companyName;
  int? hits;
  var fileData;

  Detail(NoticeDetailModel noticeDetailModel) {
    title = noticeDetailModel.noticeTitle;
    desc = noticeDetailModel.noticeText;
    author = noticeDetailModel.userName;
    companyName = noticeDetailModel.companyName;
    hits = noticeDetailModel.hits;
    if (noticeDetailModel.fileData != null) {
      print("there is a file data");
      fileData = jsonDecode(noticeDetailModel.fileData!);
    } else {
      fileData = null;
    }
  }
}
