import 'package:beitflutter/screens/admin/manageWork/adRiskAssessmentDetail.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/viewmodel/workManagement/riskAssessmentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

var workPermissionViewModel;
final statusList = ['전체', '작성중', '결제요청', '결제중', '결제완료', '반려'];
String dropdownValue = '전체';
String startDate = "", endDate = "";

class AdWorkPermission extends StatefulWidget {
  const AdWorkPermission({Key? key}) : super(key: key);

  @override
  _AdWorkPermissionState createState() => _AdWorkPermissionState();
}

class _AdWorkPermissionState extends State<AdWorkPermission> {
  @override
  void initState() {
    initPage();
    super.initState();
  }

  initPage() async {
    DateTime now = DateTime.now();
    startDate =
        DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: 30)));
    endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await workPermissionViewModel.fetchScene();
    await workPermissionViewModel.fetchCompany();
    await workPermissionViewModel.fetchType();
    workPermissionViewModel.fetchBoard(
        dropdownValue,
        workPermissionViewModel.companyDropDown.selectedId,
        workPermissionViewModel.typeDropDown.selectedId,
        startDate,
        endDate,
        "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("작업허가서"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                            child: Text(
                          "기간",
                          style: BeitTextStyle.t2,
                        )),
                      ),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Text(startDate),
                                IconButton(
                                  icon: Icon(Icons.date_range,
                                      color: AppColors.green),
                                  onPressed: () async {
                                    showDatePickerPop('startDate');
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(endDate),
                                IconButton(
                                  icon: Icon(Icons.date_range,
                                      color: AppColors.green),
                                  onPressed: () {
                                    showDatePickerPop('endDate');
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      flex: 6,
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '검색어를 입력해주세요',
                          isDense: true, // Added this
                        ),
                      ),
                      flex: 4,
                    ),
                    Flexible(
                      child: ElevatedButton(
                        style: beitButtonStyle.green,
                        child: Icon(Icons.search),
                        onPressed: () {},
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [],
                    ),
                    Row(
                      children: [
                        Icon(Icons.storage),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDatePickerPop(val) async {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2000), //시작일
      lastDate: DateTime(2050), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );
    selectedDate.then((dateTime) {
      var date = DateFormat('yyyy-MM-dd').format(dateTime!);
      date = date.toString();
      if (val == 'startDate') {
        setState(() {
          startDate = date;
        });
      } else {
        setState(() {
          endDate = date;
        });
      }
      updateBoard();
    });
  }
}

updateBoard() {
  workPermissionViewModel.board.clear();
  workPermissionViewModel.fetchBoard(
      dropdownValue,
      workPermissionViewModel.companyDropDown.selectedId,
      workPermissionViewModel.typeDropDown.selectedId,
      startDate,
      endDate,
      "");
  workPermissionViewModel.update();
}
