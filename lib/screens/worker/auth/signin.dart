import 'package:beitflutter/config/userinfo.dart';
import 'package:beitflutter/config/webconfig.dart';
import 'package:beitflutter/data/repository.dart';
import 'package:beitflutter/model/userStateModel.dart';
import 'package:beitflutter/screens/admin/adDashBoard.dart';
import 'package:beitflutter/screens/worker/DashBoard.dart';
import 'package:beitflutter/screens/worker/auth/signup.dart';

import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/button_style.dart';
import 'package:beitflutter/widgets/custom_button.dart';
import 'package:beitflutter/widgets/custom_formfield.dart';
import 'package:beitflutter/widgets/custom_richtext.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/globalVariable.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

var prefs;

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _IDController = TextEditingController();
  final _passwordController = TextEditingController();

  String _ID = '';
  String _password = '';

  String get ID => _ID;
  set ID(String value) {
    _ID = value;
  }

  String get password => _password;
  set password(String value) {
    _password = value;
  }

  @override
  void initState() {
    super.initState();
    WebConfig.makePlatfromKey();
    checkIsUserLoggedIn();
  }

  checkIsUserLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    UserInfo.ID = prefs.getString('ID') ?? '';
    UserInfo.password = prefs.getString('password') ?? '';
    if (!UserInfo.ID.isEmpty && !UserInfo.password.isEmpty) {
      print("logged in user");
      signIn(UserInfo.ID, UserInfo.password);
    } else {
      print("should log in ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
        backgroundColor: AppColors.green,
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(child: Text('Tag Read'), onPressed: () {}),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.09),
                  child: Image.asset("assets/images/loginGreen.png"),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomFormField(
                  onChanged: (val) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  headingText: "ID",
                  hintText: "ID",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  controller: _IDController,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  onChanged: (val) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  headingText: "Password",
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: "At least 4 Character",
                  obsecureText: true,
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.visibility), onPressed: () {}),
                  controller: _passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: InkWell(
                        onTap: () {
                          // Get.offAll(DashBoard());
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: AppColors.green.withOpacity(0.7),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                AuthButton(
                  onTap: () {
                    signIn(_IDController.text.trim(),
                        _passwordController.text.trim());
                  },
                  text: 'Sign In',
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    style: beitButtonStyle.green,
                    onPressed: () {
                      _IDController.text = "testall2";
                      _passwordController.text = "1234";
                    },
                    child: Text("auto(worker)")),
                ElevatedButton(
                    style: beitButtonStyle.green,
                    onPressed: () {
                      _IDController.text = "admin_jm";
                      _passwordController.text = "1234";
                    },
                    child: Text("auto(admin)")),
                Container(
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: CustomRichText(
                      discription: "I already Have an account?",
                      text: 'Sign Up',
                      onTap: () {
                        Get.to(() => SignUp(), transition: Transition.fadeIn);
                      },
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

void signIn(id, pw) async {
  var result = await Repository.signIn(id, pw);

  var loginStatus = result['rsMsg'] == "성공" ? true : false;
  if (loginStatus) {
    await prefs.setInt(
        'user_id', result['rsObj']['user_data']['user_data']['user_id']);
    await prefs.setString(
        'user_session', result['rsObj']['user_data']['user_session']);
    await prefs.setString('ID', id);
    await prefs.setString('password', pw);
    UserInfo.ID = id;
    UserInfo.userId = result['rsObj']['user_data']['user_data']['user_id'];
    UserInfo.password = pw;
    UserInfo.userSession = result['rsObj']['user_data']['user_session'];
    UserInfo.userName = result['rsObj']['user_data']['user_data']['user_name'];
    UserInfo.sceneId =
        result['rsObj']['user_data']['user_main_company']['scene_id'];
    UserInfo.sceneName = result['rsObj']['user_data']['user_main_company']
            ['scene_name'] ??
        "null";
    UserInfo.company =
        result['rsObj']['user_data']['user_main_company']['company_name'];
    DynamicUserInfo dynamicUserInfo = Get.put(DynamicUserInfo());
    print(
        "info : ${UserInfo.userId} / ${UserInfo.userSession} / ${UserInfo.ID} / ${UserInfo.password} / ${UserInfo.company}/ ${UserInfo.sceneId}");
    bool? isAdmin = result?['rsObj']['admin_menu'] == null ? false : true;
    print(
        "------------------------User State : ${dynamicUserInfo.userState}-------------------- IS ADMIN : ${isAdmin} --------------------------------------------------------- ");
    if (!isAdmin) {
      Get.off(() => DashBoard());
    } else {
      UserInfo.sceneName =
          result['rsObj']['user_data']['user_permission']['scene_name'];
      UserInfo.sceneId =
          result['rsObj']['user_data']['user_permission']['scene_id'];
      Get.off(() => AdDashBoard(),
          arguments: {"menu": result['rsObj']['admin_menu']['data']['menu']});
    }
  } else {
    Get.defaultDialog(title: 'Dialog', middleText: '${result['rsMsg']}');
  }
}
