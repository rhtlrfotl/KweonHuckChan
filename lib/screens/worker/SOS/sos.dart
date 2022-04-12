import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles/app_colors.dart';

class SOS extends StatefulWidget {
  const SOS({Key? key}) : super(key: key);

  @override
  _SOSState createState() => _SOSState();
}

class _SOSState extends State<SOS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BE-IT"),
        backgroundColor: AppColors.green,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: Get.height/5,
          width: Get.width/2,
          child: ElevatedButton(
            style: beitButtonStyle.green,
            child: Text("버튼 자리\npush alram", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  content: const Text('보내시겠습니까?'),
                  actions: [
                    TextButton(
                        child: const Text("아니요"),
                        onPressed: () => Get.back(),
                    ),
                    TextButton(
                      child: const Text("예"),
                      onPressed: (){
                        pushAlarm();
                        Get.back();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      )
    );
  }

  pushAlarm() async{
    var dioText = await Repository.requestFCM("FLUTTER", "BODY");
    Get.dialog(
      Dialog(
        child: Container(
          height: 100,
          child: Center(
            child: Text(
              '신고되었습니다.${dioText.toString()}',
              style: TextStyle(
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}


