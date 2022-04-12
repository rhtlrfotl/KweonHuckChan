import 'package:beitflutter/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../styles/beit_text_style.dart';
import '../../../../widgets/custom_table_work_permission.dart';

class AdTodaysWorkPermission extends StatefulWidget {
  const AdTodaysWorkPermission({Key? key}) : super(key: key);

  @override
  _AdTodaysWorkPermissionState createState() => _AdTodaysWorkPermissionState();
}

int count = 0;

class _AdTodaysWorkPermissionState extends State<AdTodaysWorkPermission> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("금일작업허가서"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (count > 0) {
                          setState(() {
                            count -= 1;
                          });
                        }
                      },
                      child: Text("이전페이지"),
                      style: beitButtonStyle.green,
                    ),
                    Container(),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
