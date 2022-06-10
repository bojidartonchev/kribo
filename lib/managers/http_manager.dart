import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';


class HttpManager extends HttpOverrides with ChangeNotifier{
  static final HttpManager _singleton = HttpManager._internal();

  factory HttpManager() {
    return _singleton;
  }

  HttpManager._internal();

  Future<void> init() async {
    HttpOverrides.global = HttpManager();
  }

  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}