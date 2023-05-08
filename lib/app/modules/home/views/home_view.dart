import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_ui/app/routes/app_pages.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        renderPanelSheet: false,
        panel: LoginWidget(),
        // collapsed: SlidingWidget(),
        body: Container(
          child: Lottie.asset('assets/lootie/login.json'),
        ),
      ),
    );
  }
}

class SlidingWidget extends StatelessWidget {
  const SlidingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3,
      child: Icon(Icons.swipe_up),
    );
  }
}

class LoginWidget extends GetView<HomeController> {
  const LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 202, 221, 231),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              Icons.keyboard_double_arrow_up_rounded,
              color: Colors.white,
              size: Get.height * 0.05,
            ),
            // Text(
            //   "Swipe Up",
            //   style: Get.textTheme.headline5!.copyWith(color: Colors.white),
            // ),
            SizedBox(
              height: Get.height * 0.08,
            ),
            TextFormField(
              controller: controller.emailC,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'masukkan username',
                  labelText: 'Username'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: controller.passC,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                    labelText: 'Password'),
                obscureText: true,
              ),
            ),
            ElevatedButton(
              onPressed: () => controller.postLogin(),
              child: Text(
                'Login',
                style: Get.textTheme.headline5!.copyWith(color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.REGISTER),
              child: Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Belum Punya Akun? "),
                      TextSpan(
                        text: "Buat Akun",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
