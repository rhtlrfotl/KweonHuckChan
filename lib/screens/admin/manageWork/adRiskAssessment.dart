import 'package:beitflutter/screens/admin/manageWork/adRiskAssessmentDetail.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/viewmodel/workManagement/riskAssessmentViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdRiskAssessment extends StatefulWidget {
  const AdRiskAssessment({Key? key}) : super(key: key);

  @override
  State<AdRiskAssessment> createState() => _AdRiskAssessmentState();
}

var riskAssessmentViewModel;
final statusList = ['전체', '작성중', '결제요청', '결제중', '결제완료', '반려'];
String dropdownValue = '전체';
String startDate="", endDate="";

class _AdRiskAssessmentState extends State<AdRiskAssessment> {

  @override
  void initState() {
    riskAssessmentViewModel = Get.put(RiskAssessmentViewModel());
    super.initState();
    initPage();
  }

  initPage() async {
    DateTime now = DateTime.now();
    startDate = DateFormat('yyyy-MM-dd').format(now.subtract(Duration(days: 30)));
    endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    await riskAssessmentViewModel.fetchScene();
    await riskAssessmentViewModel.fetchCompany();
    await riskAssessmentViewModel.fetchType();
    riskAssessmentViewModel.fetchBoard(dropdownValue, riskAssessmentViewModel.companyDropDown.selectedId, riskAssessmentViewModel.typeDropDown.selectedId,startDate,endDate, "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("위험성평가서"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(

          child: Column(
            children: [
              DropDown(),
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
                                  icon: Icon(Icons.date_range,color: AppColors.green),
                                  onPressed: () async{
                                    showDatePickerPop('startDate');
                                  },
                                )
                              ],
                            ),

                            Row(
                              children: [
                                Text(endDate),
                                IconButton(
                                  icon: Icon(Icons.date_range,color: AppColors.green),
                                  onPressed: (){
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
                      children: [
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.storage),
                        GetBuilder<RiskAssessmentViewModel>(builder: (_) {
                          return Text(
                              " Total : ${_.board.length}");
                        })
                      ],
                    )
                  ],
                ),
              ),
              GetBuilder<RiskAssessmentViewModel>(
                builder: (_) {
                  return _.board.isEmpty
                      ? Text("loading")
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemCount: _.board.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  onTap: () {
                                    Get.to(()=>AdRiskAssessmentDetail(),arguments: {
                                      'raId' : _.board[index].raId,
                                      'approvalId' : _.board[index].approvalId,
                                      'sceneName' : _.board[index].sceneName
                                    });
                                  },
                                  title: Container(
                                      child: Text(
                                        "${_.board[index].companyName}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        softWrap: false,
                                        style: BeitTextStyle.t3,
                                      )),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("평가기간 : ${_.board[index].raStartDate}~${_.board[index].raEndDate}",style: BeitTextStyle.t1,),
                                    Text("작성자 : ${_.board[index].author}",style: BeitTextStyle.t1,),
                                  ],
                                ),
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(_.board[index].regDate),
                                    Text(_.board[index].cntApprovalState)
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.green,
        onPressed: (){
        },
        child: Icon(Icons.add),
      ),
    );
  }

  showDatePickerPop(val) async{
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
      if(val == 'startDate'){
        setState(() {
          startDate = date;
        });
      }
      else{
        setState(() {
          endDate = date;
        });
      }
      updateBoard();
    });
  }
}
updateBoard(){
  riskAssessmentViewModel.board.clear();
  riskAssessmentViewModel.fetchBoard(dropdownValue, riskAssessmentViewModel.companyDropDown.selectedId, riskAssessmentViewModel.typeDropDown.selectedId,startDate,endDate, "");
  riskAssessmentViewModel.update();
}
class DropDown extends StatefulWidget {
  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RiskAssessmentViewModel>(
      builder: (_) {
        return (_.sceneList.isEmpty ||
                _.companyList.isEmpty ||
                _.typeList.isEmpty)
            ? Text("loading...")
            : Column(
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
                            child: DropdownButton(
                              isExpanded: true,
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              value: _.sceneDropDown.selectedValue,
                              items: _.sceneDropDown.valueList.map(
                                (value) {
                                  return DropdownMenuItem(
                                    value: value.name,
                                    child: Container(child: Text(value.name)),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) async {
                                if (_.sceneDropDown.valueList.length > 1) {
                                  _.sceneDropDown.selectedValue = value;
                                  _.sceneDropDown.selectedId = _
                                      .sceneDropDown.valueList
                                      .firstWhere(
                                          (element) => element.name == value)
                                      .id;
                                  _.update();
                                  print("${value} / sceneID : ${_.sceneDropDown.selectedId}");
                                  updateBoard();
                                }
                              },
                            ),
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
                              "업체",
                              style: BeitTextStyle.t2,
                            )),
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          child: Container(
                            child: DropdownButton(
                              isExpanded: true,
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              value: _.companyDropDown.selectedValue,
                              items: _.companyDropDown.valueList.map(
                                (value) {
                                  return DropdownMenuItem(
                                    value: value.name,
                                    child: Container(child: Text(value.name)),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) async {
                                if (_.companyDropDown.valueList.length > 1) {
                                  _.companyDropDown.selectedValue = value;
                                  _.companyDropDown.selectedId = _
                                      .companyDropDown.valueList
                                      .firstWhere(
                                          (element) => element.name == value)
                                      .id;
                                  _.update();
                                  print("${value} / companyID : ${_.companyDropDown.selectedId}");
                                  updateBoard();
                                }
                              },
                            ),
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
                              "공종",
                              style: BeitTextStyle.t2,
                            )),
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          child: Container(
                            child: DropdownButton(
                              isExpanded: true,
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              value: _.typeDropDown.selectedValue,
                              items: _.typeDropDown.valueList.map(
                                (value) {
                                  return DropdownMenuItem(
                                    value: value.name,
                                    child: Container(child: Text(value.name)),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) async {
                                if (_.typeDropDown.valueList.length > 1) {
                                  _.typeDropDown.selectedValue = value;
                                  _.typeDropDown.selectedId = _
                                      .typeDropDown.valueList
                                      .firstWhere(
                                          (element) => element.name == value)
                                      .id;
                                  _.update();
                                  print("${value} / companyID : ${_.typeDropDown.selectedId}");
                                  updateBoard();
                                }
                              },
                            ),
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
                              "상태",
                              style: BeitTextStyle.t2,
                            )),
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          child: Container(
                            child: DropdownButton(
                              isExpanded: true,
                              underline: DropdownButtonHideUnderline(
                                  child: Container()),
                              value: dropdownValue,
                              items: statusList.map(
                                (value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Container(child: Text(value)),
                                  );
                                },
                              ).toList(),
                              onChanged: (value) async {
                                setState(() {
                                  dropdownValue = value.toString();
                                });
                                updateBoard();
                              },
                            ),
                          ),
                          flex: 6,
                        )
                      ],
                    ),
                  ),
                ],
              );
      },
    );
  }
}
