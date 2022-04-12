import 'package:beitflutter/screens/admin/adDashBoard.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flowder/flowder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../styles/app_colors.dart';
import '../../../styles/beit_text_style.dart';
import '../../../styles/text_styles.dart';
import '../../../utils/file_model.dart';
import '../../../viewmodel/notice/noticeDetailViewModel.dart';
import 'dart:io';
import 'package:beitflutter/data/common.dart';
import 'package:beitflutter/utils/file_model.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:beitflutter/config/userinfo.dart';
import 'package:beitflutter/config/webconfig.dart';
import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/text_styles.dart';
import 'package:path/path.dart';

bool fileListChanged = false;
NoticeDetailViewModel noticeDetailViewModel = NoticeDetailViewModel();

class AdNoticeUpdate extends StatefulWidget {
  const AdNoticeUpdate({Key? key}) : super(key: key);

  @override
  _AdNoticeUpdateState createState() => _AdNoticeUpdateState();
}

class _AdNoticeUpdateState extends State<AdNoticeUpdate> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  var detailData = DetailData(); //noticedeail.dart에 있는 클래스 불러움 추후 같은 함수는 분리 필요

  var noticeFile = UserFile();
  var noticeJson = UserJson();
  List<FileModel>? fileList = [];
  late DownloaderUtils options;
  late DownloaderCore core;
  late final String path;
  var fileController = Get.put(FileController());

  initPage() async {
    print("SDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD");
    _titleController.text = noticeDetailViewModel.noticeDetail!.title!;
    _descController.text = noticeDetailViewModel.noticeDetail!.desc!;
    if (noticeDetailViewModel.noticeDetail!.fileData != null) {
      noticeDetailViewModel.noticeDetail!.fileData.forEach((element) {
        fileController.addFile(element['file_name'],
            File(element['file_url'] + element['file_name']));
      });
    } else {
      detailData.fileData = null;
    }
  }

  @override
  void initState() {
    super.initState();
    initPage();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Get.offAll(AdDashBoard());
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("공지사항 수정"),
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: _titleController,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: const InputDecoration(
                          fillColor: Colors.transparent,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 1.0),
                            // borderRadius: BorderRadius.circular(15.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                              color: AppColors.grayshade,
                              width: 1.0,
                            ),
                          ),
                          filled: true,
                          hintText: "제목을 입력해주세요(필수사항)",
                          hintStyle: KTextStyle.textFieldHintStyle,
                          suffixIcon: SizedBox()),
                    ),
                    Container(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 1,
                        controller: _descController,
                        textInputAction: TextInputAction.newline,
                        obscureText: false,
                        decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1.0),
                              // borderRadius: BorderRadius.circular(15.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              // borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(
                                color: AppColors.grayshade,
                                width: 1.0,
                              ),
                            ),
                            filled: true,
                            hintText: "본문을 입력해주세요(필수사항)",
                            hintStyle: KTextStyle.textFieldHintStyle,
                            suffixIcon: SizedBox()),
                      ),
                    ),
                    GetBuilder<FileController>(
                      builder: (_) {
                        return fileController.title.isEmpty
                            ? Container(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                    "파일 없음 ${fileController.title.length}"))
                            : ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: fileController.title.length,
                                itemBuilder: (context, index) {
                                  var beitButtonStyle;
                                  return Container(
                                    key: ValueKey(index),
                                    padding: EdgeInsets.all(15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: Get.width / 2,
                                          child: Text(
                                            "${basename(fileController.title[index])}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                            style: BeitTextStyle.t2,
                                          ),
                                          // title: Text("${basename(fileController.title[index])}"),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              noticeJson.addDelete(
                                                  index + 1, "NOTICE");
                                              fileController.removeFile(index);
                                            },
                                            icon: Icon(
                                              Icons.remove_circle_outline,
                                              color: AppColors.green,
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
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
                          child: const Icon(Icons.file_copy_rounded),
                          label: 'file',
                          backgroundColor: Colors.amberAccent,
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(allowMultiple: true);
                            if (result != null) {
                              fileController.files = result.paths
                                  .map((path) => File(path!))
                                  .toList();
                              fileController.getFiles!.forEach((element) {
                                print("ELELEMEM ${element.path}");
                                fileController.title.add(element.path);
                                fileListChanged = true;
                              });
                              print(fileController.getFiles!.length);
                            } else {
                              // User canceled the picker
                            }
                          },
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.email),
                          label: 'Email',
                          backgroundColor: Colors.amberAccent,
                          onTap: () {
                            // Future _getImageFromCam() async {
                            //   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                            //   setState(() {
                            //     _image = image!;
                            //   });
                            // }
                          },
                        ),
                        SpeedDialChild(
                          child: const Icon(Icons.chat),
                          label: 'Message',
                          backgroundColor: Colors.amberAccent,
                          onTap: () {/* Do something */},
                        ),
                      ])),

              Container(
                margin: const EdgeInsets.all(10),
                child: FloatingActionButton(
                  backgroundColor: AppColors.green,
                  onPressed: () async {
                    if (!fileListChanged) {
                      await sendUpdateRequest(
                          _titleController.text, _descController.text);
                      Get.offAll(AdDashBoard());
                    } else {
                      await sendUpdateRequestWithFile(_titleController.text,
                          _descController.text, fileController.getFiles);
                      Get.offAll(AdDashBoard());
                    }
                  },
                  child: Icon(Icons.done),
                ),
              ),
              // Add more buttons here
            ],
          ),
        ));
  }

  sendUpdateRequest(title, desc) async {
    var requestNoticeUpdate = RequestNoticeUpdate();

    requestNoticeUpdate.platform_type = WebConfig.platformType;
    requestNoticeUpdate.platform_key = WebConfig.platformKey;
    requestNoticeUpdate.user_id = UserInfo.userId;
    requestNoticeUpdate.user_session = UserInfo.userSession;
    requestNoticeUpdate.scene_id = UserInfo.sceneId;
    requestNoticeUpdate.scene_ids = '["${UserInfo.sceneId}"]';
    requestNoticeUpdate.notice_json = noticeJson.toJson().toString();
    requestNoticeUpdate.notice_text = desc;
    var now = DateTime.now();
    requestNoticeUpdate.reg_date =
        '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}';
    requestNoticeUpdate.notice_title = title;
    requestNoticeUpdate.receiver_type = "전체";
    requestNoticeUpdate.notice_id = Get.arguments['noticeId'];
    requestNoticeUpdate.receiver_ids = [null];
    requestNoticeUpdate.user_name = UserInfo.ID;
    requestNoticeUpdate.notice_receiver_str = null;

    await Repository.updateNoticeDetail(
        title, desc, requestNoticeUpdate.toJson());
  }

  sendUpdateRequestWithFile(title, desc, files) async {
    var requestNoticeUpdate = RequestNoticeUpdate();

    List<JsonFile> _fileData = List<JsonFile>.empty(growable: true);
    var fileDataList = [];

    if (detailData.fileData != null) {
      print(detailData.fileData.length);
      detailData.fileData.forEach((element) {
        _fileData.add(JsonFile.init(element['seq_no'], element['file_url'],
            element['order_no'], element['file_name'], element['notice_file']));
      });
      _fileData.forEach((element) {
        fileDataList.add(element.toJson());
      });
    }

    var isFileExist = files.length >= 1 ? true : false;
    var index = 1;
    if (isFileExist) {
      print(
          "#################################################################");
      await Future.forEach(files, (File element) async {
        Uint8List bytes = element.readAsBytesSync();
        await noticeFile.addFile2List2(
            bytes, basename(element.path).split(',')[0]);
        // noticeJson.addInsert(index, basename(element.path).split(',')[0]);
        noticeJson.addInsert(index, "NOTICE");
        // index += 1;
      });
    }

    requestNoticeUpdate.platform_type = WebConfig.platformType;
    requestNoticeUpdate.platform_key = WebConfig.platformKey;
    requestNoticeUpdate.user_id = UserInfo.userId;
    requestNoticeUpdate.user_session = UserInfo.userSession;
    requestNoticeUpdate.scene_id = UserInfo.sceneId;
    requestNoticeUpdate.scene_ids = '[${UserInfo.sceneId}]';
    requestNoticeUpdate.notice_json = noticeJson.toJson().toString();
    requestNoticeUpdate.notice_text = desc;
    var now = DateTime.now();
    requestNoticeUpdate.reg_date =
        '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}';
    requestNoticeUpdate.notice_title = title;
    requestNoticeUpdate.receiver_type = "전체";
    requestNoticeUpdate.notice_id = Get.arguments['noticeId'];
    requestNoticeUpdate.file_data = jsonEncode(fileDataList);
    requestNoticeUpdate.notice_file = noticeFile.getFileList();
    requestNoticeUpdate.receiver_ids = [];
    requestNoticeUpdate.notice_receiver_data =
        '{"company_ids": null, "company_data": null}';
    requestNoticeUpdate.user_name = UserInfo.ID;
    requestNoticeUpdate.notice_receiver_str = null;
    await Repository.updateNoticeDetailWithFile(
        title, desc, requestNoticeUpdate.toJson());
  }
}

