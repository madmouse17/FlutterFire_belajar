import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class LoginProvider extends GetConnect {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  void onInit() {
    httpClient.baseUrl = '192.168.99.44/laravel_cobaapi/public/api/login';
  }

  void postLogin() async {
    try {
      var response = await Dio().post(
          '192.168.99.44/laravel_cobaapi/public/api/login',
          queryParameters: {"email": emailC, "password": passC});
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
