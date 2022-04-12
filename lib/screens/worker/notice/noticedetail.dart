import 'dart:io';
import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/utils/file_model.dart';
import 'package:beitflutter/viewmodel/notice/noticeDetailViewModel.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'notice.dart';
import 'noticeupdate.dart';

NoticeDetailViewModel noticeDetailViewModel = NoticeDetailViewModel();

class NoticeDetail extends StatefulWidget {
  const NoticeDetail({Key? key}) : super(key: key);

  @override
  State<NoticeDetail> createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticeDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => Notice());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("공지사항 Detail Test"),
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
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(50, 15, 50, 15),
          child: FutureBuilder(
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.green))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                    child: Text(
                                  "${noticeDetailViewModel.noticeDetail!.title}",
                                  style: BeitTextStyle.t5,
                                ))
                              ],
                            )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${noticeDetailViewModel.noticeDetail!.companyName} / ${noticeDetailViewModel.noticeDetail!.author}",
                              style: BeitTextStyle.t1,
                            )
                          ],
                        )), //제목
                    Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: AppColors.green))),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                            child: Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                                    "${noticeDetailViewModel.noticeDetail!.desc}"))
                          ],
                        ))),
                    DownloadList() //
                  ],
                );
              } else {
                return Text(("loading"));
              }
            },
          ),
        )),
        floatingActionButton: Wrap(
          //will break to another line on overflow
          direction: Axis.vertical, //use vertical to show  on vertical axis
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(10),
                child: SpeedDial(
                    icon: Icons.share,
                    backgroundColor: Colors.amber,
                    children: [
                      SpeedDialChild(
                        child: const Icon(Icons.edit),
                        label: 'edit',
                        backgroundColor: Colors.amberAccent,
                        onTap: () {
                          Get.off(() => NoticeUpdate(), arguments: {
                            'noticeId': Get.arguments['noticeId']
                          });
                        },
                      ),
                      SpeedDialChild(
                        child: const Icon(Icons.delete),
                        label: 'delete',
                        backgroundColor: Colors.amberAccent,
                        onTap: () {
                          deleteNoticeDeatail();
                        },
                      ),
                    ])),
            // Add more buttons here
          ],
        ),
      ),
    );
  }

  deleteNoticeDeatail() async {
    var nid = Get.arguments['noticeId'];
    print("notice Id : ${nid}");
    Get.dialog(
      AlertDialog(
        title: const Text('게시물 삭제'),
        content: const Text('삭제 하시겠습니까?'),
        actions: [
          TextButton(
            child: const Text("아니요"),
            onPressed: () => Get.off(() => Notice()),
          ),
          TextButton(
              child: const Text("예"),
              onPressed: () async {
                var result = await Repository.deleteNoticeDeatail(nid);
                if (result) {
                  Get.off(() => Notice());
                } else {
                  print("falil");
                }
              }),
        ],
      ),
    );
  }
}

class DownloadList extends StatefulWidget {
  const DownloadList({Key? key}) : super(key: key);

  @override
  _DownloadListState createState() => _DownloadListState();
}

class _DownloadListState extends State<DownloadList> {
  List<FileModel>? fileList = [];
  late DownloaderUtils options;
  late DownloaderCore core;
  late final String path;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
    if (noticeDetailViewModel.noticeDetail!.fileData == null) {
      return;
    } else {
      noticeDetailViewModel.noticeDetail!.fileData.forEach((value) {
        print(value);
        fileList!.add(FileModel(
          fileName: value['file_name'],
          url: value['file_url'] + value['file_name'],
          progress: 0.0,
        ));
      });
    }
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
  }

  void _setPath() async {
    Directory _path = await getApplicationDocumentsDirectory();
    String _localPath = _path.path + Platform.pathSeparator + 'Download';
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }
    path = _localPath;
  }

  generateWidgetList() {
    if (fileList == null) return;
    List<Widget> widgetList = [];

    fileList!.asMap().forEach((index, element) {
      widgetList.add(Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Get.width / 2,
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(fileList![index].fileName!),
            ),
            ElevatedButton(
              style: beitButtonStyle.green,
              onPressed: () async {
                var storagePermission =
                    await Permission.storage.request().isGranted;
                if (!storagePermission) {
                  Get.dialog(Text("권한 없음"));
                  return;
                }
                print("URL ------------------------- ${fileList![index].url!}");
                options = DownloaderUtils(
                  progressCallback: (current, total) {
                    final progress = (current / total) * 100;
                    print('Downloading: $progress');

                    setState(() {
                      fileList![index].progress = (current / total);
                    });
                  },
                  file: File('$path/${fileList![index].fileName}'),
                  progress: ProgressImplementation(),
                  onDone: () {
                    setState(() {
                      fileList![index].progress = 0.0;
                    });
                    OpenFile.open('$path/${fileList![index].fileName}')
                        .then((value) {
                      print(value);
                      // delete the file.
                      // File f = File('$path/${fileList[index].fileName}');
                      // f.delete();
                    });
                  },
                  deleteOnCancel: true,
                );
                core = await Flowder.download(
                  fileList![index].url!,
                  options,
                );
              },
              child: Column(
                children: [
                  if (fileList![index].progress == 0.0)
                    Icon(
                      Icons.download,
                    ),
                  if (fileList![index].progress != 0.0)
                    LinearPercentIndicator(
                      width: 100.0,
                      lineHeight: 14.0,
                      percent: fileList![index].progress!,
                      backgroundColor: Colors.blue,
                      progressColor: Colors.white,
                    ),
                ],
              ),
            ),
          ],
        ),
      ));
    });

    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [...generateWidgetList()],
      ),
    );
  }
}
