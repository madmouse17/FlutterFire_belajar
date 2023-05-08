import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:upgrader/upgrader.dart';
import 'package:in_app_update/in_app_update.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  var passC = TextEditingController();
  var emailC = TextEditingController();
  var nameC = TextEditingController();
  // final appcastURL =
  //     'https://raw.githubusercontent.com/madmouse17/appcast-antreanmu/main/cast.xml';
  final cfg = AppcastConfiguration(
      url:
          'https://raw.githubusercontent.com/madmouse17/appcast-antreanmu/main/cast.xml',
      supportedOS: ['android']);

  AppUpdateInfo? updateInfo;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();

  bool flexibleUpdateAvailable = false;

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      updateInfo = info;
      update();
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  postRegister() async {
    var url =
        Uri.parse('http://192.168.99.44/laravel_cobaapi/public/api/register');
    var map = <String, dynamic>{};
    map['email'] = emailC.text;
    map["password"] = passC.text;
    map["name"] = nameC.text;
    var response = await http.post(url, body: map);

    print(response.body);
  }
}
