import 'package:get/get.dart';
import 'package:plant_ui/FcmView.dart';

import '../modules/fcm/bindings/fcm_binding.dart';
import '../modules/fcm/views/fcm_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/textspeech/textspeech.dart';
import '../modules/textspeech/textspeech.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FCM;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.TextSpeech,
      page: () => TextSpeech(),
    ),
    GetPage(
      name: _Paths.FCM,
      page: () => FCMPage(),
      // binding: FcmBinding(),
    ),
  ];
}
