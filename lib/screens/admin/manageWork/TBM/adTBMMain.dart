import 'package:beitflutter/screens/admin/manageWork/TBM/adTodaysNotice.dart';
import 'package:beitflutter/screens/admin/manageWork/TBM/adTodaysWorkPermission.dart';
import 'package:beitflutter/screens/admin/manageWork/adWorkPermission.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../config/userinfo.dart';
import '../../../../data/repository.dart';
import '../../../../styles/app_colors.dart';
import '../../../../styles/beit_text_style.dart';
import '../../../worker/workPermission/wprisk.dart';

class AdTBMMain extends StatefulWidget {
  const AdTBMMain({Key? key}) : super(key: key);

  @override
  _AdTBMMainState createState() => _AdTBMMainState();
}

class _AdTBMMainState extends State<AdTBMMain> {
  int workPermission = 0;
  late DynamicUserInfo dynamicUserInfo;
  @override
  void initState() {
    super.initState();
    dynamicUserInfo = Get.put(DynamicUserInfo());
    initPage();
  }

  initPage() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("작업허가요청"),
        backgroundColor: AppColors.green,
        actions: <Widget>[],
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30),
              width: double.infinity,
              // decoration: BoxDecoration(border: Border.all(width: 1)),
              child: Column(
                children: const [
                  Text(
                    "작업허가 요청을 해주세요",
                    style: BeitTextStyle.t3,
                  ),
                  Text(
                    "아래 목록을 모두 확인 후에 어플리케이션 이용이 가능합니다",
                    style: BeitTextStyle.t1,
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
                    style: BeitTextStyle.t3,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () async {
                        var result = await Repository.getRiskAssessment();
                        if (result['rsMap'].isEmpty) {
                          Get.defaultDialog(title: '!', middleText: '위험셩평가 없음');
                          dynamicUserInfo.TBMCheck[0] = true;
                          dynamicUserInfo.update();
                        } else {
                          Get.to(() => const WorkPermissionRisk());
                          dynamicUserInfo.TBMCheck[0] = true;
                          dynamicUserInfo.update();
                        }
                      },
                      child: GetBuilder<DynamicUserInfo>(
                        builder: (_) {
                          return Row(
                            children: [
                              Icon(
                                Icons.check_circle_outline,
                                color: (dynamicUserInfo.TBMCheck[0] ||
                                        workPermission == 1)
                                    ? Colors.green
                                    : Colors.white,
                                size: 50,
                              ),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                                  child: Text(
                                    "위험성평가 확인",
                                    style: BeitTextStyle.t4_w,
                                  ))
                            ],
                          );
                        },
                      ),
                      style: beitButtonStyle.green,
                    ),
                  ),
                  Container(),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Container(),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Container(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
