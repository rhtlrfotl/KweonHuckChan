import 'package:beitflutter/config/userinfo.dart';
import 'package:beitflutter/config/webconfig.dart';
import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoticeCheck extends StatefulWidget {
  const NoticeCheck({Key? key}) : super(key: key);

  @override
  _NoticeCheckState createState() => _NoticeCheckState();
}

class _NoticeCheckState extends State<NoticeCheck> {
  // var sceneDropDown = DropItem.init();
  // var noticeBoard = Get.put(NoticeBoard());
  // double tableHeight = Get.height / 10;
  // List<TableRow> tableRows = [];

  var noticeCheckContorller = Get.put(NoticeCheckContorller());
  int ct = 0;
  // int Pagenumber = page.length;

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello Friends...';
  }

  void _incrementCounter() {
    setState(() {
      ct++;
    });
  }

  @override
  void initState() {
    // TODO: implement initStatex
    super.initState();
    getNoticeCheck();
  }

  getNoticeCheck() async {
    print("GET NoticeCheck");
    var result = await Repository.getNoticeCheck();
    result['rsMap'].forEach((element) {
      var noticeCheckObject = NoticeCheckObject();
      noticeCheckObject.title = element['notice_title'];
      noticeCheckObject.author = element['user_name'];
      noticeCheckObject.content = element['notice_text'];
      noticeCheckObject.regData = element['reg_date'];
      noticeCheckContorller.noticeCheckList.add(noticeCheckObject);
      // noticeCheckContorller.addCount();
      noticeCheckContorller.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("공지사항 확인"),
          backgroundColor: AppColors.green,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show',
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: GetBuilder<NoticeCheckContorller>(
            builder: (_) {
              return noticeCheckContorller.noticeCheckList.length == 0
                  ? Text("loading")
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  width: 120,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (ct <= 0) {
                                          ct = 0;
                                        } else {
                                          ct -= 1;
                                        }
                                      });
                                    },
                                    child: null,
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${ct + 1} / ${noticeCheckContorller.noticeCheckList.length}',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                  width: 120,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        if (ct >=
                                            noticeCheckContorller
                                                    .noticeCheckList.length -
                                                1) {
                                          ct = noticeCheckContorller
                                                  .noticeCheckList.length -
                                              1;
                                        } else {
                                          ct += 1;
                                        }
                                      });
                                    },
                                    child: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            // height: 300,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade800)),
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text('제목'),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        width: 248,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text(noticeCheckContorller
                                            .noticeCheckList[ct].title),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text('작성자'),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        width: 248,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text(noticeCheckContorller
                                            .noticeCheckList[ct].author),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text('작성일'),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        width: 248,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text(noticeCheckContorller
                                            .noticeCheckList[ct].regData),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: 308,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text('내용'),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 0, 30),
                                        width: 308,
                                        height: 178,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: Text(noticeCheckContorller
                                            .noticeCheckList[ct].content),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 10, 0, 10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                left: BorderSide(
                                                    color: Colors.black38,
                                                    width: 2.0))),
                                        child: Text('첨부파일'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  color: Colors.blueGrey.shade100,
                                  margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Text('No'),
                                      ),
                                      Container(
                                        child: Text('파일이름'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ));
  }
}

class NoticeCheckContorller extends GetxController {
  List<NoticeCheckObject> noticeCheckList =
      List<NoticeCheckObject>.empty(growable: true);
}

class NoticeCheckObject {
  var title;
  var author;
  var regData;
  var content;
  // var _files;

}
