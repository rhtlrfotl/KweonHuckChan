import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/beit_text_style.dart';


class TableWorkPermission extends StatelessWidget {
  final String? sceneName;
  final String? workingManager;
  final String? workingPeriod;
  final String? workingCompany;
  final String? workingTime;

  const TableWorkPermission({
    Key? key,
    required this.sceneName,
    required this.workingManager,
    required this.workingPeriod,
    required this.workingCompany,
    required this.workingTime,
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
                  color: AppColors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "작업허가서",
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
                            "현장",
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
                            sceneName.toString(),
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
                  bottom: BorderSide(),
                ),),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        child: Center(
                          child: Text(
                            "작업책임자",
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
                            workingManager.toString(),
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
                            "작업기간",
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
                            workingPeriod.toString(),
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
                            "작업업체명",
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
                            workingCompany.toString(),
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
                            "작업시간",
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
                            workingTime.toString(),
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


class TableWorkDesc extends StatelessWidget {
  final String? constructionType;
  final String? workingLocation;
  final String? workerNumber;

  const TableWorkDesc({
    Key? key,
    required this.constructionType,
    required this.workingLocation,
    required this.workerNumber,
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
                  color: AppColors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "작업내용",
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
                            "공종",
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
                            constructionType.toString(),
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
                  bottom: BorderSide(),
                ),),
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
                            workingLocation.toString(),
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
                            "작업인원",
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
                            workerNumber.toString(),
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

class TableEquip extends StatelessWidget {

  final equipList;

  const TableEquip({
    Key? key,
    required this.equipList,
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
                  padding : EdgeInsets.all(10),
                  color: AppColors.tableColorGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Text("No"),
                          ),
                        ),flex: 1,
                      ),
                      Container(
                        child: Flexible(
                          child: Center(
                            child: Text("중장비"),
                          ),flex: 4,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Text("수량"),
                          ),
                        ),flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: equipList.length,
                itemBuilder: (context, index){
                  return Container(
                      padding : EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border(
                      bottom: BorderSide(),
                      left: BorderSide(),
                      right: BorderSide()
                    ),),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                child: Center(
                                  child: Text((index+1).toString()),
                                ),
                              ),flex: 1,
                            ),
                            Flexible(
                              child: Container(
                                child: Center(
                                  child: Text(equipList[index].name),
                                ),
                              ),flex: 4,
                            ),
                            Flexible(
                              child: Container(
                                child: Center(
                                  child: Text(equipList[index].num.toString()),
                                ),
                              ),flex: 1,
                            ),
                          ],
                        ),
                      ),
                    );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

class TableTodaysWork extends StatelessWidget {

  final todayWorkList;

  const TableTodaysWork({
    Key? key,
    required this.todayWorkList,
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
                  padding : EdgeInsets.all(10),
                  color: AppColors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Text("금일작업 사항"),
                          ),
                        ),flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    bottom: BorderSide(),
                    left: BorderSide(),
                    right: BorderSide()
                ),),
                child: Container(
                  padding : EdgeInsets.all(10),
                  color: AppColors.tableColorGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Text("No"),
                          ),
                        ),flex: 1,
                      ),
                      Container(
                        child: Flexible(
                          child: Center(
                            child: Text("내용"),
                          ),flex: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: todayWorkList.length,
                itemBuilder: (context, index){
                  return Container(
                    padding : EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border(
                        bottom: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide()
                    ),),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              child: Center(
                                child: Text((index+1).toString()),
                              ),
                            ),flex: 1,
                          ),
                          Flexible(
                            child: Container(
                              child: Center(
                                child: Text("${todayWorkList[index].name} / ${todayWorkList[index].workerNumber}"),
                              ),
                            ),flex: 4,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}

class TableTodaysWorker extends StatelessWidget {

  final todayWorkerList;

  const TableTodaysWorker({
    Key? key,
    required this.todayWorkerList,
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
                  padding : EdgeInsets.all(10),
                  color: AppColors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Text("근로자별 작업현황"),
                          ),
                        ),flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border(
                    bottom: BorderSide(),
                    left: BorderSide(),
                    right: BorderSide()
                ),),
                child: Container(
                  padding : EdgeInsets.all(10),
                  color: AppColors.tableColorGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          child: Center(
                            child: Text("No"),
                          ),
                        ),flex: 1,
                      ),
                      Container(
                        child: Flexible(
                          child: Center(
                            child: Text("내용"),
                          ),flex: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: todayWorkerList.length,
                itemBuilder: (context, index){
                  return Container(
                    padding : EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border(
                        bottom: BorderSide(),
                        left: BorderSide(),
                        right: BorderSide()
                    ),),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              child: Center(
                                child: Text((index+1).toString()),
                              ),
                            ),flex: 1,
                          ),
                          Flexible(
                            child: Container(
                              child: Center(
                                child: Text("${todayWorkerList[index].occupationName} / ${todayWorkerList[index].userName}"),
                              ),
                            ),flex: 4,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        )
      ],
    );
  }
}