import 'package:get/get.dart';

class UserInfo {
  static String userSession = '';
  static int userId = -1;
  static int sceneId = -1;
  static String sceneName = "";
  static String userName = "";
  static String ID = '';
  static String password = '';
  static String company = '';
  static bool isAdmin = false;
}

class DynamicUserInfo extends GetxController{
  String userState = '';
  List<bool> TBMCheck = [false,false,false];
}
