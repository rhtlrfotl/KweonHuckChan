import 'dart:convert';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/widgets/custom_table_risk.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../config/userinfo.dart';
import '../../../../config/webconfig.dart';
import '../../../../styles/app_colors.dart';

class WorkPermissionCheck extends StatefulWidget {
  const WorkPermissionCheck({Key? key}) : super(key: key);

  @override
  State<WorkPermissionCheck> createState() => _WorkPermissionCheckState();
}

class _WorkPermissionCheckState extends State<WorkPermissionCheck> {
  var workCheckController = Get.put(WorkCheckController());
  var count = 0;
  int assessmentCount = 0;
  @override
  void initState() {
    super.initState();
    getDailyPlanData(366, 575);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("작업허가서 확인"),
          backgroundColor: AppColors.green,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Shows',
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (count > 0) {
                            setState(() {
                              count -= 1;
                              assessmentCount = 0;
                            });
                          }
                        },
                        child: Text("이전페이지"),
                        style: beitButtonStyle.green,
                      ),
                      Container(),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("다음페이지"),
                        style: beitButtonStyle.green,
                      )
                    ],
                  ), //좌우 버튼
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          // POINT
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('작업허가서'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                    height: 200,
                    child: Column(
                      children: [
                        Container(
                          child: Row(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                              child: Text('현장'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              child: Text('0000'),
                            ),
                          ]),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Row(children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  child: Text('작업책임자'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: Text('0000'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  child: Text('작업기간'),
                                ),
                                Container(
                                  child: Text('00000'),
                                ),
                              ]),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Row(children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  child: Text('작업업체명'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: Text('0000'),
                                ),
                              ]),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              child: Row(children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  child: Text('작업시간'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: Text('0000'),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          // POINT
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('작업내용'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 1),
                    ),
                    height: 80,
                    child: Column(
                      children: [
                        Container(
                          child: Row(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black,
                                    style: BorderStyle.solid,
                                    width: 1),
                              ),
                              child: Text('공종'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 30,
                              child: Text('0000'),
                            ),
                          ]),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Row(children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  child: Text('작업위치'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: Text('0000'),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1),
                                  ),
                                  child: Text('작업인원'),
                                ),
                                Container(
                                  child: Text('00000'),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 28,
                        color: Colors.blueGrey.shade100,
                        margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text('No'),
                            ),
                            Container(
                              child: Text('중장비'),
                            ),
                            Container(
                              child: Text('수량'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                ),
                                child: Text('1'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('0000000'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('000'),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          // POINT
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('금일작업 사항'),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 28,
                        color: Colors.blueGrey.shade100,
                        margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text('No'),
                            ),
                            Container(
                              child: Text('내용'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                ),
                                child: Text('1'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('0000/000/000'),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          // POINT
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('근로자별 작업현황'),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 28,
                        color: Colors.blueGrey.shade100,
                        margin: EdgeInsets.fromLTRB(10, 8, 10, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Text('No'),
                            ),
                            Container(
                              child: Text('내용'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 1),
                                ),
                                child: Text('1'),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 30,
                                child: Text('0000/000/000'),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          // POINT
                          color: Colors.black,
                          width: 3.0,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text('코멘트'),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  getDailyPlanData(dpId, approvalId) async {
    var formData = Dio.FormData.fromMap({
      'platform_type': WebConfig.platformType,
      'platform_key': WebConfig.platformKey,
      'user_id': UserInfo.userId,
      'user_session': UserInfo.userSession,
      'scene_id': UserInfo.sceneId,
      'scene_ids': '["${UserInfo.sceneId}"]',
      'dp_id': dpId,
      'approval_id': approvalId,
    });

    try {
      var dio = Dio.Dio();
      var response = await dio.post(
          WebConfig.host + '/DailyPlan/Get_DailyPlanData',
          data: formData,
          options:
              Dio.Options(contentType: Dio.Headers.formUrlEncodedContentType));
      var temp = [];

      var dailyPlanData =
          jsonDecode(response.data['rsObj']['today_worker_list']);
      dailyPlanData[0]['worker_list'].forEach((el) {
        print(el['ctgo_occupation_name']);
      });

      var dailyPlanData1 = jsonDecode(response.data['rsObj']);
      dailyPlanData1[0].forEach((el) {
        print(el['scene_name']);
      });

      // workCheckController.dailyPlanData.add(temp);
      // print("count ${workCheckController.dailyPlanData.length}");
      // workCheckController.update();
      // print(temp);
    } on Dio.DioError catch (e) {
      print(e);
    }
  }
}

class WorkCheckController extends GetxController {
  var dailyPlanData = List<dynamic>.empty(growable: true);
}

class Permission1 {
  var Scene;
  var WorkManager;
  var WorkPeriod;
  var WorkCompanyName;
  var WorkingTime;
}

class Permission2 {
  var WorkType;
  var WorkingLocation;
  var NumberPeople;
  var list = [];
}

class Permission3 {
  var list1 = [];
}

class Permission4 {
  var list2 = [];
}
