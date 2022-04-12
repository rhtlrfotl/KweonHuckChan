import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/repository.dart';
import '../../../styles/app_colors.dart';
import 'workPermissioncheck.dart';
import '../notice/noticeCheck.dart';

class WorkPermission extends StatefulWidget {
  const WorkPermission({Key? key}) : super(key: key);

  @override
  State<WorkPermission> createState() => _WorkPermissionState();
}

class _WorkPermissionState extends State<WorkPermission> {
  bool buttonenabled = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("작업허가요청"),
        backgroundColor: AppColors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Shows',
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              // decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                children: const [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "작업허가 요청을 해주세요",
                    style: BeitTextStyle.t3,
                  ),
                  Text(
                    "아래 목록을 모두 확인 후에 어플리케이션 이용이 가능합니다",
                    style: BeitTextStyle.t1,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  const Text(
                    "입력 목록",
                    style: BeitTextStyle.t1,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        var result = await Repository.getRiskAssessment();
                        if (result['rsMap'].isEmpty) {
                          Get.defaultDialog(title: '!', middleText: '위험셩평가 없음');
                        } else {}
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Text("위험성평가 확인")
                        ],
                      ),
                      style: beitButtonStyle.green,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const WorkPermissionCheck());
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Text("작업허가서 확인")
                        ],
                      ),
                      style: beitButtonStyle.green,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => NoticeCheck());
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          Text("공지사항 확인")
                        ],
                      ),
                      style: beitButtonStyle.green,
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          ElevatedButton(
                              style: beitButtonStyle.green,
                              onPressed: buttonenabled
                                  ? () {
                                      //if buttonenabled == true then pass a function otherwise pass "null"
                                      print("Elevated Button One pressed");
                                    }
                                  : null,
                              child: const Text("Elevated Button One")),

                          // OutlinedButton(
                          //     onPressed: buttonenabled?(){ //if buttonenabled == true then pass a function otherwise pass "null"
                          //       print("Outline Button Two Pressed");
                          //     }:null,
                          //     child: Text("Outline Button Two")
                          // ),

                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  //setState to refresh UI
                                  if (buttonenabled) {
                                    buttonenabled = false;
                                    //if buttonenabled == true, then make buttonenabled = false
                                  } else {
                                    buttonenabled = true;
                                    //if buttonenabled == false, then make buttonenabled = true
                                  }
                                });
                              },
                              child: const Text("Toggle Buttons")),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
