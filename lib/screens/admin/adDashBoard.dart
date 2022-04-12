import 'package:beitflutter/main.dart';
import 'package:beitflutter/screens/worker/SOS/sos.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/globalVariable.dart';
import '../../config/userinfo.dart';
import '../../styles/beit_text_style.dart';
import '../worker/auth/signin.dart';

double tableHeight = 200;
late DynamicUserInfo dynamicUserInfo;

class AdDashBoard extends StatefulWidget {
  const AdDashBoard({Key? key}) : super(key: key);

  @override
  State<AdDashBoard> createState() => _AdDashBoardState();
}

class _AdDashBoardState extends State<AdDashBoard> {
  List<bool> tempActive = [true, true, true, true, false, true, true, true];
  List<String> activeMenu = [
    "공지사항",
    "인력관리",
    "작업관리",
    "안전교육",
    "통합모니터링",
    "부적합관리",
    "작업중지요청",
    "SOS 응급호출"
  ];
  var menu;
  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      menu = Get.arguments["menu"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
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
        ),
      ),
      appBar: AppBar(
        title: Text("Be-IT-admin"),
        actions: const [IconButton(onPressed: tagRead, icon: Icon(Icons.nfc))],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(20),
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
                          builder: (_) {
                            return Text(
                              "${UserInfo.userName} | ${_.userState}",
                              style: BeitTextStyle.t3,
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
            SliverGrid.count(
                crossAxisCount: 3,
                children: List.generate(activeMenu.length, (index) {
                  return GestureDetector(
                    onTap: tempActive[index] ? () {} : null,
                    // onTap: (){
                    //   Get.to(activeMenuScreen[index]);
                    // },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: tempActive[index]
                              ? AppColors.green
                              : Colors.grey),
                      margin: EdgeInsets.all(4),
                      child: Center(
                          child: Text(
                        activeMenu[index],
                        style: BeitTextStyle.dashBoardMenu,
                      )),
                    ),
                  );
                })),
          ],
        ),
      ),
    ));
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

void tagRead() {
  dynamicUserInfo = Get.put(DynamicUserInfo());
  NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
    String nfcData = "";
    tag.data['ndef']['cachedMessage']['records'][0]['payload']
        .asMap()
        .forEach((index, value) {
      if (index > 2) {
        nfcData += String.fromCharCode(value);
      }
    });
    print("NFC TAGGED : ${nfcData}");
    for (var element in GlobalVariable.nfcCards) {
      print("Global card : ${element.iosUqId}");
      if (element.iosUqId == nfcData) {
        print("true : ${element.iosUqId}/${nfcData}");
      }
    }
    NfcManager.instance.stopSession();
  });
}
