import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/styles/text_styles.dart';
import 'package:beitflutter/screens/save/requestworkpermit.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class RiskAssessmentCheck extends StatefulWidget {
  const RiskAssessmentCheck({Key? key}) : super(key: key);

  @override
  _RiskAssessmentCheckState createState() => _RiskAssessmentCheckState();
}

class _RiskAssessmentCheckState extends State<RiskAssessmentCheck> {
  // var sceneDropDown = DropItem.init();
  // var noticeBoard = Get.put(NoticeBoard());
  // double tableHeight = Get.height / 10;
  // List<TableRow> tableRows = [];
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    return 'Hello Friends...';
  }

  @override
  void initState() {
    // TODO: implement initStatex
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("위험성평가 확인"),
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
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
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
                              onPressed: () {},
                              child: null,
                            ),
                          ),
                          Container(
                            child: Text('1/6'),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            width: 120,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: null,
                            ),
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
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.black38, width: 2.0))),
                            child: Text('첨부파일'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800)),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400)),
                      child: Text('제목'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 30,
                      child: Text('제목'),
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
                            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: Colors.black38, width: 2.0))),
                            child: Text('위험성 평가서 1'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                // height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800)),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 328,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('내용'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('세부공종'),
                          ),
                          Container(
                            child: Text('fdff'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                // height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800)),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 328,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('내용'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('작업단계'),
                          ),
                          Container(
                            child: Text('굴파기'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('사용장비'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('장비수'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('시작일'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('종료일'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('작업위치'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('인원'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                // height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800)),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 328,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('내용'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('작업단계'),
                          ),
                          Container(
                            child: Text('굴파기'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('사용장비'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('장비수'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('시작일'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('종료일'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
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
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('작업위치'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey.shade400)),
                            child: Text('인원'),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 30,
                            child: Text('00000'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
