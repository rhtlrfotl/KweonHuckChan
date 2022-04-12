import 'dart:typed_data';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/cupertino.dart';

class UserFile {
  List<Dio.MultipartFile> _fileList = [];

  getFileList() {
    return _fileList;
  }


  List<Dio.MultipartFile> get fileList => _fileList;

  addFile2List(ValueNotifier<ByteData?> rawImage, String fileName) async {
    var byteFile = await Dio.MultipartFile.fromBytes(
        asUint8List(rawImage.value!.buffer, rawImage.value!),
        filename: fileName);
    _fileList.add(byteFile);
  }
  addFile2List2(Uint8List bytes, String fileName) async {
    var byteFile = await Dio.MultipartFile.fromBytes(bytes,filename: fileName);
    _fileList.add(byteFile);
  }

  Uint8List asUint8List(ByteBuffer buffer, ByteData byteData) {
    return buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
  }
}

class UserJson {
  var _insert = [];
  var _update = [];
  var _delete = [];

  Map<String, dynamic> toJson() => {
    '"insert"': _insert,
    '"update"': _update,
    '"delete"': _delete,
  };

  Map<String, dynamic> insertToJson(orderNo, viewType) => {
    '"order_no"': orderNo,
    '"view_type"': viewType,
  };
  Map<String, dynamic> deleteToJson(seqNo, viewType) => {
    '"seq_no"': seqNo,
    '"view_type"': viewType,
  };

  addInsert(orderNo, viewType) {
    var row = insertToJson(orderNo, viewType);
    _insert.add(row);
  }
  addDelete(orderNo, viewType) {
    var row = deleteToJson(orderNo, "${viewType}");
    _delete.add(row);
  }

  get insert => _insert;

  set insert(value) {
    _insert = value;
  }

  get update => _update;

  set update(value) {
    _update = value;
  }

  get delete => _delete;

  set delete(value) {
    _delete = value;
  }
}