class JsonFile {
  var seq_no;
  var file_url;
  var order_no;
  var file_name;
  var notice_file;

  JsonFile.init(seqNo, fileUrl, orderNo, fileName, noticeFile)
      : seq_no = seqNo,
        file_url = fileUrl,
        order_no = orderNo,
        file_name = fileName,
        notice_file = noticeFile {}

  Map<String, dynamic> toJson() => {
        'seq_no': seq_no,
        'file_url': file_url,
        'order_no': order_no,
        'file_name': file_name,
        'notice_file': notice_file,
      };
}

class FileController extends GetxController {
  List<File> _files = List<File>.empty(growable: true);

  List<String> _title = List<String>.empty(growable: true);

  List<String> get title => _title;

  List<File>? get getFiles => _files;

  set files(List<File> value) {
    _files = value;
    update();
  }

  addFile(title, file) {
    fileListChanged = true;
    _title.add(title);
    _files.add(file);
    update();
  }

  removeFile(index) {
    fileListChanged = true;
    _files.removeAt(index);
    _title.removeAt(index);
    update();
    print(_files);
  }
}

class RequestNoticeUpdate {
  var _platform_type;
  var _platform_key;
  var _user_id;
  var _user_session;
  var _scene_id;
  var _scene_ids;
  var _notice_file;
  var _notice_json;
  var _notice_text;
  var _reg_date;
  var _notice_title;
  var _receiver_type;
  var _notice_id;
  var _file_data;
  var _receiver_ids;
  var _company_ids;
  var _notice_receiver_data;
  var _user_name;
  var _notice_receiver_str;

