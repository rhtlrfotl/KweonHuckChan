import 'dart:io';
import 'dart:typed_data';
import 'package:beitflutter/config/userinfo.dart';
import 'package:beitflutter/config/webconfig.dart';
import 'package:beitflutter/data/common.dart';
import 'package:beitflutter/screens/worker/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/widgets/custom_button.dart';
import 'package:beitflutter/widgets/custom_formfield.dart';
import 'package:beitflutter/widgets/custom_richtext.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:hand_signature/signature.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../DashBoard.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  sendFormData() async {
    try {
      var requestSignUp = RequestSignUp();
      requestSignUp.auth_id = ID;
      requestSignUp.auth_token = passwordConfirm;
      requestSignUp.auth_type = 1;
      requestSignUp.company_data =
          Get.find<SignUpDataController>().toJsonCompanyList().toString();
      requestSignUp.privacy_state = true;
      requestSignUp.user_birthday = "1999-01-01";
      requestSignUp.user_safe_date = "1999-01-01";
      requestSignUp.user_name = userName;
      requestSignUp.user_phone = phoneumber;
      var customUserFile = UserFile();
      final path = _image!.path;
      final bytes = await File(path).readAsBytes();
      await customUserFile.addFile2List2(bytes, _image!.name);
      await customUserFile.addFile2List(rawImageFit, "sign(fiexedNameFromFlutter)");
      requestSignUp.user_file = customUserFile.getFileList();
      var customUserJson = UserJson();
      customUserJson.addInsert(1, "profile");
      customUserJson.addInsert(2, "sign");
      requestSignUp.user_json = customUserJson.toJson().toString();
      var formData = Dio.FormData.fromMap(requestSignUp.toJson());
      var dio = Dio.Dio();
      var response = await dio.post(
          WebConfig.host + '/ui/signUp/Insert_UserInfo_User',
          data: formData,
          options:
              Dio.Options(contentType: Dio.Headers.formUrlEncodedContentType));
      print(response);
      if (response.data['rsMsg'] == "성공") {
        signIn(ID, password);
      } else {
        Get.defaultDialog(
            title: 'Dialog', middleText: '${response.data['rsMsg']}');
      }
    } catch (e) {
      print(e);
    }
  }

  Uint8List asUint8List(ByteBuffer buffer, ByteData byteData) {
    return buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
  }

  var signUpDataController = Get.put(SignUpDataController());
  var prefs;

  final _formKey = GlobalKey<FormState>();
  final _IDController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _userNameController = TextEditingController();

  String get userName => _userNameController.text.trim();
  String get ID => _IDController.text.trim();
  String get password => _passwordController.text.trim();
  String get passwordConfirm => _passwordConfirmController.text.trim();
  String get phoneumber => _phoneNumberController.text.trim();

  late var _passwordVisible, _passwordConfirmVisible;

  bool _isRadioSelected = false;

  ValueNotifier<ByteData?> rawImage = ValueNotifier<ByteData?>(null);
  ValueNotifier<ByteData?> rawImageFit = ValueNotifier<ByteData?>(null);

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future _getImage() async {
    // PickedFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image!;
    });
  }

  Future _getImageFromCam() async {
    // PickedFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image!;
    });
  }
  Future _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScene(0);
    _passwordVisible = false;
    _passwordConfirmVisible = false;
  }

  getScene(int i) async {
    prefs = await SharedPreferences.getInstance();
    var sceneId = await getCategorySceneList(i);
    await getCategoryCompanyList(sceneId, i);
    await getCategoryTypeOfWorkList(sceneId, i);
    await getCategoryOccupationList(sceneId, i);
  }

  Future<void> foo() async {
    print('foo started');
    await Future.delayed(Duration(seconds: 3));
    return;
  }

  HandSignatureControl handSignatureControl = new HandSignatureControl(
    threshold: 0.01,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
        backgroundColor: AppColors.green,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        // child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09),
                  child: Image.asset("assets/images/loginGreen.png"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        style: beitButtonStyle.green,
                        onPressed: () {
                          _IDController.text = "testUser02";
                          _passwordController.text = "123456";
                          _passwordConfirmController.text = "123456";
                          _phoneNumberController.text = "01011111234";
                          _userNameController.text = "testUser02";
                        },
                        child: Text("auto(worker)")),
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      _getImageFromCam();
                    },
                    child: Icon(Icons.camera_alt_outlined),
                  ),
                  width: double.infinity,
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      _getImageFromGallery();
                    },
                    child: Icon(Icons.photo_camera_back),
                  ),
                  width: double.infinity,
                  height: 50,
                ),

                Center(
                  child: _image == null
                      ? Text('No image selected.')
                      : Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                        // borderRadius: BorderRadius.circular(25),
                      ),
                          width: Get.width / 1.2,
                          height: 200,
                          child: FittedBox(

                              fit: BoxFit.contain,
                              child: Image.file(File(_image!.path)))),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  headingText: "ID",
                  hintText: "아이디를 입력하세요",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  controller: _IDController,
                  onChanged: (val){},
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  controller: _passwordController,
                  headingText: "Password",
                  hintText: "비밀번호를 입력해주세요.",
                  obsecureText: !_passwordVisible,
                  onChanged: (val){},
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  controller: _passwordConfirmController,
                  headingText: "Password Confirm",
                  hintText: "비밀번호를 입력해주세요.",
                  obsecureText: !_passwordConfirmVisible,
                  onChanged: (val){
                    print("${val} ===== ${_passwordController.text.trim()}");
                  },
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _passwordConfirmVisible = !_passwordConfirmVisible;
                        });
                      }),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                    onChanged: (val){},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    obsecureText: false,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _phoneNumberController,
                    headingText: "Phone",
                    hintText: "휴대폰 번호를 입력해주세요.",
                    suffixIcon: const SizedBox()),

                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                    onChanged: (val){},
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    obsecureText: false,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    controller: _userNameController,
                    headingText: "성명",
                    hintText: "이름을 입력해주세요.",
                    suffixIcon: const SizedBox()),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: ElevatedButton(
                      style: beitButtonStyle.green,
                      onPressed: () {
                        Get.dialog(
                          Dialog(
                              child: Container(
                            color: Colors.black45,
                            width: Get.width,
                            height: Get.height * 0.5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Draw your signature!"),
                                // Text("아래칸에 서명해주세요.회원가입 시 기입한 서명은 서약서, \n건강문진표 등 작성 동의 시에도 적용됩니다."),
                                Container(
                                  width: Get.width * 0.7,
                                  height: Get.height * 0.3,
                                  color: Colors.white,
                                  child: HandSignaturePainterView(
                                    control: handSignatureControl,
                                    type: SignatureDrawType.shape,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        handSignatureControl.clear();
                                      },
                                      child: Text("삭제"),
                                      style: beitButtonStyle.green,
                                    ),
                                    ElevatedButton(
                                        onPressed: () async {
                                          rawImage.value =
                                              await handSignatureControl
                                                  .toImage(
                                            color: Colors.black,
                                            background: Colors.white,
                                            fit: false,
                                          );
                                          rawImageFit.value =
                                              await handSignatureControl.toImage(
                                                  // color: Colors.blueAccent,
                                                  // background: Colors.greenAccent,
                                                  );
                                          Get.back();
                                        },
                                        child: Text("확인"),
                                        style: beitButtonStyle.green)
                                  ],
                                ),
                              ],
                            ),
                          )),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Text("서명",
                            style: TextStyle(backgroundColor: AppColors.green)),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: _buildImageView(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 35,
                    right: 20,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          int index =
                              signUpDataController.plusCompanyDataCount();
                          getScene(index);
                        },
                        child: Icon(Icons.add),
                        style: beitButtonStyle.green,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signUpDataController.minusCompanyDataCount();
                        },
                        child: Icon(Icons.remove),
                        style: beitButtonStyle.green,
                      ),
                      Container(
                        width: 160,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text("* 현장, 업체, 공종, 직종 추가"),
                        ),
                      )
                    ],
                  ),
                ),
                GetBuilder<SignUpDataController>(
                  builder: (_) {
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _.companyDataList.length,
                        itemBuilder: (context, index) {
                          return GFAccordion(
                            title: "현장 ${index + 1} (필수항목)",
                            contentChild: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      LabeledRadio(
                                        label: '대표',
                                        value: false,
                                        groupValue: _isRadioSelected,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            _isRadioSelected = newValue;
                                          });
                                        },
                                      ),
                                      LabeledRadio(
                                        label: '일반',
                                        value: true,
                                        groupValue: _isRadioSelected,
                                        onChanged: (bool newValue) {
                                          setState(() {
                                            _isRadioSelected = newValue;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment(-1, 0),
                                          height: 50,
                                          // color: Colors.red,
                                          child: Text("현장\nsite"),
                                        ),
                                        DropdownButton(
                                          value: signUpDataController
                                              .companyDataList[index]
                                              .selectedSite,
                                          items: signUpDataController
                                              .companyDataList[index].siteList
                                              .map(
                                            (value) {
                                              return DropdownMenuItem(
                                                  value:
                                                      value['name'].toString(),
                                                  child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      width: 180,
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          value['name'],
                                                        ),
                                                      )));
                                            },
                                          ).toList(),
                                          onChanged: (value) async {
                                            print(value);
                                            var findScene = signUpDataController
                                                .companyDataList[index].siteList
                                                .firstWhere((element) =>
                                                    element['name'] == value);
                                            await getCategoryCompanyList(
                                                findScene['scene_id'], index);
                                            await getCategoryTypeOfWorkList(
                                                findScene['scene_id'], index);
                                            await getCategoryOccupationList(
                                                findScene['scene_id'], index);
                                            signUpDataController
                                                .setSelectedSite(
                                                    index, value.toString());
                                            signUpDataController
                                                .setSelectedSiteID(index,
                                                    findScene['scene_id']);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment(-1, 0),
                                          height: 50,
                                          child: Text("업체명\nCompany"),
                                        ),
                                        DropdownButton(
                                          value: signUpDataController
                                              .companyDataList[index]
                                              .selectedCompany,
                                          items: signUpDataController
                                              .companyDataList[index]
                                              .companyList
                                              .map(
                                            (value) {
                                              return DropdownMenuItem(
                                                  value: value['name'],
                                                  child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      width: 180,
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          value['name'],
                                                        ),
                                                      )));
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            var findCompany =
                                                signUpDataController
                                                    .companyDataList[index]
                                                    .companyList
                                                    .firstWhere((element) =>
                                                        element['name'] ==
                                                        value);
                                            signUpDataController
                                                .setSelectedCompanyID(index,
                                                    findCompany['company_id']);
                                            signUpDataController
                                                .setSelectedCompany(
                                                    index, value.toString());
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment(-1, 0),
                                          height: 50,
                                          // color: Colors.red,
                                          child: Text("공종\nType of Work"),
                                        ),
                                        DropdownButton(
                                          value: signUpDataController
                                              .companyDataList[index]
                                              .selectedTypeOfWork,
                                          items: signUpDataController
                                              .companyDataList[index]
                                              .typeofWorkList
                                              .map(
                                            (value) {
                                              return DropdownMenuItem(
                                                value: value['name'],
                                                child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    width: 180,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        value['name'],
                                                      ),
                                                    )),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            var findTypeOfWork =
                                                signUpDataController
                                                    .companyDataList[index]
                                                    .typeofWorkList
                                                    .firstWhere((element) =>
                                                        element['name'] ==
                                                        value);
                                            signUpDataController
                                                .setSelectedTypeOfWorkID(
                                                    index,
                                                    findTypeOfWork[
                                                        'ctgo_construction_id']);
                                            signUpDataController
                                                .setSelectedTypeOfWork(
                                                    index, value.toString());
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          alignment: Alignment(-1, 0),
                                          height: 50,
                                          // color: Colors.red,
                                          child: Text("직종\nOccupation"),
                                        ),
                                        DropdownButton(
                                          value: signUpDataController
                                              .companyDataList[index]
                                              .selectedOccupation,
                                          items: signUpDataController
                                              .companyDataList[index]
                                              .occupationList
                                              .map(
                                            (value) {
                                              return DropdownMenuItem(
                                                value: value['name'],
                                                child: Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    width: 180,
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        value['name'],
                                                      ),
                                                    )),
                                              );
                                            },
                                          ).toList(),
                                          onChanged: (value) {
                                            var findOccupation =
                                                signUpDataController
                                                    .companyDataList[index]
                                                    .occupationList
                                                    .firstWhere((element) =>
                                                        element['name'] ==
                                                        value);
                                            signUpDataController
                                                .setSelectedOccupationID(
                                                    index,
                                                    findOccupation[
                                                        'ctgo_occupation_id']);
                                            signUpDataController
                                                .setSelectedOccupation(
                                                    index, value.toString());
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(
                  height: 16,
                ),
                AuthButton(
                  onTap: () {
                    _IDController.text = ID;
                    _passwordController.text = password;
                    _passwordConfirmController.text = passwordConfirm;
                    _phoneNumberController.text = phoneumber;
                    _userNameController.text = userName;
                    // signUp(userName,ID,password);
                    if (_formKey.currentState!.validate()) {
                      if (rawImage.value == null) return Get.defaultDialog(title: 'Dialog', middleText: '서명하세요');
                      if(_image == null) return Get.defaultDialog(title: 'Dialog', middleText: '프로필 사진 없음');
                      if(password != passwordConfirm) return Get.defaultDialog(title: 'Dialog', middleText: '비밀번호가 다릅니다');
                      sendFormData();
                    }
                  },
                  text: '근로자 회원가입',
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: CustomRichText(
                      discription: 'Already Have an account? ',
                      text: 'Log In here',
                      onTap: () {
                        Get.to(() => SignIn(), transition: Transition.fadeIn);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                // ElevatedButton(onPressed: (){_onLoading();}, child: Text("HI"), style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(AppColors.green)))
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }

  // void signIn() async {
  //   var dio = Dio.Dio();
  //   try {
  //     var response = await dio.post(
  //         WebConfig.host + "/ui/signUp/Check_UserLogin",
  //         queryParameters: {
  //           'auth_id': ID,
  //           'auth_token': password,
  //           'auth_type': 1,
  //           'platform_key': WebConfig.platformKey,
  //           'platform_type': WebConfig.platformType
  //         });
  //     var loginStatus = response.data['rsMsg'] == "성공" ? true : false;
  //     if (loginStatus) {
  //       await prefs.setInt('user_id', response.data['rsObj']['user_data']['user_data']['user_id']);
  //       await prefs.setString('user_session', response.data['rsObj']['user_data']['user_session']);
  //       UserInfo.ID = response.data['rsObj']['user_data']['user_data']['auth_id'];
  //       UserInfo.userName = response.data['rsObj']['user_data']['user_data']['user_name'];
  //       UserInfo.sceneId = response.data['rsObj']['user_data']['user_main_company']['scene_id'];
  //       UserInfo.sceneName = response.data['rsObj']['user_data']['user_main_company']['scene_name'];
  //       UserInfo.company = response.data['rsObj']['user_data']['user_main_company']['company_name'];
  //       print(UserInfo.userId);
  //       print(UserInfo.userSession);
  //       print("info : ${UserInfo.userId} / ${UserInfo.userSession} / ${UserInfo.ID} / ${UserInfo.password} / ${UserInfo.company}");
  //       Get.offAll(() => DashBoard());
  //     } else {
  //       Get.defaultDialog(
  //           title: 'Dialog', middleText: '${response.data['rsMsg']}');
  //     }
  //   } on Dio.DioError catch (e) {
  //     print(e);
  //   }
  // }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Center(
            child: new CircularProgressIndicator(),
          ),
        );
      },
    );
    // new Future.delayed(new Duration(seconds: 3), () {
    //   Navigator.pop(context); //pop dialog
    // });
  }

  getCategorySceneList(int index) async {
    signUpDataController.companyDataList[index].siteList.clear();
    var dio = Dio.Dio();
    try {
      var response = await dio.post(
          WebConfig.host + "/ctgo/Get_CtgoScene_List_Sign",
          data: {"platform_type": 3});
      response.data['rsMap'].forEach((value) {
        signUpDataController.companyDataList[index].siteList
            .add({"name": value['scene_name'], "scene_id": value['scene_id']});
      });

      signUpDataController.companyDataList[index].scene_id =
          signUpDataController.companyDataList[index].siteList[0]['scene_id'];
      signUpDataController.companyDataList[index].selectedSite =
          signUpDataController.companyDataList[index].siteList[0]['name'];
      signUpDataController.updateList();

      return signUpDataController.companyDataList[index].siteList[index]
          ['scene_id'];
    } on Dio.DioError catch (e) {
      print(e);
    }
  }

  getCategoryCompanyList(int sceneId, int index) async {
    print("get Category Company List");
    signUpDataController.companyDataList[index].companyList.clear();
    var dio = Dio.Dio();
    try {
      var response = await dio.post(
          WebConfig.host + '/ctgo/Get_CtgoCompany_List_Sign',
          data: Dio.FormData.fromMap({
            "platform_type": WebConfig.platformType,
            "platform_key": WebConfig.platformKey,
            "user_id": -1,
            "scene_id": sceneId
          }),
          options:
              Dio.Options(contentType: Dio.Headers.formUrlEncodedContentType));
      if (response.data['rsMap'].length <= 0) return;
      response.data['rsMap'].forEach((value) {
        signUpDataController.companyDataList[index].companyList.add(
            {"name": value['company_name'], "company_id": value['company_id']});
      });

      signUpDataController.companyDataList[index].company_id =
          signUpDataController.companyDataList[index].companyList[0]
              ['company_id'];
      signUpDataController.companyDataList[index].selectedCompany =
          signUpDataController.companyDataList[index].companyList[0]['name'];
      signUpDataController.updateList();
    } on Dio.DioError catch (e) {
      print(e);
    }
  }

  getCategoryTypeOfWorkList(int sceneId, int index) async {
    print("get Category Type of Work List");
    signUpDataController.companyDataList[index].typeofWorkList.clear();
    var dio = Dio.Dio();
    try {
      var response = await dio.post(
          WebConfig.host + '/ctgo/Get_CtgoConstruction_List',
          data: Dio.FormData.fromMap({
            "platform_type": WebConfig.platformType,
            "platform_key": WebConfig.platformKey,
            "user_id": -1,
            "scene_id": sceneId
          }),
          options:
              Dio.Options(contentType: Dio.Headers.formUrlEncodedContentType));
      // print(response.data);
      if (response.data['rsMap'].length <= 0) return;
      response.data['rsMap'].forEach((value) {
        signUpDataController.companyDataList[index].typeofWorkList.add({
          "name": value['ctgo_construction_name'],
          "ctgo_construction_id": value['ctgo_construction_id']
        });
      });

      signUpDataController.companyDataList[index].ctgo_construction_id =
          signUpDataController.companyDataList[index].typeofWorkList[0]
              ['ctgo_construction_id'];
      signUpDataController.companyDataList[index].selectedTypeOfWork =
          signUpDataController.companyDataList[index].typeofWorkList[0]['name'];
      signUpDataController.updateList();
    } on Dio.DioError catch (e) {
      print(e);
    }
  }

  getCategoryOccupationList(int sceneId, int index) async {
    print("get Category Occupation List");
    signUpDataController.companyDataList[index].occupationList.clear();
    var dio = Dio.Dio();
    try {
      var response = await dio.post(
          WebConfig.host + '/ctgo/Get_CtgoOccupation_List',
          data: Dio.FormData.fromMap({
            "platform_type": WebConfig.platformType,
            "platform_key": WebConfig.platformKey,
            "user_id": -1,
            "scene_id": sceneId
          }),
          options:
              Dio.Options(contentType: Dio.Headers.formUrlEncodedContentType));
      if (response.data['rsMap'].length <= 0) return;
      response.data['rsMap'].forEach((value) {
        signUpDataController.companyDataList[index].occupationList.add({
          "name": value['ctgo_occupation_name'],
          "ctgo_occupation_id": value['ctgo_occupation_id']
        });
      });
      signUpDataController.companyDataList[index].ctgo_occupation_id =
          signUpDataController.companyDataList[index].occupationList[0]
              ['ctgo_occupation_id'];
      signUpDataController.companyDataList[index].selectedOccupation =
          signUpDataController.companyDataList[index].occupationList[0]['name'];
      signUpDataController.updateList();
    } on Dio.DioError catch (e) {
      print(e);
    }
  }

  Widget _buildImageView() => Container(
        width: Get.width / 1.5,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white30,
        ),
        child: ValueListenableBuilder<ByteData?>(
          valueListenable: rawImageFit,
          builder: (context, data, child) {
            if (data == null) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text('not signed yet'),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.memory(data.buffer.asUint8List()),
              );
            }
          },
        ),
      );
  Widget _buildScaledImageView() => Container(
        width: 192.0,
        height: 96.0,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white30,
        ),
        child: ValueListenableBuilder<ByteData?>(
          valueListenable: rawImageFit,
          builder: (context, data, child) {
            if (data == null) {
              return Container(
                color: Colors.white,
                child: Center(
                  child: Text('not signed yet (png)\nscaleToFill: true'),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.memory(data.buffer.asUint8List()),
              );
            }
          },
        ),
      );
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final bool groupValue;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Row(
        children: <Widget>[
          Radio<bool>(
            groupValue: groupValue,
            value: value,
            onChanged: (bool? newValue) {
              onChanged(newValue!);
            },
          ),
          Text(label),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("logged in"),
      ),
    );
  }
}


