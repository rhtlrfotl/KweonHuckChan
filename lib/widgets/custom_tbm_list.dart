import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/beit_text_style.dart';

class TBMList extends StatelessWidget {
  const TBMList({Key? key, required this.tbmWorkerList}) : super(key: key);

  final tbmWorkerList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all()
                ),
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
                            child: Text("이름"),
                          ),flex: 2,
                        ),
                      ),
                      Container(
                        child: Flexible(
                          child: Center(
                            child: Text("목록"),
                          ),flex: 4,
                        ),
                      ),
                      Container(
                        child: Flexible(
                          child: Center(
                            child: Text("TBM"),
                          ),flex: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: tbmWorkerList.length,
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
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text((index+1).toString()),
                              ),
                            ),flex: 1,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(tbmWorkerList[index].userName),
                              ),
                            ),flex: 2,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text("${tbmWorkerList[index].title}"),
                              ),
                            ),flex: 4,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Center(
                                child: Text(tbmWorkerList[index].isTBM),
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

