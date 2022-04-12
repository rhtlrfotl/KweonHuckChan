import 'package:beitflutter/viewmodel/workerManagement/tbmWorkerViewModel.dart';
import 'package:beitflutter/widgets/custom_tbm_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../styles/beit_text_style.dart';

class AdTodaysTBMState extends StatefulWidget {
  const AdTodaysTBMState({Key? key}) : super(key: key);

  @override
  _AdTodaysTBMStateState createState() => _AdTodaysTBMStateState();
}

late TBMWorkerViewModel tbmWorkerViewModel;
String? searchText;
final statusList = ['전체', '수행', '미수행'];
String dropdownValue = '전체';

class _AdTodaysTBMStateState extends State<AdTodaysTBMState> {
  @override
  void initState() {
    super.initState();
    dropdownValue = '전체';
    tbmWorkerViewModel = Get.put(TBMWorkerViewModel());
  }

  updateBoard(isTBM) async {
    tbmWorkerViewModel.board.clear();
    if (isTBM != "전체") {
      List<Board> tempBoard = List<Board>.empty(growable: true);

      tbmWorkerViewModel.board.forEach((element) {
        if (element.isTBM == "Y" && isTBM == "수행") {
          tempBoard.add(element);
        } else if (element.isTBM == "N" && isTBM == "미수행") {
          tempBoard.add(element);
        }
      });
      tbmWorkerViewModel.board = tempBoard;
    }
    tbmWorkerViewModel.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("금일 근로자 TBM현황"),
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
                        "업체",
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
                        "공종",
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
                        "직종",
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
                        "TBM 현황",
                        style: BeitTextStyle.t2,
                      )),
                    ),
                    flex: 2,
                  ),
                  Flexible(
                    child: Container(
                      child: DropdownButton(
                        isExpanded: true,
                        underline:
                            DropdownButtonHideUnderline(child: Container()),
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
                          updateBoard(dropdownValue);
                        },
                      ),
                    ),
                    flex: 6,
                  )
                ],
              ),
            ),
            // _.todayWorkerList.isNotEmpty ? TableTodaysWorker(todayWorkerList: _.todayWorkerList) : SizedBox()
            GetBuilder<TBMWorkerViewModel>(
              builder: (_) {
                return _.board.isNotEmpty
                    ? TBMList(tbmWorkerList: _.board)
                    : Text("empty...");
              },
            )
          ],
        ),
      )),
    );
  }
}
