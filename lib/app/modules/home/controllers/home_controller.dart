import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  postLogin() async {
    var url =
        Uri.parse('http://192.168.99.44/laravel_cobaapi/public/api/login');
    var map = <String, dynamic>{};
    map['email'] = emailC.text;
    map["password"] = passC.text;
    var response = await http.post(url, body: map);

    print(response.body);
  }
  // postLogin() async {
  //   try {
  //     var response = await Dio().post(
  //         'http://192.168.99.44/laravel_cobaapi/public/api/login',
  //         data: {"email": emailC.text, "password": passC.text});
  //     print(response.data);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
