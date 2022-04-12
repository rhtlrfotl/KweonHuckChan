import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:beitflutter/screens/worker/DashBoard.dart';

class PersonalInformationProcessingPolicy extends StatefulWidget {
  const PersonalInformationProcessingPolicy({Key? key}) : super(key: key);

  @override
  State<PersonalInformationProcessingPolicy> createState() =>
      _PersonalInformationProcessingPolicyState();
}

class _PersonalInformationProcessingPolicyState
    extends State<PersonalInformationProcessingPolicy> {
  final ScrollController _scrollController = ScrollController();

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.blueGrey.shade100,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      // decoration: BoxDecoration(
                      //     color: const Color(0xff84bec2),
                      //     ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '개인정보방침 동의',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  Get.back();
                                  print('menu button is clicked');
                                }),
                          ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '1. 주식회사 지에스아이엘는 안드로이드 앱(스마트 건설관리 시스템) 이용자의 개인정보를 매우 중요하게 생각하며 각별히 주의를 기울여 처리하고 있습니다.\n다음과 같은 목적외에는 사용하지 않습니다.'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '– android.permission.CAMERA,\n– android.permission.READ_EXTERNAL_STORAGE,\n– android.permission.WRITE_EXTERNAL_STORAGE,\n– android.permission.READ_PHONE_STATE'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '2. 정보 주체의 권리, 의무 및 그 행사방법 이용자는 개인정보 주체로서 다음과 같은 권리를 행사할 수 있습니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '1) 개인정보 열람요구\n2) 오류 등이 있을 경우 정정 요구\n3) 삭제요구\n4) 처리정지 요구'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('* 지에스아이엘은(는) 앱 사용자의 사용정보를 수집 및 보유하지 않습니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('3. 처리하는 개인정보의 항목 작성'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('① 지에스아이엘은(는) 다음의 개인정보 항목을 처리하고 있습니다.'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text('1) < 안전점검 및 장비점검을 위한 카메라의 연동 >'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '– android.permission.CAMERA,\n– android.permission.READ_EXTERNAL_STORAGE,\n– android.permission.WRITE_EXTERNAL_STORAGE'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '단순히, 앱의 주 기능인 안전점검 및 장비점검을 위한 사진을 획득하는 용도로만 사용하고 저장하는 용도로만 사용합니다. 그 외의 어떠한 자료도 수집 및 처리하지 않습니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('2) < 정상적으로 허가된 사용자 확인 여부 >'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text('– android.permission.READ_PHONE_STATE'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text('4. 개인정보의 파기'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '지에스아이엘은(는) 원칙적으로 개인정보 처리목적이 달성된 경우에는 지체없이 해당 개인정보를 파기합니다. 파기의 절차, 기한 및 방법은 다음과 같습니다.'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '– 사용되는 개인정보는 안전점검 및 장비점검을 위한 사진을 획득하는 용도와 안전점검 및 장비점검을 위해 정상적으로 허가된 사용자 확인 여부만 따집니다.\n– 위 두 가지 외에는 어떤 목적으로도 자료를 수집, 처리하지 않습니다.\n– 앱 삭제시 더 이상 위 권한을 사용하지 않습니다.'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '5. 개인정보의 안정성 확보 조치 지에스아이엘은 개인정보보호법 제29에 따라 다음과 같이 안정성 확보에 필요한 기술적/관리적 및 물리적 조치를 하고 있습니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('① 내부관리계획의 수립 및 시행'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child:
                          Text('– 개인정보의 안전한 처리를 위하여 내부관리계획을 수립하고 시행하고 있습니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('② 개인정보에 대한 접근 제한'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '– 개인정보를 처리하는 데이터베이스시스템에 대한 접근권한의 부여,변경,말소를 통하여 개인정보에 대한 접근통제를 위하여 필요한 조치를 하고 있으며 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있습니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('③ 비인가자에 대한 출입 통제'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('– 출입통제 절차를 수립 및 운영하고 있습니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('6. 개인정보 보호책임자 작성'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '▶ 개인정보 보호책임자\n성명 : 이정우\n직책 : 대표\n연락처 : 070-7574-1728'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '▶ 개인정보 보호 담당부서\n성명 : 송민영\n직책 : 팀장\n연락처 : 070-7574-1728, dev@gsil.kr'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '② 정보주체께서는 지에스아이엘의 서비스를 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 지에스아이엘은(는) 정보주체의 문의에 대해 지체없이 답변 및 처리해드릴 것입니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('7. 개인정보 처리방침 변경'),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                          '① 이 개인정보 처리 방침은 시행일로부터 적용되며, 법령 및 방침에 따른 변경내용의 추가, 삭제 및 정정이 있는 경우에는 변경사항의 시행 7일 전부터 공지사항을 통하여 고지할 것입니다.'),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(20),
                      child: Text('이 개인정보 처리방침은 2021년 02월 03일부터 적용됩니다.'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ])),
      ),
    );
  }
}
