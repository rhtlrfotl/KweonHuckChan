import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/widgets/custom_table_risk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../styles/app_colors.dart';

class WorkPermissionRisk extends StatefulWidget {
  const WorkPermissionRisk({Key? key}) : super(key: key);

  @override
  State<WorkPermissionRisk> createState() => _WorkPermissionRiskState();
}

class _WorkPermissionRiskState extends State<WorkPermissionRisk> {
  var count = 0;
  int assessmentCount = 0;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("위험성평가서 확인"),
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Container(),
                  ),
                ],
              ), //좌우 버튼
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
