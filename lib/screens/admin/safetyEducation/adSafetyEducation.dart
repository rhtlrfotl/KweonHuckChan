import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/viewmodel/safetyEducation/safetyEducationViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../styles/app_colors.dart';
import '../../../styles/beit_text_style.dart';

class AdSafetyEducation extends StatefulWidget {
  const AdSafetyEducation({Key? key}) : super(key: key);

  @override
  _AdSafetyEducationState createState() => _AdSafetyEducationState();
}

late SafetyEducationViewModel safetyEducationViewModel;
String startDate = "", endDate = "";
String? searchText;

class _AdSafetyEducationState extends State<AdSafetyEducation> {
  @override
  void initState() {
    safetyEducationViewModel = Get.put(SafetyEducationViewModel());

    startDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(Duration(days: 30)));
    endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("안전교육"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                            child: Text(
                          "현장",
                          style: BeitTextStyle.t2,
                        )),
                      ),
                      flex: 2,
                    ),
                    Flexible(
                      child: Container(
                        child: Container(),
                      ),
                      flex: 6,
                    )
                  ],
                ),
              ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                        onChanged: (val) {
                          searchText = val;
                          print("searchText : ${searchText}");
                        },
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
                        GetBuilder<SafetyEducationViewModel>(builder: (_) {
                          return Text(" Total : ${_.board.length}");
                        })
                      ],
                    )
                  ],
                ),
              ),
              GetBuilder<SafetyEducationViewModel>(
                builder: (_) {
                  return _.board.isEmpty
                      ? Text("empty...")
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: _.board.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 10, 10, 10),
                                onTap: () {},
                                title: Container(
                                    child: Text(
                                  "${_.board[index].className}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: false,
                                  style: BeitTextStyle.t3,
                                )),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "교육일 : ${_.board[index].educationDate}",
                                      style: BeitTextStyle.t1,
                                    ),
                                    Text(
                                      "강사성명 : ${_.board[index].educatorName}",
                                      style: BeitTextStyle.t1,
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "작성일 : ${_.board[index].regDate}",
                                      style: BeitTextStyle.t1,
                                    ),
                                    Text(
                                      "작성자 : ${_.board[index].name}",
                                      style: BeitTextStyle.t1,
                                    ),
                                  ],
                                ),
                              ),
                              elevation: 2,
                            );
                          },
                        );
                },
              )
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
    });
  }
}
