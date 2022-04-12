import 'package:beitflutter/screens/admin/adDashBoard.dart';
import 'package:beitflutter/screens/worker/auth/signin.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/utils/notificaitonController.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'config/globalVariable.dart';
import 'config/userinfo.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform
  // );

  runApp(GetMaterialApp(
    theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.green)),
    home: MyApp(),
    builder: EasyLoading.init(),
    getPages: [
      GetPage(name: '/admin/dashBoard', page: () => AdDashBoard()),
    ],
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotificationController notificationController =
      NotificationController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late DynamicUserInfo dynamicUserInfo;

  @override
  void initState() {
    super.initState();
    dynamicUserInfo = Get.put(DynamicUserInfo());
    // notificationController.initialize();
    // _tagRead();
  }

  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
