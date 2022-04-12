import 'dart:math';
import 'package:crypto/crypto.dart';
import 'dart:convert'; // for the utf8.encode method

class WebConfig {
  // static String host = "http://api.kunyoungcms.co.kr";
  // static String host = 'http://192.168.0.40:8085';
  static String host = 'http://27.96.130.75:8085';
  static String platformType = '3';
  static String platformKey = '';

  static makePlatfromKey(){
    var bytes = utf8.encode((Random().nextInt(9999999)*Random().nextInt(9999999)).toString()); // data being hashed
    var digest = sha1.convert(bytes);
    print("platformKey : $digest");
    platformKey = digest.toString();
  }
}