class SignUpDataController extends GetxController {
  List<CompanyData> companyDataList = List<CompanyData>.empty(growable: true);

  plusCompanyDataCount() {
    companyDataList.add(CompanyData());
    update();
    return companyDataList.length - 1;
  }

  minusCompanyDataCount() {
    if (companyDataList.length == 1) return;
    companyDataList.removeLast();
    update();
  }

  setSelectedSite(index,value){
    companyDataList[index].selectedSite = value;
    update();
  }
  setSelectedSiteID(index,value){
    companyDataList[index].scene_id = value;
    update();
  }

  setSelectedCompany(index,value){
    companyDataList[index].selectedCompany = value;
    update();
  }
  setSelectedCompanyID(index,value){
    companyDataList[index].company_id = value;
    update();
  }

  setSelectedTypeOfWork(index,value){
    companyDataList[index].selectedTypeOfWork = value;
    update();
  }
  setSelectedTypeOfWorkID(index,value){
    companyDataList[index].ctgo_construction_id = value;
    update();
  }

  setSelectedOccupation(index,value){
    companyDataList[index].selectedOccupation = value;
    update();
  }
  setSelectedOccupationID(index,value){
    companyDataList[index].ctgo_occupation_id = value;
    update();
  }

  SignUpDataController() {
    plusCompanyDataCount();
  }