  Map<String, dynamic> toJson() => {
        'platform_type': _platform_type,
        'platform_key': _platform_key,
        'user_id': _user_id,
        'user_session': _user_session,
        'scene_id': _scene_id,
        'scene_ids': _scene_ids,
        'notice_file': _notice_file,
        'notice_json': _notice_json,
        'notice_text': _notice_text,
        'reg_date': _reg_date,
        'notice_title': _notice_title,
        'receiver_type': _receiver_type,
        'notice_id': _notice_id,
        'file_data': _file_data,
        'receiver_ids': _receiver_ids,
        'company_ids': _company_ids,
        'notice_receiver_data': _notice_receiver_data,
        'user_name': _user_name,
        'notice_receiver_str': _notice_receiver_str,
      };

  get platform_type => _platform_type;

  set platform_type(value) {
    _platform_type = value;
  }

  get platform_key => _platform_key;

  get notice_receiver_str => _notice_receiver_str;

  set notice_receiver_str(value) {
    _notice_receiver_str = value;
  }

  get user_name => _user_name;

  set user_name(value) {
    _user_name = value;
  }

  get notice_receiver_data => _notice_receiver_data;

  set notice_receiver_data(value) {
    _notice_receiver_data = value;
  }

  get company_ids => _company_ids;

  set company_ids(value) {
    _company_ids = value;
  }

  get receiver_ids => _receiver_ids;

  set receiver_ids(value) {
    _receiver_ids = value;
  }

  get file_data => _file_data;

  set file_data(value) {
    _file_data = value;
  }

  get notice_id => _notice_id;

  set notice_id(value) {
    _notice_id = value;
  }

  get receiver_type => _receiver_type;

  set receiver_type(value) {
    _receiver_type = value;
  }

  get notice_title => _notice_title;

  set notice_title(value) {
    _notice_title = value;
  }

  get reg_date => _reg_date;

  set reg_date(value) {
    _reg_date = value;
  }

  get notice_text => _notice_text;

  set notice_text(value) {
    _notice_text = value;
  }

  get notice_json => _notice_json;

  set notice_json(value) {
    _notice_json = value;
  }

  get notice_file => _notice_file;

  set notice_file(value) {
    _notice_file = value;
  }

  get scene_ids => _scene_ids;

  set scene_ids(value) {
    _scene_ids = value;
  }

  get scene_id => _scene_id;

  set scene_id(value) {
    _scene_id = value;
  }

  get user_session => _user_session;

  set user_session(value) {
    _user_session = value;
  }

  get user_id => _user_id;

  set user_id(value) {
    _user_id = value;
  }

  set platform_key(value) {
    _platform_key = value;
  }
}

class DetailData {
  var _title;
  var receiver = List<dynamic>.empty(growable: true);
  var files = List<dynamic>.empty(growable: true);
  var _author;
  var _company;
  var _writeAt;
  var _content;
  var _fileData;

  get fileData => _fileData;

  set fileData(value) {
    _fileData = value;
  }

  get company => _company;

  set company(value) {
    _company = value;
  }

  get title => _title;

  set title(value) {
    _title = value;
  }

  get author => _author;

  set author(value) {
    _author = value;
  }

  get writeAt => _writeAt.toString().substring(0, 10);

  set writeAt(value) {
    _writeAt = value;
  }

  get content => _content;

  set content(value) {
    _content = value;
  }
}
