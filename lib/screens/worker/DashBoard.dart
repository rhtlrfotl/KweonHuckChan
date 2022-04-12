import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/screens/admin/manageWork/TBM/adTBMMain.dart';
import 'package:beitflutter/screens/worker/todaysEducation/todayseducation.dart';
import 'package:beitflutter/screens/worker/workPermission/wpmain.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/userinfo.dart';
import '../../styles/app_colors.dart';
import 'SOS/sos.dart';
import 'auth/signin.dart';
import 'notice/notice.dart';

bool _isChecked = false;

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<bool> tempActive = [true,true,true,true,true,false];
  List<String> activeMenu = ["공지사항","금일교육","작업허가요청","작업중지요청","SOS 응급호출","안전보건관리체계"];
  // var activeMenuScreen = [Notice(),TodaysEducation(),WorkPermission(),SOS(),SOS()];;
  var activeMenuScreen = [Notice(),TodaysEducation(),AdTBMMain(),SOS(),SOS()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("BE-IT"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              tooltip: 'Show',
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "스마트 안전관리",
                            style: BeitTextStyle.t5,
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: Text(
                            UserInfo.sceneName,
                            style: BeitTextStyle.t4,
                          )),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          child: GetBuilder<DynamicUserInfo>(
                            init: DynamicUserInfo(),
                            builder: (_){
                              return Text(
                                "${UserInfo.userName} | ${_.userState}",
                                style: BeitTextStyle.t3,
                              );
                            },
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SliverGrid.count(
                  crossAxisCount: 2,
                  children: List.generate(activeMenu.length, (index) {
                    return GestureDetector(
                      onTap: tempActive[index] ? () async{
                        if(index == 1){
                          var result = await Repository.getTodaysEducation();
                          print(result);
                          if(result['rsMap'].isEmpty){
                            Get.defaultDialog(title: '!', middleText: '금일교육이 없습니다.');
                          }
                          else{
                            Get.to(()=> TodaysEducation());
                          }
                        }
                        else{
                          Get.to(activeMenuScreen[index]);
                        }
                      }: null,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tempActive[index] ? AppColors.green : Colors.grey),
                        margin: EdgeInsets.all(4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(activeMenu[index],style: BeitTextStyle.dashBoardMenu,),
                          ],
                        ),
                      ),
                    );
                  })
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // DrawerHeader(
              //   child: Text('Drawer Header'),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //   ),
              // ),
              ListTile(
                title: Text('이름 : ${UserInfo.userName}'),
                // onTap: () {},
              ),
              ListTile(
                title: Text('아이디 : ${UserInfo.ID}'),
                // onTap: () {},
              ),
              ListTile(
                title: Text('업체 : ${UserInfo.company}'),
                // onTap: () {},
              ),
              ListTile(
                title: Text(
                  '현장 : ${UserInfo.sceneName}',
                  style: TextStyle(fontSize: 13),
                ),
                // onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('마이페이지'),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('알림설정'),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('알림설정'),
                      content: const Text('This is a dialog'),
                      actions: [
                        TextButton(
                          child: const Text("취소"),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.palette),
                title: Text('기능설정'),
                onTap: () {},
              ),
              ListTile(
                title: Text('개인정보 처리방침'),
                onTap: () {},
              ),
              ListTile(
                title: Text('로그아웃'),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text('로그아웃하기'),
                      content: const Text('로그아웃 하시겠습니까?'),
                      actions: [
                        TextButton(
                            child: const Text("예"),
                            onPressed: () {
                              signOut();
                            }),
                        TextButton(
                          child: const Text("아니요"),
                          onPressed: () => Get.back(),
                        ),
                      ],
                    ),
                  );
                },
              ),
              ExpansionTile(
                title: Text("Expansion Title"),
                children: [
                  ListTile(
                    title: Text('로그아웃'),
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          title: const Text('로그아웃하기'),
                          content: const Text('로그아웃 하시겠습니까?'),
                          actions: [
                            TextButton(
                                child: const Text("예"),
                                onPressed: () {
                                  signOut();
                                }),
                            TextButton(
                              child: const Text("아니요"),
                              onPressed: () => Get.back(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  signOut() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove('user_id');
    prefs.remove('user_session');
    prefs.remove('ID');
    prefs.remove('password');
    Get.offAll(() => SignIn());
  }
}