  toJsonCompanyList() {
    var ll = companyDataList.map((e) => e.toJson()).toList();
    return ll;
  }

  updateList(){
    update();
  }
}

class RequestSignUp {
  String _auth_id = "";
  String _auth_token = "";
  int _auth_type = 0;
  String _company_data = "";
  int _ctgo_nation_id = 0;
  int _platform_key = 0;
  int _platform_type = 0;
  bool _privacy_state = false;
  String _user_birthday = "";
  bool _user_license_state = false;
  String _push_state = "ON";
  String _user_name = "";
  String _user_phone = "";
  String _user_safe_date = "";
  var _user_file;
  var _user_json;

  Map<String, dynamic> toJson() => {
    'auth_id': _auth_id,
    'auth_token': _auth_token,
    'auth_type': _auth_type,
    'company_data': _company_data,
    'ctgo_nation_id': _ctgo_nation_id,
    'platform_key': _platform_key,
    'platform_type': _platform_type,
    "privacy_state": _privacy_state,
    "user_birthday": _user_birthday,
    "user_license_state": _user_license_state,
    "push_state": _push_state,
    "user_name": _user_name,
    "user_phone": _user_phone,
    "user_safe_date": _user_safe_date,
    "user_file": _user_file,
    "user_json": _user_json,
  };

