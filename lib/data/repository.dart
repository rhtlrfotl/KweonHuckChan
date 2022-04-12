import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../config/userinfo.dart';
import '../config/webconfig.dart';

//모든 서버요청은 여기에
class Repository{

  ///로그인
  static signIn(id,pw) async{
    var dio = Dio();
    try{
      var response = await dio.post(
          WebConfig.host + "/ui/signUp/Check_UserLogin",
          queryParameters: {
            'auth_id': id,
            'auth_token': pw,
            'auth_type': 1,
            'platform_key': WebConfig.platformKey,
            'platform_type': WebConfig.platformType
          });
      return response.data;
    }
    catch(e){
      return e;
    }
  }

  ///공지사항
  //업체 리스트 불러오기
  // static getCompany() async {
  //   var dio = Dio();
  //   try {
  //     var response = await dio.post(
  //         WebConfig.host + "/ctgo/Get_CtgoCompany_List_User",
  //         data: FormData.fromMap({
  //           'platform_type': WebConfig.platformType,
  //           'platform_key': WebConfig.platformKey,
  //           'user_id': UserInfo.userId,
  //           'user_session': UserInfo.userSession,
  //           'scene_id': UserInfo.sceneId,
  //           'scene_ids': '["${UserInfo.sceneId}"]',
  //         }),
  //         options:
  //         Options(contentType: Headers.formUrlEncodedContentType));
  //
  //     return response.data;
  //   }
  //   catch(e){
  //     return e;
  //   }
  // }
  // //현장 리스트 불러오기
  // static getScene() async {
  //   print("GET SCENE : ${UserInfo.sceneId} / ${UserInfo.sceneName}");
  //   var dio = Dio();
  //   try {
  //     var response = await dio.post(WebConfig.host + "/scene/Get_Scene_Combo",
  //         data: FormData.fromMap({
  //           'platform_type': WebConfig.platformType,
  //           'platform_key': WebConfig.platformKey,
  //           'user_id': UserInfo.userId,
  //           'user_session': UserInfo.userSession,
  //           'scene_id': UserInfo.sceneId,
  //           'scene_ids': '["${UserInfo.sceneId}"]',
  //         }),
  //         options:
  //         Options(contentType: Headers.formUrlEncodedContentType));
  //
  //     return response.data;
  //   }
  //   catch(e){
  //     return e;
  //   }
  // }
  // //공지사항 리스트 불러오기
  // static getNotice(companyIds) async {
  //   var formData = {
  //     'platform_type': WebConfig.platformType,
  //     'platform_key': WebConfig.platformKey,
  //     'user_id': UserInfo.userId,
  //     'user_session': UserInfo.userSession,
  //     'scene_id': UserInfo.sceneId,
  //     'scene_ids': '["${UserInfo.sceneId}"]',
  //     'company_ids' : '["${companyIds}"]',
  //   };
  //   var dio = Dio();
  //   try {
  //     var response = await dio.post(
  //         WebConfig.host + "/ui/Notice/Get_NoticeList",
  //         data: FormData.fromMap(formData),
  //         options:
  //         Options(contentType: Headers.formUrlEncodedContentType));
  //
  //     return response.data;
  //
  //   }
  //   catch(e){
  //     return e;
  //   }
  // }
  //게시글 등록
  static postNoticeDetail(title,desc, json) async{
    var formData = FormData.fromMap(json);
    try {
      var dio = Dio();
      var response = await dio.post(WebConfig.host + '/ui/Notice/Insert_Notice',
          data: formData,
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      print(response.data);
    }
    catch(e){
      return e;
    }
  }
  //게시글 삭제
  static deleteNoticeDeatail(noticeId) async{
    var dio = Dio();
    try {
      var response = await dio.post(
          WebConfig.host + "/ui/Notice/Update_NoticeDelete",
          data: FormData.fromMap({
            'platform_type': WebConfig.platformType,
            'platform_key': WebConfig.platformKey,
            'user_id': UserInfo.userId,
            'user_session': UserInfo.userSession,
            'scene_id': UserInfo.sceneId,
            'scene_ids': '["${UserInfo.sceneId}"]',
            'notice_ids': '[$noticeId]'
          }),
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      var result = response.data['rsMsg'] == "성공" ? true : false;
      return result;
    }
    catch(e){
      return e;
    }
  }
  //게시글 등록(파일)
  static postRequestWithFile(title,desc,List<File> files, json) async{
    var formData = FormData.fromMap(json);
    try {
      var dio = Dio();
      var response = await dio.post(WebConfig.host + '/ui/Notice/Insert_Notice',
          data: formData,
          options: Options(contentType: Headers.formUrlEncodedContentType));
    }
    catch(e){
      return e;
    }
  }
  //게시글 조회
  static getNoticeDetail(noticeId) async {
    var dio = Dio();
    try {
      var response = await dio.post(
          WebConfig.host + "/ui/Notice/Get_NoticeData",
          data: FormData.fromMap({
            'platform_type': WebConfig.platformType,
            'platform_key': WebConfig.platformKey,
            'user_id': UserInfo.userId,
            'user_session': UserInfo.userSession,
            'scene_id': UserInfo.sceneId,
            'scene_ids': '["${UserInfo.sceneId}"]',
            'notice_id': noticeId
          }),
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      print(jsonEncode(response.data['rsObj']));
      return response.data;
    }
    catch(e){
      return e;
    }
  }
  //게시글 수정
  static updateNoticeDetail(title,desc, json) async{
    try {
      var dio = Dio();
      var response = await dio.post(WebConfig.host + '/ui/Notice/Update_Notice',
          data: json,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      return response.data;
    }
    catch (e) {
      return e;
    }
  }
  //게시글 수정(파일)
  static updateNoticeDetailWithFile(title,desc, json) async{
    var formData = FormData.fromMap(json);
    try {
      var dio = Dio();
      var response = await dio.post(WebConfig.host + '/ui/Notice/Update_Notice',
          data: formData,
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      print(response.data);
      return response.data;
    }
    catch(e){
      return e;
    }
  }


  ///작업허가요청
  //미확인
  static getNoticeCheck() async{
    var dio = Dio();
    try {
      var response = await dio.post(
          WebConfig.host + "/ui/Notice/Get_NoticeList_Work",
          data: FormData.fromMap({
            'platform_type': WebConfig.platformType,
            'platform_key': WebConfig.platformKey,
            'user_id': UserInfo.userId,
            'user_session': UserInfo.userSession,
            'scene_id': 1,
            'scene_ids': '["-1"]',
          }),
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      return response.data;
    }
    catch(e){
      return e;
    }
  }
  //위험성평가서 확인
  static getRiskAssessment() async {
    var formData = FormData.fromMap({
      'platform_type': WebConfig.platformType,
      'platform_key': WebConfig.platformKey,
      'user_id': UserInfo.userId,
      'user_session': UserInfo.userSession,
      'scene_id': UserInfo.sceneId,
      'scene_ids': '["${UserInfo.sceneId}"]',
    });

    try {
      var dio = Dio();
      var response = await dio.post(
          WebConfig.host + '/ui/RiskAssessment/Get_RiskAssessmentData_Work',
          data: formData,
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      return response.data;
    }
    catch(e){
      return e;
    }
  }


  ///SOS 응급호출
  //sos 요청
  static requestFCM(title, body) async {
    Dio dio = new Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["authorization"] =
    "key=AAAAqCrspBk:APA91bFl-jzivtlTl4lnt35ihYCfqRL_JUR13jOZY63IxoMW_wlU7jrkqxIFeQgvNQ-5ozpu0xF1nmrXfxBR4-ac93FGmGgega30iQxN4JsxYTolZdgRGhsi0YsnW-IcnSfUJ4GYvNkx";
    try{
      var response = await dio.post('https://fcm.googleapis.com/fcm/send', data: {
        "to": "/topics/sos",
        "notification": {
          "title": title,
          "body": body,
          "image": "https://dummyimage.com/600x400/147d13/bf1383"
        }
      });
      return "success";
    }
    catch(e){
      print(e);
      return "fail to push event";
    }
  }

  ///금일 교육
  //금일교육 불러오기
  static getTodaysEducation() async{
    var formData = FormData.fromMap({
      'platform_type': WebConfig.platformType,
      'platform_key': WebConfig.platformKey,
      'user_id': UserInfo.userId,
      'user_session': UserInfo.userSession,
      'scene_id': UserInfo.sceneId,
      'scene_ids': '["${UserInfo.sceneId}"]',
    });

    try {
      var dio = Dio();
      var response = await dio.post(
          WebConfig.host + '/education/Get_EduToday',
          data: formData,
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      return response.data;
    }
    catch(e){
      return e;
    }
  }
  //금일교육 체크
  static checkTodaysEducation() async{
    var formData = FormData.fromMap({
      'platform_type': WebConfig.platformType,
      'platform_key': WebConfig.platformKey,
      'user_id': UserInfo.userId,
      'user_session': UserInfo.userSession,
      'scene_id': UserInfo.sceneId,
      'scene_ids': '["${UserInfo.sceneId}"]',
    });

    try {
      var dio = Dio();
      var response = await dio.post(
          WebConfig.host + '/education/Check_EduState',
          data: formData,
          options:
          Options(contentType: Headers.formUrlEncodedContentType));
      return response.data;
    }
    catch(e){
      return e;
    }
  }

  static void printLongString(String text) {
    final RegExp pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern
        .allMatches(text)
        .forEach((RegExpMatch match) => print(match.group(0)));
  }
}