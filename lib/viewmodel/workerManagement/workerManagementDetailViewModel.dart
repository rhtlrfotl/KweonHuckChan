import 'package:get/get.dart';

class WorkerManagementDetailViewModel extends GetxController {
  Detail? detail;

  Future<void> fetchWorkerManagementDetail(viewUserId) async {
    update();
  }
}

class Detail {
  var userName;
  var phone;
  var birth;
  var age;
  var address;
  var detailAddress;
  var career;
  var nation;
  var education;
  var driversLicenseNumber;
  var urgentUserName;
  var urgentPhone;
  var urgentRel;
  var sceneInfoList;
  var fileData;
}