  get user_file => _user_file;

  set user_file(value) {
    _user_file = value;
  } // Map<String, dynamic> toMap() {
  //   return {"auth_id": _auth_id, "auth_token": _auth_token};
  // }

  String get auth_id => _auth_id;

  set auth_id(String value) {
    _auth_id = value;
  }

  String get auth_token => _auth_token;

  set auth_token(String value) {
    _auth_token = value;
  }

  int get auth_type => _auth_type;

  set auth_type(int value) {
    _auth_type = value;
  }

  String get company_data => _company_data;

  set company_data(String value) {
    _company_data = value;
  }

  int get ctgo_nation_id => _ctgo_nation_id;

  set ctgo_nation_id(int value) {
    _ctgo_nation_id = value;
  }

  int get platform_key => _platform_key;

  set platform_key(int value) {
    _platform_key = value;
  }

  int get platform_type => _platform_type;

  set platform_type(int value) {
    _platform_type = value;
  }

  bool get privacy_state => _privacy_state;

  set privacy_state(bool value) {
    _privacy_state = value;
  }

  String get user_birthday => _user_birthday;

  set user_birthday(String value) {
    _user_birthday = value;
  }

  bool get user_license_state => _user_license_state;

  set user_license_state(bool value) {
    _user_license_state = value;
  }

