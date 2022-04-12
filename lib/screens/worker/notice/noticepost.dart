import 'dart:io';
import 'dart:typed_data';
import 'package:beitflutter/config/userinfo.dart';
import 'package:beitflutter/config/webconfig.dart';
import 'package:beitflutter/data/common.dart';
import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/beit_text_style.dart';
import 'package:beitflutter/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'notice.dart';

class NoticePost extends StatefulWidget {
  const NoticePost({Key? key}) : super(key: key);

  @override
  _NoticePostState createState() => _NoticePostState();
}

class _NoticePostState extends State<NoticePost> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  late final String path;
  var fileController = Get.put(FileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setPath();
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
          title: Text("공지사항 등록"),
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
                      return fileController.getFiles == null
                          ? Container(
                              padding: EdgeInsets.all(15), child: Text("파일 없음"))
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: fileController.getFiles!.length,
                              itemBuilder: (context, index) {
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
                              fileController.title.add(element.path);
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
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {

                      if (fileController.getFiles == null) {
                        await sendPostRequest(
                            _titleController.text, _descController.text);
                      } else {
                        await sendPostRequestWithFile(_titleController.text,
                            _descController.text, fileController.getFiles!);
                      }
                      Get.off(Notice());
                    }
                  },

                  backgroundColor: AppColors.green,
                  child: Icon(Icons.done),
                )),
            // Add more buttons here
          ],
        ),
      ),
    );
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

  sendPostRequest(title, desc) async {
    var requestNoticePost = RequestNoticePost();

    var noticeFile = UserFile();
    var noticeJson = UserJson();

    requestNoticePost.platform_type = WebConfig.platformType;
    requestNoticePost.platform_key = WebConfig.platformKey;
    requestNoticePost.user_id = UserInfo.userId;
    requestNoticePost.user_session = UserInfo.userSession;
    requestNoticePost.scene_id = UserInfo.sceneId;
    requestNoticePost.scene_ids = '["${UserInfo.sceneId}"]';
    requestNoticePost.notice_json = noticeJson.toJson().toString();
    requestNoticePost.notice_text = desc;
    var now = DateTime.now();
    requestNoticePost.reg_date =
        '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}';
    requestNoticePost.notice_title = title;
    requestNoticePost.receiver_type = "전체";
    requestNoticePost.user_name = UserInfo.ID;
    requestNoticePost.notice_file = noticeFile.getFileList();

    await Repository.postNoticeDetail(title, desc, requestNoticePost.toJson());
  }

  sendPostRequestWithFile(title, desc, List<File> files) async {
    var requestNoticePost = RequestNoticePost();

    var noticeFile = UserFile();
    var noticeJson = UserJson();

    var isFileExist = files.length >= 1 ? true : false;
    var index = 1;
    if (isFileExist) {
      await Future.forEach(files, (File element) async {
        print(element);
        Uint8List bytes = element.readAsBytesSync();
        await noticeFile.addFile2List2(
            bytes, basename(element.path).split(',')[0]);
        noticeJson.addInsert(index, basename(element.path).split(',')[0]);
        index += 1;
      });
    }
    requestNoticePost.platform_type = WebConfig.platformType;
    requestNoticePost.platform_key = WebConfig.platformKey;
    requestNoticePost.user_id = UserInfo.userId;
    requestNoticePost.user_session = UserInfo.userSession;
    requestNoticePost.scene_id = UserInfo.sceneId;
    requestNoticePost.scene_ids = '["${UserInfo.sceneId}"]';
    requestNoticePost.notice_json = noticeJson.toJson().toString();
    requestNoticePost.notice_text = desc;
    var now = DateTime.now();
    requestNoticePost.reg_date = '${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}';
    requestNoticePost.notice_title = title;
    requestNoticePost.receiver_type = "전체";
    requestNoticePost.user_name = UserInfo.ID;
    requestNoticePost.notice_file = noticeFile.getFileList();

    print(requestNoticePost.toJson());
    EasyLoading.show(status: 'loading...');
    await Repository.postRequestWithFile(title, desc, files, requestNoticePost.toJson());
    EasyLoading.dismiss();
  }
}

class FileController extends GetxController {
  List<File>? _files;

  List<String> _title = List<String>.empty(growable: true);

  List<String> get title => _title;

  set title(List<String> value) {
    _title = value;
  }

  List<File>? get getFiles => _files;

  set files(List<File> value) {
    _files = value;
    update();
  }

  removeFile(index) {
    _files?.removeAt(index);
    _title.removeAt(index);
    update();
  }
}
class RequestNoticePost{
  var _platform_type;
  var _platform_key;
  var _user_id;
  var _user_session;
  var _scene_id;
  var _scene_ids;
  var _notice_file;
  var _notice_json;
  var _notice_text;
  var _notice_title;
  var _reg_date;
  var _receiver_type;
  var _user_name;

  Map<String, dynamic> toJson() => {
    'platform_type': _platform_type,
    'platform_key': _platform_key,
    'user_id': _user_id,
    'user_session': _user_session,
    'scene_id': _scene_id,
    'scene_ids': _scene_ids,
    'notice_json': _notice_json,
    "notice_text": _notice_text,
    "reg_date": _reg_date,
    "notice_title": _notice_title,
    "receiver_type": _receiver_type,
    "user_name": _user_name,
    "notice_file": _notice_file,
  };

  get notice_title => _notice_title;

  set notice_title(value) {
    _notice_title = value;
  }

  get user_name => _user_name;

  set user_name(value) {
    _user_name = value;
  }

  get platform_type => _platform_type;

  set platform_type(value) {
    _platform_type = value;
  }

  get platform_key => _platform_key;

  set platform_key(value) {
    _platform_key = value;
  }

  get user_id => _user_id;

  set user_id(value) {
    _user_id = value;
  }

  get user_session => _user_session;

  set user_session(value) {
    _user_session = value;
  }

  get scene_id => _scene_id;

  set scene_id(value) {
    _scene_id = value;
  }

  get scene_ids => _scene_ids;

  set scene_ids(value) {
    _scene_ids = value;
  }

  get notice_file => _notice_file;

  set notice_file(value) {
    _notice_file = value;
  }

  get notice_json => _notice_json;

  set notice_json(value) {
    _notice_json = value;
  }

  get notice_text => _notice_text;

  set notice_text(value) {
    _notice_text = value;
  }

  get reg_date => _reg_date;

  set reg_date(value) {
    _reg_date = value;
  }

  get receiver_type => _receiver_type;

  set receiver_type(value) {
    _receiver_type = value;
  }

}
