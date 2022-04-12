import 'package:beitflutter/config/webconfig.dart';
import 'package:beitflutter/screens/worker/notice/noticeCheck.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/styles/text_styles.dart';

import 'package:dio/dio.dart' as Dio;

import '../../config/userinfo.dart';

class RequsetWorkPermit extends StatefulWidget {
  const RequsetWorkPermit({Key? key}) : super(key: key);

  @override
  _RequsetWorkPermitState createState() => _RequsetWorkPermitState();
}

class _RequsetWorkPermitState extends State<RequsetWorkPermit> {
  var sceneDropDown = PopUpItem.init();
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello Friends...';
  }

  @override
  void initState() {
    // TODO: implement initStatex
    super.initState();
  }

  getNoticeList() async {
    print("GET NoticeList_WORK");
    var dio = Dio.Dio();
    // await Future.delayed(Duration(milliseconds: 1000), () {});
    try {
      var response = await dio.post(
          "http://api.kunyoungcms.co.kr/ui/Notice/Get_NoticeList_Work",
          data: Dio.FormData.fromMap({
            'platform_type': WebConfig.platformType,
            'platform_key': WebConfig.platformKey,
            'user_id': UserInfo.userId,
            'user_session': UserInfo.userSession,
            'scene_id': UserInfo.sceneId,
            'scene_ids': '["${UserInfo.sceneId}"]',
          }),
          options:
              Dio.Options(contentType: Dio.Headers.formUrlEncodedContentType));
      return response.data;
    } on Dio.DioError catch (e) {
      print(e);
    }
  }

  getListToday() async {
    print("GET LISTTODAY");
    var dio = Dio.Dio();
    try {
      var response = await dio.post(
          WebConfig.host + "/DailyPlan/Get_DailyPlan_ListToday",
          data: Dio.FormData.fromMap({
            'platform_type': WebConfig.platformType,
            'platform_key': WebConfig.platformKey,
            'user_id': UserInfo.userId,
            'user_session': UserInfo.userSession,
            'scene_id': UserInfo.sceneId,
            'scene_ids': '["${UserInfo.sceneId}"]'
          }),
          options:
              Dio.Options(contentType: Dio.Headers.formUrlEncodedContentType));
      return response.data;
    } on Dio.DioError catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('작업허가요청'),
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  '작업허가 요청을 해주세요.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  '아래 목록을 모두 확인 후, 어플리케이션의 이용이 가능합니다',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Text(
                  '압력 목록',
                  style: TextStyle(fontSize: 12, color: Colors.blue[900]),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        // Get.dialog(
                        //   Dialog(
                        //     child: Container(
                        //       padding: EdgeInsets.all(20),
                        //       height: 200,
                        //       child: Column(
                        //         children: [
                        //           Container(
                        //             height: 100,
                        //             child: Center(
                        //               child: Text(
                        //                   '금일 작업허가서를 찾을 수 없습니다. 다른 확인목록을 확인해주세요.'),
                        //             ),
                        //           ),
                        //           Container(
                        //             height: 20,
                        //             child: TextButton(
                        //               child: Text('확인'),
                        //               onPressed: () {
                        //                 Navigator.of(context).pop();
                        //               },
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black26)),
                    ),
                    child: TextButton(
                      child: Text(
                        '작업허가서 확인',
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () async {
                        var data = await getListToday();
                        print(data['rsMap'].length);

                        int number = data['rsMap'].length;

                        if (number <= 0) {
                          Get.dialog(
                            Dialog(
                              child: Container(
                                height: 100,
                                child: Center(
                                  child: Text('금일 작업이 없습니다'),
                                ),
                              ),
                            ),
                          );
                        } else if (number >= 0) {
                          Get.dialog(
                            Dialog(
                              child: Container(
                                height: 100,
                                child: Center(
                                  child: Text('금일 작업이 있는걸까 없는걸까'),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.black,
                          padding: const EdgeInsets.only(bottom: 20)),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black26)),
                    ),
                    child: TextButton(
                      child: Text(
                        '위험성평가 확인',
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () async {},
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {},
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.black26)),
                    ),
                    child: TextButton(
                      child: Text(
                        '공지사항 확인',
                        textAlign: TextAlign.left,
                      ),
                      onPressed: () async {
                        Get.to(NoticeCheck());
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 300,
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blue[300]),
                  child: Text('완료'),
                  onPressed: () {
                    Get.snackbar(
                      '내용:',
                      '이미 작업허가를 받았습니다.',
                      snackPosition: SnackPosition.BOTTOM,
                      duration: Duration(seconds: 2),
                    );
                  },
                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black38,
                  ),
                  child: Text('작업허가 요청 완료'),
                  onPressed: () {},
                ),
              ),
            ],
          )),
    );
  }
}

class PopUpItem {
  var _selectedValue;
  var _selectedId;
  List<dynamic> _valueList = [];

  get selectedId => _selectedId;

  set selectedId(value) {
    _selectedId = value;
  }

  get selectedValue => _selectedValue;
  set selectedValue(value) {
    _selectedValue = value;
  }

  List<dynamic> get valueList => _valueList;
  set valueList(List<dynamic> value) {
    _valueList = value;
  }

  PopUpItem.init() {}

  PopUpItem(value, list) {
    _selectedValue = value;
    _valueList = list;
  }
}
