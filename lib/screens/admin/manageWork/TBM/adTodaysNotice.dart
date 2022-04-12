import 'dart:io';
import 'package:beitflutter/styles/button_style.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../styles/app_colors.dart';
import '../../../../styles/beit_text_style.dart';
import '../../../../utils/file_model.dart';

class AdTodaysNotice extends StatefulWidget {
  const AdTodaysNotice({Key? key}) : super(key: key);

  @override
  _AdTodaysNoticeState createState() => _AdTodaysNoticeState();
}

int count = 0;

class _AdTodaysNoticeState extends State<AdTodaysNotice> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("금일공지시항"),
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
              ), //
              Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: AppColors.green))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  )), //제목
              Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: AppColors.green))),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(child: Row())),
              DownloadList() //
            ],
          ),
        ),
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
                      width: 50.0,
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