  String get push_state => _push_state;

  set push_state(String value) {
    _push_state = value;
  }

  String get user_name => _user_name;

  set user_name(String value) {
    _user_name = value;
  }

  String get user_phone => _user_phone;

  set user_phone(String value) {
    _user_phone = value;
  }

  String get user_safe_date => _user_safe_date;

  set user_safe_date(String value) {
    _user_safe_date = value;
  }

  get user_json => _user_json;

  set user_json(value) {
    _user_json = value;
  }
}

class CompanyData {
  var _scene_id;
  var _company_id;
  var _ctgo_construction_id;
  var _ctgo_occupation_id;
  var _main_state = true;

  List<dynamic> _siteList = [];
  List<dynamic> _companyList = [];
  List<dynamic> _typeofWorkList = [];
  List<dynamic> _occupationList = [];
  var _selectedSite;
  var _selectedCompany;
  var _selectedTypeOfWork;
  var _selectedOccupation;

  Map<String, dynamic> toJson() => {
    '"scene_id"': _scene_id,
    '"company_id"': _company_id,
    '"ctgo_construction_id"': _ctgo_construction_id,
    '"ctgo_occupation_id"': _ctgo_occupation_id,
    '"main_state"': _main_state,
  };

  CompanyData() {}

  CompanyData.init(this._scene_id, this._company_id, this._ctgo_construction_id,
      this._ctgo_occupation_id, this._main_state);


