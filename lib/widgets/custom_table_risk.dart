import 'package:flutter/material.dart';
import 'package:beitflutter/styles/app_colors.dart';

import '../styles/beit_text_style.dart';

class RiskTitle extends StatelessWidget {
  final String title;

  const RiskTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ //현장영역
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                  decoration: BoxDecoration(
                      border: Border(left: BorderSide(width: 3))),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: BeitTextStyle.t3,
                      ),
                    ],
                  )),
            ],
          ),
        ), //위험성 평가서 덩어리
      ],
    );
  }
}

class TableLevel1 extends StatelessWidget {
  final String index;
  final String text;

  const TableLevel1({Key? key, required this.text, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (index != "0") ? RiskTitle(title: "위험성평가서 $index",) : Text(""),
        Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border(
                  bottom: BorderSide()
                )),
                child: Container(
                  color: AppColors.tableColorGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Level 1",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "세부공종",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            text,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TableLevel2 extends StatelessWidget {
  final String index;
  final String workStep;
  final String tool;
  final String numberOfTools;
  final String startDate;
  final String endDate;
  final String workLocation;
  final String people;

  const TableLevel2({
    Key? key,
    required this.index,
    required this.workStep,
    required this.tool,
    required this.numberOfTools,
    required this.startDate,
    required this.endDate,
    required this.workLocation,
    required this.people,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Container(
                  color: AppColors.tableColorGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Level 2",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                  right: BorderSide(),
                  left: BorderSide(),
                  bottom: BorderSide(),
                ),),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "작업단계",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            workStep,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [

                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "사용장비",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            tool,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "시작일",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            startDate,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [

                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "종료일",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            endDate,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "작업위치",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            workLocation,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [

                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "인원",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            people,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TableLevel3 extends StatelessWidget {
  final String index;
  final String dangerFactor;
  final String damageType;
  final String frequency;
  final String intensity;
  final String grade;
  final String solution;
  final String comment;

  const TableLevel3({
    Key? key,
    required this.index,
    required this.dangerFactor,
    required this.damageType,
    required this.frequency,
    required this.intensity,
    required this.grade,
    required this.solution,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Wrap(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Container(
                  color: AppColors.tableColorGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "Level 3",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                  right: BorderSide(),
                  left: BorderSide(),
                  bottom: BorderSide(),
                ),),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "위험요인",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            dangerFactor,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [

                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "피해형태",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            damageType,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "빈도",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            frequency,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [

                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "강도",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            intensity,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "등급",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            grade,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    right: BorderSide(),
                    left: BorderSide(),
                    bottom: BorderSide()
                )),
                child: Row(
                  children: [

                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "관리방안",
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 1,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(7),
                        decoration: BoxDecoration(border: Border(
                            left: BorderSide()
                        )),
                        child: Center(
                          child: Text(
                            solution,
                            style: BeitTextStyle.t2,
                          ),
                        ),
                      ),
                      flex: 3,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
