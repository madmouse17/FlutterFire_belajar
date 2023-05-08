import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/fcm_controller.dart';

class FcmView extends GetView<FcmController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FcmView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FcmView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