  List<dynamic> get siteList => _siteList;

  set siteList(List<dynamic> value) {
    _siteList = value;
  }

  get ctgo_occupation_id => _ctgo_occupation_id;

  set ctgo_occupation_id(value) {
    _ctgo_occupation_id = value;
  }

  get ctgo_construction_id => _ctgo_construction_id;

  set ctgo_construction_id(value) {
    _ctgo_construction_id = value;
  }

  get company_id => _company_id;

  set company_id(value) {
    _company_id = value;
  }

  get scene_id => _scene_id;

  set scene_id(value) {
    _scene_id = value;
  }

  get selectedOccupation => _selectedOccupation;

  set selectedOccupation(value) {
    _selectedOccupation = value;
  }

  get selectedTypeOfWork => _selectedTypeOfWork;

  set selectedTypeOfWork(value) {
    _selectedTypeOfWork = value;
  }

  get selectedCompany => _selectedCompany;

  set selectedCompany(value) {
    _selectedCompany = value;
  }

  get selectedSite => _selectedSite;

  set selectedSite(value) {
    _selectedSite = value;
  }

  List<dynamic> get companyList => _companyList;

  set companyList(List<dynamic> value) {
    _companyList = value;
  }

  List<dynamic> get typeofWorkList => _typeofWorkList;

  set typeofWorkList(List<dynamic> value) {
    _typeofWorkList = value;
  }

  List<dynamic> get occupationList => _occupationList;

  set occupationList(List<dynamic> value) {
    _occupationList = value;
  }
}