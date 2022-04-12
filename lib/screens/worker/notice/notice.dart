import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/styles/text_styles.dart';
import 'package:beitflutter/viewmodel/notice/noticeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'noticedetail.dart';
import 'noticepost.dart';

late NoticeViewModel noticeViewModel;
String? searchText;

class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  void initState() {
    super.initState();
    noticeViewModel = Get.put(NoticeViewModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("공지사항"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: '검색어를 입력해주세요',
                              isDense: true, // Added this
                              contentPadding: EdgeInsets.all(8), // Added this
                            ),
                            onChanged: (value) {
                              print(value);
                              searchText = value;
                            },
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
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [],
                        ),
                        Row(
                          children: [
                            Icon(Icons.storage),
                            GetBuilder<NoticeViewModel>(builder: (_) {
                              return Text(
                                  " Total : ${_.noticeViewModel.length}");
                            })
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GetBuilder<NoticeViewModel>(
                    builder: (_) {
                      return _.noticeViewModel.isEmpty
                          ? Center(child: Text("empty..."))
                          : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: _.noticeViewModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                  elevation: 2,
                                  child: Slidable(
                                    key: ValueKey(index),
                                    startActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (val) async {
                                            // await deleteNoticeDeatail(_.noticeViewModel[index].noticeId, index);
                                          },
                                          backgroundColor: Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                        ),
                                      ],
                                      extentRatio: 2 / 5,
                                    ),
                                    endActionPane: ActionPane(
                                      motion: ScrollMotion(),
                                      children: [
                                        SlidableAction(
                                          onPressed: (val) async {
                                            // await deleteNoticeDeatail(_.noticeViewModel[index].noticeId, index);
                                          },
                                          backgroundColor: Color(0xFFFE4A49),
                                          foregroundColor: Colors.white,
                                          icon: Icons.delete,
                                          label: 'Delete',
                                        ),
                                      ],
                                      extentRatio: 2 / 5,
                                    ),
                                    child: ListTile(
                                        // contentPadding: EdgeInsets.all(10),
                                        onTap: () {
                                          print(
                                              "notice ID : ${_.noticeViewModel[index].noticeId}");
                                          Get.to(() => NoticeDetail(),
                                              arguments: {
                                                'noticeId': _
                                                    .noticeViewModel[index]
                                                    .noticeId
                                                    .toString()
                                              });
                                        },
                                        title: Container(
                                            child: Text(
                                          "${_.noticeViewModel[index].title}",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          softWrap: false,
                                          style: BeitTextStyle.t4,
                                        )),
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${_.noticeViewModel[index].company}"),
                                          ],
                                        ),
                                        trailing: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                                "${_.noticeViewModel[index].writeAt}"),
                                            Text(
                                                "조회수 : ${_.noticeViewModel[index].hit}")
                                          ],
                                        )),
                                  ),
                                );
                              });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.green,
        onPressed: () {
          Get.to(() => NoticePost());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  deleteNoticeDeatail(noticeId, index) async {
    var nid = noticeId;
    print("notice Id : ${nid}");
    Get.dialog(
      AlertDialog(
        title: const Text('게시물 삭제'),
        content: const Text('삭제 하시겠습니까?'),
        actions: [
          TextButton(
            child: const Text("아니요"),
            onPressed: () => Get.back(),
          ),
          TextButton(
              child: const Text("예"),
              onPressed: () async {
                var result = await Repository.deleteNoticeDeatail(noticeId);
                if (result) {
                  Get.find<NoticeViewModel>().noticeViewModel.removeAt(index);
                  Get.find<NoticeViewModel>().update();
                  Get.back();
                } else {
                  print("falil");
                }
              }),
        ],
      ),
    );
  }
}
